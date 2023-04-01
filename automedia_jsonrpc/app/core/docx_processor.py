import docx


def extract_text_from_docx_file(file_path):
    """An internal function to deal with local DOCX files

    This method is used by `extract_text_from_remote_url` and `extract_text_from_raw_image`. 
    Note that local in this method refers local to the server, NOT to the client.

    Args:
        file_path (str): The local path to the DOCX file.

    Return:
        dict. A dict containing the string containing the text in the `data` attribute.

    Raises:
        OSError.
    """
    doc = docx.Document(file_path)
    full_text = []
    for para in doc.paragraphs:
        full_text.append(para.text)
    return {
        "path": file_path,
        "data": '\n'.join(full_text)
    }