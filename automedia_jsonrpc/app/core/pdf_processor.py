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

import logging
import os
import uuid

import fitz


def extract_text_from_pdf_file(file_path):
    """An internal function to extract text from local PDF files

    This method is used by `extract_text_from_remote_url` and `extract_text_from_raw_image`. 
    Note that local in this method refers local to the server, NOT to the client.

    Args:
        file_path (str): The local path to the PDF file.

    Return:
        str. A string containing the text.

    Raises:
        OSError.
    """
    with fitz.open(file_path) as doc:
        text = ""
        for page in doc:  # iterate the document pages
            text += page.get_text().encode("utf8").decode() + "\n" # get plain text (is in UTF-8)
    return text


def extract_files_from_pdf_file(file_path):
    """An internal function to extract images from local PDF files

    This method is used by `extract_files` and `extract_files`. 
    Note that local in this method refers local to the server, NOT to the client.

    Note that deprecated functions can be found here: https://pymupdf.readthedocs.io/en/latest/znames.html

    Args:
        file_path (str): The local path to the PDF file.

    Return:
        list. List of extracted files.
    """
    # Open the PDF file
    pdf_file = fitz.open(file_path)
    file_name = os.path.basename(file_path)

    extraction_folder_name = os.path.join("/data", uuid.uuid4().hex)
    os.mkdir(extraction_folder_name)

    file_paths = []
    # Loop through each page of the PDF file
    for page_num in range(pdf_file.page_count):
        page = pdf_file[page_num]
        
        # Loop through each image on the page
        for i, image in enumerate(page.get_images()):
            xref = image[0]
            pix = fitz.Pixmap(pdf_file, xref)
            
            # Save the image to a file
            extracted_file_path = os.path.join(extraction_folder_name, f"{file_name}-page{page_num+1}_image{xref}.png")
            if pix.n < 5:
                pix.save(extracted_file_path)
            else:
                pix1 = fitz.Pixmap(fitz.csRGB, pix)
                pix1.save(extracted_file_path)
                pix1 = None
            pix = None
            logging.info(f"Extracted file: {extracted_file_path}")
            file_paths.append(extracted_file_path)
    return file_paths