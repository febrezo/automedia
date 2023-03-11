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

import argparse
import base64
import logging
import json
import threading
import time
import os
from jsonrpc import JSONRPCResponseManager, dispatcher

from werkzeug.wrappers import Request, Response
from waitress import serve

import misc.text as text
import core.face_processor
import core.metadata_processor
import core.text_processor
# import core.yolo_processor

# Grabbing environment variables
LOG_LEVEL = os.environ.get("LOG_LEVEL", "INFO")

logging.basicConfig(
    level=LOG_LEVEL,
    format="[%(levelname)s] Automedia @ %(asctime)s | %(message)s",
    handlers=[
        logging.FileHandler(f'/log/automedia.log'),
        logging.StreamHandler()
    ]
)


@dispatcher.add_method
def get_file(file_path):
    """Get the specified file

    This function is potentially insecure at the moment as it grabs the contents of the
    specified file. This is mitigated by forcing that the path starts with '/data/' which
    is the standard response sent by Automedia. To be addressed in the future with better
    storage management.

    Args:
        file_path (str): The path within the server of the path. It SHOULD start with '/data/'.

    Returns:
        str. The Base64 encoded content of the file.
    
    Raises:
        ValueError. Whenever the method provided is not a valid one.
    """
    if not file_path.startswith("/data/"):
        raise ValueError("The path SHOULD start with '/data/'")
    
    with open(file_path, "rb") as image_file:
        data = base64.b64encode(image_file.read()).decode()
    
    return data

@dispatcher.add_method
def help(method=None):
    """Get server information

    Args:
        method (str): An optional method name to grab info.

    Returns:
        dict.
    
    Raises:
        ValueError. Whenever the method provided is not a valid one.
    """
    logging.debug(f"Grabbing help from the server…")
    METHODS = {
        "compare_faces": {
            "description": "A method that manually compares the encodings of two faces.",
            "params": {
                "face_encodings_1": "The encodings of the first image to compare.",
                "face_encodings_2": "The encodings of the second image to compare."
            },
            "returns": "A list of with the similarities discovered."
        },
        "extract_faces_from_raw_image": {
            "description": "Extracts existing faces from a Base64 encoded image.",
            "params": {
                "content": "The image to process Base64-encoded.",
            },
            "returns": "An object with the extracted data from the image."
        },
        "extract_faces_from_remote_url": {
            "description": "Extracts existing faces from a URL.",
            "params": {
                "url": "The URL address towards the image."
            },
            "returns": "An object with the extracted data from the image."
        },
        # "extract_objects_from_raw_image": {
        #     "description": "Extracts existing objects from a Base64 encoded image.",
        #     "params": {
        #         "raw": "The image to process Base64-encoded.",
        #     },
        #     "returns": "A list of str with the objects IDs found."
        # },
        # "extract_objects_from_remote_url": {
        #     "description": "Extracts existing objects from a URL.",
        #     "params": {
        #         "url": "The URL address towards the image.",
        #     },
        #     "returns": "A list of str with the objects IDs found."
        # },
        "extract_entities_from_text": {
            "description": "Extracts entities from text using NLP.",
            "params": {
                "text": "The text where the entities will be searched."
            },
            "returns": "A dictionary with the known elements in text."
        },
        "extract_entities_from_remote_url": {
            "description": "Extracts files from a URL.",
            "params": {
                "url": "The URL address towards the file.",
            },
            "returns": "A list of the paths to the extracted files."
        },
        "extract_entities_from_encoded_file": {
            "description": "Extracts files from a Base64 encoded file.",
            "params": {
                "content": "The file to process Base64-encoded.",
                "file_name": "The original file name of the encoded file."
            },
            "returns": "A list of the paths to the extracted files."
        },
        "extract_files_from_encoded_file": {
            "description": "Extracts known files from a Base64 encoded file. Acceptable files are: image files, PDF, DOCX, EML and PST",
            "params": {
                "content": "The file to process Base64-encoded.",
                "file_name": "The original file name of the encoded file."
            },
            "returns": "A str with the found text."
        },
        "extract_files_from_remote_url": {
            "description": "Extracts known files from a Base64 encoded file. Acceptable files are: image files, PDF, DOCX, EML and PST",
            "params": {
                "url": "The URL address towards the file."
            },
            "returns": "A str with the found text."
        },
        "extract_metadata_from_encoded_file": {
            "description": "Extracts existing faces from a Base64 encoded file.",
            "params": {
                "content": "The file to process Base64-encoded.",
                "file_name": "The original file name of the encoded file."
            },
            "returns": "An object with the extracted data from the image."
        },
        "extract_metadata_from_remote_url": {
            "description": "Extracts metadata from a file located at a URL addresss.",
            "params": {
                "url": "The URL address towards the file."
            },
            "returns": "An object with the extracted data from the image."
        },
        "extract_regex_from_text": {
            "description": "Extracts existing text from a Base64 encoded image.",
            "params": {
                "text": "The text where the regex will be searched.",
                "regex": "[Optional] A regex to be searched in the text.",
            },
            "returns": "A dictionary with the known elements in text ."
        },
        "extract_text_from_encoded_file": {
            "description": "Extracts existing text from a Base64 encoded file.",
            "params": {
                "content": "The file to process Base64-encoded.",
                "file_name": "The original file name of the encoded file."
            },
            "returns": "A str with the found text."
        },
        "extract_text_from_remote_url": {
            "description": "Extracts existing text from a URL.",
            "params": {
                "url": "The URL address towards the image."
            },
            "returns": "A str with the found text."
        },
        "get_file": {
            "description": "Gets the content of a file.",
            "params": {
                "path": "The path of the file to grab."
            },
            "returns": "A dict with this info."
        },
        "help": {
            "description": "Shows help about the JSON-RPC.",
            "params": {
                "method": "[Optional] The method about which grabbing the help."
            },
            "returns": "A dict with this info."
        },
        "info": {
            "description": "Shows some details about the server.",
            "params": {},
            "returns": "A dict with details about the server."
        },
    }
    if not method:
        return list(METHODS.keys())
    else:
        if method in METHODS.keys():
            return METHODS[method]
        else:
            raise ValueError(f"Method '{method}' is not a valid method.")

@dispatcher.add_method
def info():
    """Get server information

    Returns:
        dict.
    """
    logging.debug(f"Grabbing information from the server…")
    return {
        "name": f'Automedia {os.environ.get("AUTOMEDIA_VERSION", "dev")} JSON-RPC Server',
        "version": os.environ.get("AUTOMEDIA_VERSION", "dev"),
        "license": text.LICENSE_URL
    }


@Request.application
def application(request):
    # Check authentication
    if os.environ.get("JSONRPC_USER") == request.authorization.get("username") and os.environ.get("JSONRPC_PASS") == request.authorization.get("password"):
        response = JSONRPCResponseManager.handle(
            request.data,
            dispatcher
        )
        print(response.json)
        return Response(
            response.json,
            mimetype='application/json'
        )
    # Raise authentication error if the check fails
    else:
        error = {
            "error" : {
                "code" : -32769,
                "message" : "Authorization error"
            },
            "id" : request.json.get("id"),
            "jsonrpc" : "2.0"
        }
        return Response(
            json.dumps(error), 
            mimetype='application/json'
        )


def get_parser():
    """Defines the argument parser
    
    Returns:
        argparse.ArgumentParser.
    """
    parser = argparse.ArgumentParser(
        description= 'Automedia JSON-RPC Server | A tool to make it accesible for everyone and learn about image processing and to what extent we are exposed,',
        add_help=False,
        conflict_handler='resolve'
    )

    # Selecting the platforms where performing the search
    group_server = parser.add_argument_group('JSON-RPC arguments', 'Configuration folders')
    group_server.add_argument('-h', '--host', metavar='<HOST>', required=False, default="0.0.0.0", action='store', help="the host where it will be launched. Note that '0.0.0.0' will make it accesible from outside and this can be dangerous. Default value: 0.0.0.0.")
    group_server.add_argument('-p', '--port', metavar='<PORT>', required=False, type=int, default=11321, action='store', help='select the port in which the JSON RPC server will be deployed. Default value: 11321.')
    group_server.add_argument('-t', '--threads', metavar='<NUM>', required=False, type=int, default=os.environ.get("JSONRPC_THREADS", os.cpu_count()/2), action='store', help=f"select the number of threads to be used. Default value: {os.environ.get('JSONRPC_THREADS', os.cpu_count()/2)}")
    group_server.add_argument('-l', '--log-level', metavar='<LOG_LEVEL>', required=False, default="INFO", action='store', choices=["DEBUG", "INFO", "WARNING", "ERROR"], help=f"the log level for the application. Default value: 'INFO'.")

    # About options
    group_about = parser.add_argument_group('About arguments', 'Showing additional information about this program.')
    group_about.add_argument('-h', '--help', action='help', help='shows this help and exists.')
    group_about.add_argument('--version', action='version', version=f'[%(prog)s] Automedia {os.environ.get("AUTOMEDIA_VERSION", "dev")}', help='shows the version of the program and exits.')

    return parser


def main(params=None):
    """Main method

    Args:
        params: A list with the parameters as grabbed by the terminal. It is
            None when this is called by an entry_point.
    
    Returns:
        dict: A Json representing the matching results.
    """
    print(text.welcome)

    if params is None:
        parser = get_parser()
        args = parser.parse_args(params)
    else:
        args = params

    logging.basicConfig(format='[%(levelname)s] Automedia: %(message)s', level=args.log_level)

    try:
        logging.info("Starting JSON-RPC server using waitress…")
        serve(
            application,
            host=args.host,
            port=args.port,
            threads=args.threads
        )
    except KeyboardInterrupt:
        loggin.info("Manually stopped by the user.")
    except OSError as e:
        logging.error(f"Something happened: '{e}'.")
    finally:
        logging.info("Safely closing the daemon…")


if __name__ == '__main__':
    main()
