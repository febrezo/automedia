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
import re
import requests
import tempfile
import uuid
from urllib.parse import urlparse
from PIL import Image
from jsonrpc import dispatcher

import gpyocr
from nltk import ne_chunk, pos_tag, word_tokenize
from nltk.tree import Tree
import nltk
from .file_processor import get_file_from_url
from .file_processor import get_file_from_encoded_content
from .docx_processor import extract_text_from_docx_file
from .pdf_processor import extract_text_from_pdf_file

@dispatcher.add_method
def extract_entities_from_text(text):
    """Extract persons from text

    Args:
        text (str): The text where the search will be performed.

    Returns:
        list.
    """
    nltk_results = ne_chunk(pos_tag(word_tokenize(text)))
    labels = {}
    for nltk_result in nltk_results:
        if type(nltk_result) == Tree:
            entity = ''
            for nltk_result_leaf in nltk_result.leaves():
                entity += nltk_result_leaf[0] + ' '
                label = nltk_result.label()
                if label in labels.keys():
                    labels[str(label)].append(str(entity))
                else:
                    labels[str(label)] = list([str(entity)])
    return labels

def extract_text_from_local_file(file_path):
    """An internal function to deal with local files

    This method is used by `extract_text_from_remote_url` and `extract_text_from_raw_image`. 
    Note that local in this method refers local to the server, NOT to the client.

    Args:
        file_path (str): The local path to the file.

    Return:
        str. The extracted text.

    Raises:
        NotImplementedError.
    """
    logging.debug(f"Loading the text extraction engine the contents of '{file_path}'…")
    if file_path.lower().endswith("pdf"):
        return extract_text_from_pdf_file(file_path)
    elif file_path.lower().endswith("docx"):
        return extract_text_from_docx_file(file_path)
    try: 
        return {
            "path": file_path,
            "data": gpyocr.tesseract_ocr(file_path)
        }
    except RuntimeError as _:
        raise NotImplementedError(f"The text extraction for the file type of '{file_path}' has not been implemented")


@dispatcher.add_method
def extract_text_from_remote_url(url):
    """Extract text from a URL

    Source will be set to the URL provided.

    Args:
        url (str): The remote URL to grab.

    Return:
        dict. A dict containing the metadata about the image.

    Raises:
        NotImplementedError.
    """
    temporary_full_path = get_file_from_url(url)
    return extract_text_from_local_file(
        file_path=temporary_full_path
    )


@dispatcher.add_method
def extract_text_from_encoded_file(content, file_name):
    """Extract text from a Base64 encoded image

    Args:
        content (str): The Base64 encoded file.
        file_name (str): The original file name of the encoded file.

    Return:
        str. The text extracted from the file.

    Raises:
        NotImplementedError.
    """
    temporary_full_path = get_file_from_encoded_content(content, file_name)
    return extract_text_from_local_file(
        file_path=temporary_full_path
    )

DEFINED_REGEX = {
    "DNI": "[0-9]{8}[ \-][A-Za-z]",
    "IPv4": re.compile(
        r"(?:0|25[0-5]|2[0-4][0-9]|1[0-9]?[0-9]?|[1-9][0-9]?)"
        r"(?:\.(?:0|25[0-5]|2[0-4][0-9]|1[0-9]?[0-9]?|[1-9][0-9]?)){3}"
    ),
    "Email": "[A-Za-z0-9\.\-\+]+@[A-Za-z0-9\-\.]+",
    "URL": re.compile(
        r'https?://'  # http:// or https://
        r'(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)+[A-Z]{2,6}\.?|'  # domain...
        r'localhost|'  # localhost...
        r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})' # ...or ip
        r'(?::\d+)?'  # optional port
        r'(?:/?|[/?]\S+)', 
        re.IGNORECASE
    ), # Used by Django at: https://github.com/django/django/blob/main/django/core/validators.py#L74
    "Bitcoin":  "(bc1|[13])[a-zA-HJ-NP-Z0-9]{25,39}",
}

@dispatcher.add_method
def extract_regex_from_text(text, regex=None):
    """A function to grab images with given text

    Args:
        text (str): The text where the search will be performed.
        regex (str): The regexp to search. If none, all default regexps will be searched.

    Return:
        dicr. A key-pair value where the key is the matching regexp: {
            "DNI": ["12345678", "87654321"]
        }
    
    Raises:
        re.error. Whenever a not valid regex is provided.
        ValueError. Whenever a string is expected but no text is received
    """
    if not isinstance(text, str):
        raise ValueError(f"String expected for the text to be analysed but '{text}' received")
    results = {}
    
    if not regex:
        for label, regex in DEFINED_REGEX.items():
            results[label] = re.findall(regex, text)
    else:
        if not isinstance(regex, str):
            raise ValueError(f"String expected for the regular expression but '{regex}' received")
        results["Custom Regex"] = re.findall(regex, text)
    
    return results 
