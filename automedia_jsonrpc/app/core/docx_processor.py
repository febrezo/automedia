import docx


def extract_text_from_docx_file(file_path):
    """An internal function to deal with local DOCX files

    This method is used by `extract_text_from_remote_url` and `extract_text_from_raw_image`. 
    Note that local in this method refers local to the server, NOT to the client.

    Args:
        file_path (str): The local path to the DOCX file.

    Return:
        str. A string containing the text.

    Raises:
        OSError.
    """
    doc = docx.Document(file_path)
    fullText = []
    for para in doc.paragraphs:
        fullText.append(para.text)
    return '\n'.join(fullText)