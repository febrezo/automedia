# Automedia

Copyright (C) 2023  F. Brezo ([@febrezo](https://mastodon.social/@febrezo))

[![License](https://img.shields.io/badge/license-GNU%20Affero%20General%20Public%20License%20Version%203%20or%20Later-blue.svg)]()

1 - Description
---------------

Automedia is a dockerized environment which provides easy-to-use methods to deal with some common document processing tasks. 
The environment is fully conceived to be started and managed using Dockerized containers.

2 - License: GNU AGPLv3+
------------------------

This is free software, and you are welcome to redistribute it under certain conditions.

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Affero General Public License for more details.

	You should have received a copy of the GNU Affero General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.


For more details on this issue, check the [COPYING](COPYING) file.

3 - Installation
----------------

This package makes use of third-party open source libraries which would (many) additional dependencies depending on your OS. 

The JSON-RPC server can be started using Docker-compose, a tool that is really helpful to administer several services at once and fix any dependencies.

```
$ docker-compose --version
docker-compose version 1.29.2, build unknown
```

Then, simply clone the repository. 
If you have `git` installed, it is a simple as:

```
$ git clone https://github.com/febrezo/automedia
$ cd automedia
```

By default, the project WILL use the `dev` environment variables as well as external port `11321`. 
This means that the environment variables will be grabbed from the `./config/dev/jsonrpc.env` which are set, by default at:
```
JSONRPC_USER=automedia
# Set (at least) this to something random
JSONRPC_PASS=automedia
JSONRPC_THREADS=4
```

In any case, this configuration can be used by default for testing purposes:

```
$ docker-compose up --build

        			    _         _                           _ _       
				   / \  _   _| |_ ___  _ __ ___   ___  __| (_) __ _ 
				  / _ \| | | | __/ _ \| '_ ` _ \ / _ \/ _` | |/ _` |
				 / ___ \ |_| | || (_) | | | | | |  __/ (_| | | (_| |
				/_/   \_\__,_|\__\___/|_| |_| |_|\___|\__,_|_|\__,_|
																	

                     Coded with ♥ by Félix Brezo based on Pyfaces since 2020

                                 License: AGPLv3                                 


                       -- Stay safe and be kind to others! --                       


[INFO] Automedia: Starting JSON-RPC server using waitress…
[INFO] Automedia: Serving on http://0.0.0.0:11321
```

The `--build` is only needed whenever you make changes in the code, so probably you might be using `docker-compose up` directly most of the times.
Note that you will need to keep the console opened.
If you want to let it work as a daemon (even if you close the current terminal), add the `-d` parameter:

```
$ docker-compose up -d
```

Note that Automedia tasks consumers may need to scale and may need more containers to consume the tasks.
This can be done using `--scale` when starting the application: 

```
$ docker-compose up --build --scale automedia_consumer=5
```

5 - JSON RPC Usage
-------------------

To use the JSON RPC you can build simple HTTP POST queries using the standard [JSON RPC 2.0](https://www.jsonrpc.org/specification) specification.
For example, to grab the possible methods using the `help` method without parameters:

```
$ curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": {}, "method": "info", "id": "0", "jsonrpc": "2.0"}' \
	localhost:11321
{
  "result": {
    "name": "Automedia dev JSON-RPC Server",
    "version": "dev",
    "license": "https://www.gnu.org/licenses/agpl-3.0.txt"
  },
  "id": "0",
  "jsonrpc": "2.0"
}
$ curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": {}, "method": "help", "id": "1", "jsonrpc": "2.0"}' \
	localhost:11321
{
  "result": [
    "compare_faces",
    "extract_faces_from_raw_image",
    "extract_faces_from_remote_url",
    "extract_entities_from_text",
    "extract_entities_from_remote_url",
    "extract_entities_from_encoded_file",
    "extract_files_from_encoded_file",
    "extract_files_from_remote_url",
    "extract_metadata_from_encoded_file",
    "extract_metadata_from_remote_url",
    "extract_regex_from_text",
    "extract_text_from_encoded_file",
    "extract_text_from_remote_url",
    "get_file",
    "help",
    "info"
  ],
  "id": "1",
  "jsonrpc": "2.0"
}

```

Note that the HTTP Basic Auth credentials in `curl` are passed using the `-u` parameter.
