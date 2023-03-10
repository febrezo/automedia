import base64
from jsonrpc import JSONRPCResponseManager, dispatcher
import logging
import os
from pathlib import Path
import requests
import tempfile
from urllib.parse import urlparse
import uuid

from .eml_processor import extract_files_from_eml_file
from .pdf_processor import extract_files_from_pdf_file
from .pst_processor import extract_files_from_pst_file


def get_file_from_url(url):
    """Download and create a temporary file from a URL

    Args:
        url (str): The remote URL to grab the content from.
    
    Returns:
        str. The full path of the contents.
    """
    logging.info(f"Downloading contents from '{url}'…")
    data = requests.get(url).content

    download_folder_name = os.path.join("/data", uuid.uuid4().hex)
    os.mkdir(download_folder_name)
    
    file_name = os.path.basename(urlparse(url).path)
    download_full_path = os.path.join(download_folder_name, file_name)
    
    logging.debug(f"Creating temporary file for the image grabbed from '{url}' as '{download_full_path}'…")
    with open(download_full_path, "wb") as output_file:
        output_file.write(data)
    
    return download_full_path


def get_file_from_encoded_content(content, file_name):
    """Download and create a temporary file from Base64 encoded content

    Args:
        content (str): The Base64 encoded content.
        file_name (str): The original file name of the encoded file.
    
    Returns:
        str. The full path of the contents.
    """
    logging.info(f"Decoding the contents '{content[:5]}…{content[-5:]}'…")
    data = base64.b64decode(content)

    download_folder_name = os.path.join("/data", uuid.uuid4().hex)
    os.mkdir(download_folder_name)
    download_full_path = os.path.join(download_folder_name, file_name)
    
    logging.debug(f"Creating temporary file for the file grabbed from '{content[:5]}…{content[-5:]}' as '{download_full_path}'…")
    with open(download_full_path, "wb") as output_file:
        output_file.write(data)
    
    return download_full_path


def extract_files_from_local_file(file_path):
    """An internal function to deal with local files

    This method is used by `extract_text_from_remote_url` and `extract_text_from_raw_image`. 
    Note that local in this method refers local to the server, NOT to the client.

    Args:
        file_path (str): The local path to the file.

    Return:
        list. A list of files extracted from the file.

    Raises:
        NotImplementedError.
    """
    logging.debug(f"Loading the file extraction engine the contents of '{file_path}'…")
    if file_path.lower().endswith("pdf"):
        return extract_files_from_pdf_file(file_path)
    elif file_path.lower().endswith("eml"):
        return extract_files_from_eml_file(file_path)
    elif file_path.lower().endswith("pst"):
        return extract_files_from_pst_file(file_path)
    else:
        raise NotImplementedError(f"The file extraction for the file type of '{file_path}' has not been implemented")


@dispatcher.add_method
def extract_files_from_remote_url(url):
    """Extract files from a remote file

    Args:
        url (str): The remote URL to grab.

    Return:
        list. A list of files extracted from the file.

    Raises:
        NotImplementedError.
    """
    temporary_full_path = get_file_from_url(url)
    return extract_files_from_local_file(
        file_path=temporary_full_path
    )


@dispatcher.add_method
def extract_files_from_encoded_file(content, file_name):
    """Extract text from a Base64 encoded image

    Args:
        encoded_content (str): The Base64 encoded image.
        file_name (str): The original file name of the encoded file.

    Return:
        list. A list of files extracted from the file.

    Raises:
        NotImplementedError.
    """
    temporary_full_path = get_file_from_encoded_content(content, file_name)
    return extract_files_from_local_file(
        file_path=temporary_full_path
    )