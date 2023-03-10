################################################################################
#
#    Copyright 2022-… @ Félix Brezo (@febrezo)
#
#    This program is part of Automedia. You can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################

import base64
import datetime as dt
import hashlib
import json
import logging
import os
import pathlib
import requests
import tempfile
import uuid
from urllib.parse import urlparse
from PIL import Image
from jsonrpc import dispatcher

import face_recognition
import numpy as np

from .file_processor import get_file_from_url
from .file_processor import get_file_from_encoded_content


@dispatcher.add_method
def compare_faces(face_encoding_1, face_encoding_2):
    """Compare two existing faces

    Args:
        face_encoding_1 (str): The path to the first face.
        face_encoding_2 (str): The path to the first face.

    Returns:
        float. The similarity between both faces
    """
    # Calculate distances
    new_numpy = np.array(face_encoding_2)

    try:    
        distance = float(
            face_recognition.face_distance(
                face_encoding_1,                        # It SHOULD BE a list of lists
                new_numpy                               # It SHOULD BE a numpy.array
            )
        )
    except TypeError:
        return TypeError("Parameters are not valid ones")

    return distance


def extract_faces_from_local_file(image_path, with_encodings=True):
    """An internal function to deal with loThis method is used by `extract_faces_from_remote_url` and `extract_faces_from_raw_image`. 
    Note that local in this method refers local to the server, NOT to the client.

    Args:
        image_path (str): The local path to the image.
        with_encodings (bool): Whether to return the encodings. 

    Return:
        list or dict. List of face_paths or dict of face_paths as keys with encodings as values.

    Raises:
        OSError.
    """

    logging.debug(f"Loading onto the face recognition engine the contents of '{image_path}'…")
    image_array = face_recognition.load_image_file(image_path)
    image = Image.fromarray(image_array)

    download_folder_name = os.path.join("/data", uuid.uuid4().hex)
    os.mkdir(download_folder_name)

    # Extract faces
    extracted_faces = {}
    max_width, max_height = image.size
    face_locations = face_recognition.face_locations(image_array)

    logging.info(f"{len(face_locations)} faces found in image located at path '{image_path}'. Snipping process is starting…")
    
    for i, f in enumerate(face_locations):
        logging.info(f"Snipping face #{i+1} from '{image_path}'…")
        # Cutting out the face
        top, right, bottom, left = f
        face_image_array = image_array[
            max(top-20, 0):min(bottom+20, max_height),
            max(left-20, 0):min(right+20, max_width)
        ]
        pil_image = Image.fromarray(face_image_array)

        face_md5 = hashlib.md5(pil_image.tobytes()).hexdigest()
        full_face_path = f"{uuid.uuid4().hex}.bmp"
        download_full_path = os.path.join(download_folder_name, full_face_path)
        pil_image.save(download_full_path)

        # Extract the encodings and saving them
        known_image = face_recognition.load_image_file(download_full_path)
        known_encodings = face_recognition.face_encodings(known_image)

        # Deal with Array object by converting to list. Remember to undo this!
        l = []
        for a in known_encodings:
            l.append(a.tolist())

        if l != []:
            logging.info(f"New face saved at '{download_full_path}'.")
            extracted_faces[download_full_path] = l
        else:
            pathlib.Path(download_full_path).unlink()

    if with_encodings:
        return extracted_faces
    else:
        return list(extracted_faces.keys())


@dispatcher.add_method
def extract_faces_from_remote_url(url, with_encodings=True):
    """Extract faces from a URL

    Source will be set to the URL provided.

    Args:
        url (str): The remote URL to grab.
        with_encodings (bool): Whether to return the encodings. 

    Return:
        dict. A dict containing the metadata about the image.

    Raises:
        OSError.
    """
    full_path = get_file_from_url(url)
    return extract_faces_from_local_file(
        image_path=full_path,
        with_encodings=with_encodings
    )


@dispatcher.add_method
def extract_faces_from_encoded_image(encoded_content, with_encodings=True):
    """Extract faces from a Base64 encoded image

    Args:
        encoded_content (str): The Base64 encoded image.
        with_encodings (bool): Whether to return the encodings. 

    Return:
        list. List of face_paths.

    Raises:
        OSError.
    """
    full_path = get_file_from_encoded_content(content, file_name)
    return extract_faces_from_local_file(
        image_path=full_path,
        with_encodings=with_encodings
    )


@dispatcher.add_method
def guess_face(image_id, force_recalculation=False):
    """Find the most appropiate match.

    This function starts a Task

    Args:
        image_id (str): The image ID of the face to guess.
        force_recalculation (bool): If True, it recalculates the process.

    Returns:
        dict. Containing the task details:
        {
            "total_comparisons": …,
            "results": [
                …
            ]
        }

    Raises:
        Exception.
        ValueError.
    """
    logging.info(f"Trying to find the most similar face to '{image_id}'…")

    # Check if the path provided already has an encoding
    if image_id not in ImageManager.encodings.keys():
        msg = f"Image '{image_id}' is not a registered face. Try extracting faces first."
        logging.error(msg)
        raise ValueError(msg)


    task = {
        "counter": len(ImageManager.encodings)-1,
        "comparisons": []
    }

    for known_face in sorted(ImageManager.encodings):
        if known_face != image_id:
            similarity = compare_faces (
                image_id,
                known_face,
                force_recalculation
            )
            try:
                task["comparisons"].append(
                    {
                        "known_face": known_face,
                        "similarity": similarity
                    }
                )
            except Exception as exc:
                msg = f'{known_face} generated an exception: {exc}'
                logging.warning(msg)

    logging.info(f"Ordering face comparisons done against '{image_id}'…")
    task["comparisons"] = sorted(task["comparisons"], key=lambda k: k["similarity"])
    return task
