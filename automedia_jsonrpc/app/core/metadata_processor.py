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
import logging
import os
import pathlib
import requests
import tempfile
import uuid
from urllib.parse import urlparse
from jsonrpc import dispatcher

from .file_processor import get_file_from_url
from .file_processor import get_file_from_encoded_content
from .eml_processor import extract_metadata_from_eml_file
from metafinder.utils.file.metadata import extract_metadata


def extract_metadata_from_local_file(file_path):
    """An internal function to deal with local files

    This method is used by `extract_metadata_from_remote_url` and `extract_metadata_from_raw_file`. 
    'Local' SHOULD be read as 'local' to the docker container. There is NO external interface
    to accept local (local to the host) files unless they are Base64 encoded 

    Args:
        file_path (str): The local path to the file.

    Return:
        dict. 

    Raises:
        OSError.
    """
    logging.debug(f"Creating information object for '{file_path}'…")
    if file_path.lower().endswith("eml"):
        return extract_metadata_from_eml_file(file_path)
    else:
        return {
            "path": file_path,
            "data": extract_metadata(file_path)
        }


@dispatcher.add_method
def extract_metadata_from_remote_url(url):
    """Extract metadata from a URL

    Source will be set to the URL provided.

    Args:
        url (str): The remote URL to grab.
        tags (list): The list of tags to be added.
        force_recalculation (bool): If True, it recalculates the extraction instead of reusing previous guesses.

    Return:
        dict. A dict containing the metadata about the image.

    Raises:
        OSError.
    """
    full_path = get_file_from_url(url)
    return extract_metadata_from_local_file(
        file_path=full_path,
    )


@dispatcher.add_method
def extract_metadata_from_encoded_file(content, file_name):
    """Extract metadata from a Base64 encoded image

    Args:
        content (str): The Base64 encoded image.
        file_name (str): The original file name of the encoded file.

    Return:
        dict. A dict containing the metadata about the image.

    Raises:
        OSError.
    """
    full_path = get_file_from_encoded_content(content, file_name)
    return extract_metadata_from_local_file(
        file_path=full_path
    )
