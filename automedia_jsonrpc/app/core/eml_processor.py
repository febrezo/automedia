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

import os
import email
from email import policy
from email.parser import BytesParser
import logging
import tempfile
import uuid


def extract_files_from_eml_file(file_path):
    """An internal function to extract images from local EML files

    This method is used by `extract_files` and `extract_files`. 
    Note that local in this method refers local to the server, NOT to the client.

    Args:
        file_path (str): The local path to the PDF file.

    Return:
        dict. A dict containing the `path` for the original EML file and extracted files as `data`.
    """
    file_paths = []
    try:
        extraction_folder_name = os.path.join("/data", uuid.uuid4().hex)
        os.mkdir(extraction_folder_name)
        
        with open(file_path, "r") as f:
            msg = email.message_from_file(f, policy=policy.default)
            for attachment in msg.iter_attachments():
                try:
                    output_filename = attachment.get_filename()
                except AttributeError:
                    logging.error(f"Got string instead of filename for '{f.name}'. Skipping.")
                    continue
                # If no attachments are found, skip this file
                if output_filename:
                    extracted_file_path = os.path.join(extraction_folder_name, output_filename)
                    with open(extracted_file_path, "wb") as of:
                        try:
                            of.write(attachment.get_payload(decode=True))
                        except TypeError:
                            logging.error(f"Couldn't get payload for '{output_filename}'")
                    logging.info(f"Extracted file: {extracted_file_path}")
                    file_paths.append(extracted_file_path)
            if len(file_paths) == 0:
                logging.info(f"No attachment found for file '{f.name}'!")
    except IOError as _:
        logging.error(f"Problem with '{f.name}' or one of its attachments!")
        raise _
    return {
        "path": file_path,
        "data": file_paths
    }


def extract_metadata_from_eml_file(file_path):
    """An internal function to deal with metadata from EML files

    This method is used by `extract_metadata_from_remote_url` and `extract_metadata_from_raw_file`. 
    'Local' SHOULD be read as 'local' to the docker container. There is NO external interface
    to accept local (local to the host) files unless they are Base64 encoded 

    Args:
        file_path (str): The local path to the file.

    Return:
        dict. A dict containing the `path` for the original EML file and `data` as a dict.

    Raises:
        OSError.
    """
    logging.debug(f"Extracting metadata from '{file_path}'…")
    metadata = {}
    with open(file_path, 'rb') as fp:
        msg = BytesParser(policy=policy.default).parse(fp)
        for k, v in msg.items():
            if k in metadata.keys():
                logging.warning(f"Metadata '{k}' was previously processed. Is this expected and should be processed as list?.")
                metadata[k] += f"\n{v}"
            else:
                metadata[k] = v
    return {
        "path": file_path,
        "data": metadata
    }
 