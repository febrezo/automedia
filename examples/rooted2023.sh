echo -e "\n************************************************************************"
echo "> Show info…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": {}, "method": "info", "id": "0", "jsonrpc": "2.0"}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Show help…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": {}, "method": "help", "id": "1", "jsonrpc": "2.0"}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract metadata from remote URL… Big thanks to Josue87 & MetaFinder!"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["https://bitcoin.org/files/bitcoin-paper/bitcoin_es.pdf"], "method": "extract_metadata_from_remote_url", "id": "3", "jsonrpc": "2.0"}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract metadata from remote URL… Big thanks to Josue87 & MetaFinder!"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["iVBORw0KGgoAAAANSUhEUgAAAHkAAAAyCAYAAAB4ZXTmAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAkklEQVR4nO3RAQnAMBDAwK5C3r/LTcUoNHcKAnlm5l1cbZ8O4H8mB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEfi5YBvRMdg9IAAAAASUVORK5CYII=", "example.png"], "method": "extract_metadata_from_encoded_file", "id": "4", "jsonrpc": "2.0"}' \
	localhost:11321
 echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract metadata from remote URL… Big thanks to Josue87 & MetaFinder!"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["https://raw.githubusercontent.com/FlexConfirmMail/Thunderbird/master/sample.eml"], "method": "extract_metadata_from_remote_url", "id": "4", "jsonrpc": "2.0"}' \
	localhost:11321
 echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract Named Entities from raw text… Big thanks to NLTK!"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["Yes, I am John Doe and I used to work for the FBI in Madrid (Spain). I was married with Jane Doe until 2022. I was born in Chicago and used to work for Microsoft."], "method": "extract_entities_from_text", "id": "5", "jsonrpc": "2.0"}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract regex from raw text… "
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["Yes, I am John Doe and I used to work for the FBI in Madrid (Spain). I was married with Jane Doe until 2022. I was born in Chicago and used to work for Microsoft. My email is johndoe@example.com."], "method": "extract_regex_from_text", "id": "5", "jsonrpc": "2.0"}' \
	localhost:11321
 echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract text from remote image… "
 curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["https://i.kym-cdn.com/photos/images/original/002/471/214/9ec.png"], "method": "extract_text_from_remote_url", "id": "11", "jsonrpc": "2.0"}' \
	localhost:11321 | jq
 echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract text from remote PDF file… "
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["https://bitcoin.org/files/bitcoin-paper/bitcoin_es.pdf"], "method": "extract_text_from_remote_url", "id": "11", "jsonrpc": "2.0"}' \
	localhost:11321 | jq
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract text from remote DOCX file… "
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["https://itise.ugr.es/SpringerContribution/142/142_ashour_Optimal%20combination%20forecast%20for%20Bitcoin%20dollars%20time%20series.docx"], "method": "extract_text_from_remote_url", "id": "11", "jsonrpc": "2.0"}' \
	localhost:11321 | jq
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract Named Entities from raw text…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["Elon Musk @\n@elonmusk\n\n\nNext I\"m gonna buy iFunny and\nfix the featured algorithm\n\n\n12:12 PM - 2022-04-25 - Twitter for iPhone\n\n\n226K Retweets 45.4K Quote Tweets 1.6M Likes"], "method": "extract_entities_from_text", "id": "5", "jsonrpc": "2.0"}' \
	localhost:11321
echo -e "\n************************************************************************"

echo -e "\n************************************************************************"
echo "> Extract files from PDF files…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["https://github.com/aspose-email/Aspose.Email-for-Java/raw/master/Examples/src/main/resources/outlook/sample.pst"], "method": "extract_files_from_remote_url", "id": "5", "jsonrpc": "2.0"}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract faces from remote URL…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["https://felixbrezo.com/img/hoodie.jpeg"], "method": "extract_faces_from_remote_url", "id": "5", "jsonrpc": "2.0"}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Get a file…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["/data/d241047a8d6340b7a10b0badd3c4ef21/2b7db691d1ff40388ea19119247fdb87.bmp"], "method": "get_file", "id": "5", "jsonrpc": "2.0"}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract faces from an image…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["https://piks.eldesmarque.com/bin/2021/04/13/copa_84jpg_001.jpg"], "method": "extract_faces_from_remote_url", "id": "5", "jsonrpc": "2.0"}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Eract faces from an image with its encodings…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{"params": ["https://piks.eldesmarque.com/bin/2021/04/13/copa_84jpg_001.jpg", false], "method": "extract_faces_from_remote_url", "id": "5", "jsonrpc": "2.0"}' \
	localhost:11321
echo -e "\n************************************************************************"
