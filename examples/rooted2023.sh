echo -e "\n************************************************************************"
echo "> Show info…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": {},
		"method": "info",
		"id": "0",
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Show help…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": {}, 
		"method": 
		"help", 
		"id": "1", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract metadata from remote URL… Big thanks to Josue87 & MetaFinder!"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://bitcoin.org/files/bitcoin-paper/bitcoin_es.pdf"
		], 
		"method": "extract_metadata_from_remote_url", 
		"id": "2", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract metadata from remote URL… Big thanks to Josue87 & MetaFinder!"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"iVBORw0KGgoAAAANSUhEUgAAAHkAAAAyCAYAAAB4ZXTmAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAkklEQVR4nO3RAQnAMBDAwK5C3r/LTcUoNHcKAnlm5l1cbZ8O4H8mB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEmB5gcYHKAyQEfi5YBvRMdg9IAAAAASUVORK5CYII=", 
			"example.png"
		], 
		"method": "extract_metadata_from_encoded_file", 
		"id": "3", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
 echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract metadata from remote URL… Big thanks to Josue87 & MetaFinder!"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://raw.githubusercontent.com/FlexConfirmMail/Thunderbird/master/sample.eml"
		], 
		"method": "extract_metadata_from_remote_url", 
		"id": "4", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
 echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract Named Entities from raw text… Big thanks to NLTK!"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"Yes, I am John Doe and I used to work for the FBI in Madrid (Spain). I was married with Jane Doe until 2022. I was born in Chicago and used to work for Microsoft."
		], 
		"method": "extract_entities_from_text", 
		"id": "5", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract regex from raw text… "
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"Yes, I am John Doe and I used to work for the FBI in Madrid (Spain). I was married with Jane Doe until 2022. I was born in Chicago and used to work for Microsoft. My email is johndoe@example.com."
		],
		"method": "extract_regex_from_text", 
		"id": "6", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
 echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract text from remote image… "
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": ["https://i.postimg.cc/htDh0kS0/image.jpg"], 
		"method": "extract_text_from_remote_url", 
		"id": "7", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
 echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract text from remote PDF file… "
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://bitcoin.org/files/bitcoin-paper/bitcoin_es.pdf"
		], 
		"method": "extract_text_from_remote_url", 
		"id": "8", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract text from remote DOCX file… "
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://itise.ugr.es/SpringerContribution/142/142_ashour_Optimal%20combination%20forecast%20for%20Bitcoin%20dollars%20time%20series.docx"
		], 
		"method": "extract_text_from_remote_url", 
		"id": "9", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract files from PDF files…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://github.com/aspose-email/Aspose.Email-for-Java/raw/master/Examples/src/main/resources/outlook/sample.pst"
		], 
		"method": "extract_files_from_remote_url", 
		"id": "10", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract faces from remote URL…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://felixbrezo.com/img/hoodie.jpeg"
		], 
		"method": "extract_faces_from_remote_url", 
		"id": "11", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract faces from remote URL…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://felixbrezo.com/img/hoodie.jpeg",
			false
		], 
		"method": "extract_faces_from_remote_url", 
		"id": "12", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"

echo -e "\n************************************************************************"
echo "> Get a file…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"/data/3cfc87c2acee4dcb81aa108362a508ae/a57d3a3bf88444169f03627ff9bcd83e.bmp"], 
		"method": "get_file", 
		"id": "13", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract faces from an image…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://piks.eldesmarque.com/bin/2021/04/13/copa_84jpg_001.jpg"
		], 
		"method": "extract_faces_from_remote_url", 
		"id": "14", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract face #1 from febrezo…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://content.gnoss.ws/imagenes/Documentos/ImagenesSemanticas/2ceb06ba-f6bf-41b1-a676-5a0a68068008/0a324865-3fc4-4a2a-a2e1-a6727ba002ea.jpg"
		], 
		"method": "extract_faces_from_remote_url", 
		"id": "15", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract face #2 from febrezo…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIw5F0eAzt-V95h1pMsP5siONqDJm2txtrzVQeEqvken7Yld-aSaAXhl59FuFdxVx-Rm0&usqp=CAU"
		], 
		"method": "extract_faces_from_remote_url", 
		"id": "16", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Extract face #3 from Alejandro…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			"https://www.hackbysecurity.com/images/easyblog_articles/58/b2ap3_amp_AlejandroRamos.png"
		], 
		"method": "extract_faces_from_remote_url", 
		"id": "17", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Compare different febrezo faces…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			[[-0.1717497855424881, 0.0062343645840883255, 0.08059137314558029, -0.015958134084939957, -0.14182260632514954, 0.006718016229569912, -0.06689545512199402, -0.05306903272867203, 0.15723834931850433, -0.03854022175073624, 0.14180682599544525, -0.07813166081905365, -0.1924321949481964, -0.0788264274597168, -0.07307396084070206, 0.09142052382230759, -0.13474248349666595, -0.18837805092334747, -0.033808693289756775, -0.10618127137422562, 0.013188975863158703, 0.08539607375860214, -0.019395295530557632, 0.04623841494321823, -0.13657623529434204, -0.39578694105148315, -0.03038877248764038, -0.17171096801757812, 0.0008605020120739937, -0.13012202084064484, -0.0395149290561676, 0.11551421135663986, -0.09372448176145554, -0.017842072993516922, 0.033244095742702484, 0.1732948124408722, 0.036380790174007416, -0.018479710444808006, 0.19103248417377472, 0.014204667881131172, -0.15639035403728485, 0.006518892012536526, -0.00432501919567585, 0.28551235795021057, 0.12385733425617218, 0.02116314508020878, 0.006998756900429726, -0.007165930233895779, 0.22858834266662598, -0.2241002768278122, 0.0220281183719635, 0.1990765482187271, 0.1986536681652069, -0.005997609347105026, 0.14458300173282623, -0.10174719989299774, -0.026851080358028412, 0.11677888035774231, -0.22050964832305908, 0.0813162550330162, -0.012379223480820656, -0.10148435831069946, -0.013959387317299843, -0.12367890775203705, 0.11153143644332886, 0.09930719435214996, -0.060433775186538696, -0.08994464576244354, 0.11329071968793869, -0.10661047697067261, -0.07136885076761246, 0.0657341480255127, -0.11053049564361572, -0.18264229595661163, -0.20926937460899353, 0.05479949712753296, 0.3828437030315399, 0.11519022285938263, -0.20911504328250885, 0.02698000892996788, 0.028684603050351143, -0.05998468026518822, -0.0011756038293242455, 0.027020497247576714, -0.14016947150230408, 0.05909290164709091, -0.12404736876487732, 0.035757288336753845, 0.1356167048215866, 0.0008336715400218964, 0.005725476425141096, 0.1042478084564209, -0.03711502254009247, 0.08867177367210388, 0.051725078374147415, 0.03332585096359253, -0.11738497763872147, 0.03727273643016815, -0.07448878139257431, -0.005429557524621487, 0.08727001398801804, -0.08367212116718292, 0.035821333527565, -0.030827295035123825, -0.13397641479969025, 0.12654569745063782, -0.06338515877723694, -0.054816827178001404, -0.11214251816272736, -0.035047609359025955, -0.05504518002271652, 0.09180330485105515, 0.2049756795167923, -0.24564605951309204, 0.16892613470554352, 0.127457395195961, -0.03268711268901825, 0.23125970363616943, 0.014599769376218319, -0.006405536085367203, -0.05364908277988434, -0.03499766066670418, -0.0879618227481842, -0.1448492407798767, 0.07754579186439514, -0.005962508264929056, 0.04816789552569389, 0.026505563408136368]],
			[[-0.05793803185224533, 0.028499292209744453, 0.07661665230989456, -0.010521700605750084, -0.035615310072898865, -0.043328650295734406, 0.032255273312330246, -0.01959090121090412, 0.13426825404167175, -0.03436654061079025, 0.13248927891254425, -0.08266932517290115, -0.24051664769649506, -0.04571278393268585, -0.03813348710536957, 0.0836876854300499, -0.10996567457914352, -0.14832058548927307, -0.06842488795518875, -0.08615926653146744, 0.06288833171129227, 0.0591796338558197, 0.0011880098609253764, 0.014956383034586906, -0.1905059516429901, -0.2780141830444336, -0.023411953821778297, -0.13546554744243622, 0.007107125595211983, -0.11715470254421234, -0.014594048261642456, 0.10835220664739609, -0.1286350041627884, -0.022184401750564575, 0.027696214616298676, 0.10949265211820602, 0.019189586862921715, -0.02564702183008194, 0.21217812597751617, 0.035649627447128296, -0.1680910587310791, -0.02971457690000534, 0.03685649484395981, 0.31941795349121094, 0.09476488828659058, 0.002732011489570141, -0.004008917137980461, 0.029031313955783844, 0.18795989453792572, -0.31667888164520264, 0.03569597378373146, 0.1404169648885727, 0.17984594404697418, 0.06348135322332382, 0.15556937456130981, -0.14276093244552612, 0.023723037913441658, 0.09841123968362808, -0.19096039235591888, 0.11361880600452423, -0.014335203915834427, -0.07049612700939178, 0.022657448425889015, -0.09686548262834549, 0.14762502908706665, 0.018383346498012543, -0.11222799867391586, 0.012861130759119987, 0.07857480645179749, -0.11946255713701248, -0.0158379003405571, 0.07647816091775894, -0.07330826669931412, -0.15197446942329407, -0.26568326354026794, 0.029063215479254723, 0.34683728218078613, 0.1187826544046402, -0.2019490897655487, 0.01920066773891449, -0.020163271576166153, -0.020711645483970642, 0.012949209660291672, 0.01686793752014637, -0.14119860529899597, 0.12584547698497772, -0.1280178278684616, 0.03116770088672638, 0.1705801784992218, -0.054102398455142975, 0.0009373276261612773, 0.15908414125442505, -0.033115286380052567, 0.03665938228368759, 0.029156364500522614, 0.02577238343656063, -0.12916217744350433, -0.05638113617897034, -0.08080122619867325, 0.009355057962238789, 0.08161050081253052, -0.1822650134563446, -0.013886763714253902, 0.052221037447452545, -0.21735592186450958, 0.11443926393985748, -0.02782718650996685, -0.07419663667678833, -0.06736211478710175, 0.034309905022382736, -0.0779784545302391, 0.01821291819214821, 0.15298676490783691, -0.2450719177722931, 0.12628597021102905, 0.17319883406162262, -0.0757521465420723, 0.15135730803012848, -0.012497462332248688, 0.014874801971018314, -0.07638552784919739, 0.008343305438756943, -0.04349389299750328, -0.1549689918756485, 0.05943650007247925, 0.01790473982691765, 0.01794610358774662, 0.008542003110051155]]
		], 
		"method": "compare_faces", 
		"id": "18", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Compare febrezo #1 with Alejandro…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			[[-0.1717497855424881, 0.0062343645840883255, 0.08059137314558029, -0.015958134084939957, -0.14182260632514954, 0.006718016229569912, -0.06689545512199402, -0.05306903272867203, 0.15723834931850433, -0.03854022175073624, 0.14180682599544525, -0.07813166081905365, -0.1924321949481964, -0.0788264274597168, -0.07307396084070206, 0.09142052382230759, -0.13474248349666595, -0.18837805092334747, -0.033808693289756775, -0.10618127137422562, 0.013188975863158703, 0.08539607375860214, -0.019395295530557632, 0.04623841494321823, -0.13657623529434204, -0.39578694105148315, -0.03038877248764038, -0.17171096801757812, 0.0008605020120739937, -0.13012202084064484, -0.0395149290561676, 0.11551421135663986, -0.09372448176145554, -0.017842072993516922, 0.033244095742702484, 0.1732948124408722, 0.036380790174007416, -0.018479710444808006, 0.19103248417377472, 0.014204667881131172, -0.15639035403728485, 0.006518892012536526, -0.00432501919567585, 0.28551235795021057, 0.12385733425617218, 0.02116314508020878, 0.006998756900429726, -0.007165930233895779, 0.22858834266662598, -0.2241002768278122, 0.0220281183719635, 0.1990765482187271, 0.1986536681652069, -0.005997609347105026, 0.14458300173282623, -0.10174719989299774, -0.026851080358028412, 0.11677888035774231, -0.22050964832305908, 0.0813162550330162, -0.012379223480820656, -0.10148435831069946, -0.013959387317299843, -0.12367890775203705, 0.11153143644332886, 0.09930719435214996, -0.060433775186538696, -0.08994464576244354, 0.11329071968793869, -0.10661047697067261, -0.07136885076761246, 0.0657341480255127, -0.11053049564361572, -0.18264229595661163, -0.20926937460899353, 0.05479949712753296, 0.3828437030315399, 0.11519022285938263, -0.20911504328250885, 0.02698000892996788, 0.028684603050351143, -0.05998468026518822, -0.0011756038293242455, 0.027020497247576714, -0.14016947150230408, 0.05909290164709091, -0.12404736876487732, 0.035757288336753845, 0.1356167048215866, 0.0008336715400218964, 0.005725476425141096, 0.1042478084564209, -0.03711502254009247, 0.08867177367210388, 0.051725078374147415, 0.03332585096359253, -0.11738497763872147, 0.03727273643016815, -0.07448878139257431, -0.005429557524621487, 0.08727001398801804, -0.08367212116718292, 0.035821333527565, -0.030827295035123825, -0.13397641479969025, 0.12654569745063782, -0.06338515877723694, -0.054816827178001404, -0.11214251816272736, -0.035047609359025955, -0.05504518002271652, 0.09180330485105515, 0.2049756795167923, -0.24564605951309204, 0.16892613470554352, 0.127457395195961, -0.03268711268901825, 0.23125970363616943, 0.014599769376218319, -0.006405536085367203, -0.05364908277988434, -0.03499766066670418, -0.0879618227481842, -0.1448492407798767, 0.07754579186439514, -0.005962508264929056, 0.04816789552569389, 0.026505563408136368]],
			[[-0.20961815118789673, 0.06105230748653412, 0.014036890119314194, -0.0495552234351635, -0.11377721279859543, -0.07528302073478699, 0.07221299409866333, -0.09181515872478485, 0.17199867963790894, -0.01223344262689352, 0.17170801758766174, 0.05393688380718231, -0.2401692420244217, -0.09862909466028214, 0.019095052033662796, 0.10495712608098984, -0.1208900436758995, -0.21160227060317993, -0.08712233603000641, -0.08424024283885956, 0.0643443763256073, -0.06427127122879028, -0.01702149026095867, -0.007999409921467304, -0.12114622443914413, -0.23151138424873352, -0.032669149339199066, -0.13614758849143982, 0.06547142565250397, -0.1577216386795044, 0.12080343812704086, -0.01855199970304966, -0.19439204037189484, -0.09853354841470718, 0.022512156516313553, 0.13858020305633545, -0.060158420354127884, -0.03838701546192169, 0.25341349840164185, -0.05963406711816788, -0.1675964742898941, -0.06292786449193954, 0.03081529587507248, 0.3072075843811035, 0.22277259826660156, -0.008151772432029247, 0.01966981589794159, -0.08702794462442398, 0.09443752467632294, -0.3183453679084778, 0.11259877681732178, 0.10037986934185028, 0.1534847915172577, 0.09169894456863403, 0.049393102526664734, -0.18481117486953735, 0.03767263516783714, 0.15214312076568604, -0.3061216473579407, 0.10409204661846161, 0.11634810268878937, -0.09241301566362381, -0.1303841918706894, -0.08238063752651215, 0.21043622493743896, 0.06016888841986656, -0.21372723579406738, -0.047274164855480194, 0.14816349744796753, -0.1635306477546692, -0.03894665464758873, 0.03744018077850342, -0.10627448558807373, -0.2295120358467102, -0.34706607460975647, 0.08364175260066986, 0.3752904534339905, 0.15706725418567657, -0.19040459394454956, -0.053027816116809845, -0.040193066000938416, 0.030054155737161636, -0.015673048794269562, 0.07442665845155716, -0.07745516300201416, -0.027692634612321854, -0.05729616433382034, 0.06609559059143066, 0.09359648823738098, 0.007030919194221497, -0.04064972698688507, 0.1534118950366974, 0.011625465005636215, -0.021428558975458145, -0.03970024734735489, 0.13507162034511566, -0.030093301087617874, -0.03864838182926178, -0.12630881369113922, 0.001214196439832449, 0.029221713542938232, -0.10574918985366821, 0.0497749038040638, 0.12043121457099915, -0.16021546721458435, 0.18556728959083557, 0.0033217747695744038, -0.02147534489631653, -0.09977619349956512, -0.1065196618437767, -0.05902140587568283, 0.020462218672037125, 0.15949882566928864, -0.24322275817394257, 0.26638826727867126, 0.28189152479171753, 0.004669694229960442, 0.1482163369655609, 0.02986069954931736, -0.000682314857840538, 0.033924419432878494, -0.009296289645135403, -0.18183429539203644, -0.027455387637019157, -0.030691448599100113, -0.024062005802989006, 0.06612871587276459, 0.07825887203216553]]
		], 
		"method": "compare_faces", 
		"id": "19", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Compare febrezo #2 with Alejandro…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			[[-0.05793803185224533, 0.028499292209744453, 0.07661665230989456, -0.010521700605750084, -0.035615310072898865, -0.043328650295734406, 0.032255273312330246, -0.01959090121090412, 0.13426825404167175, -0.03436654061079025, 0.13248927891254425, -0.08266932517290115, -0.24051664769649506, -0.04571278393268585, -0.03813348710536957, 0.0836876854300499, -0.10996567457914352, -0.14832058548927307, -0.06842488795518875, -0.08615926653146744, 0.06288833171129227, 0.0591796338558197, 0.0011880098609253764, 0.014956383034586906, -0.1905059516429901, -0.2780141830444336, -0.023411953821778297, -0.13546554744243622, 0.007107125595211983, -0.11715470254421234, -0.014594048261642456, 0.10835220664739609, -0.1286350041627884, -0.022184401750564575, 0.027696214616298676, 0.10949265211820602, 0.019189586862921715, -0.02564702183008194, 0.21217812597751617, 0.035649627447128296, -0.1680910587310791, -0.02971457690000534, 0.03685649484395981, 0.31941795349121094, 0.09476488828659058, 0.002732011489570141, -0.004008917137980461, 0.029031313955783844, 0.18795989453792572, -0.31667888164520264, 0.03569597378373146, 0.1404169648885727, 0.17984594404697418, 0.06348135322332382, 0.15556937456130981, -0.14276093244552612, 0.023723037913441658, 0.09841123968362808, -0.19096039235591888, 0.11361880600452423, -0.014335203915834427, -0.07049612700939178, 0.022657448425889015, -0.09686548262834549, 0.14762502908706665, 0.018383346498012543, -0.11222799867391586, 0.012861130759119987, 0.07857480645179749, -0.11946255713701248, -0.0158379003405571, 0.07647816091775894, -0.07330826669931412, -0.15197446942329407, -0.26568326354026794, 0.029063215479254723, 0.34683728218078613, 0.1187826544046402, -0.2019490897655487, 0.01920066773891449, -0.020163271576166153, -0.020711645483970642, 0.012949209660291672, 0.01686793752014637, -0.14119860529899597, 0.12584547698497772, -0.1280178278684616, 0.03116770088672638, 0.1705801784992218, -0.054102398455142975, 0.0009373276261612773, 0.15908414125442505, -0.033115286380052567, 0.03665938228368759, 0.029156364500522614, 0.02577238343656063, -0.12916217744350433, -0.05638113617897034, -0.08080122619867325, 0.009355057962238789, 0.08161050081253052, -0.1822650134563446, -0.013886763714253902, 0.052221037447452545, -0.21735592186450958, 0.11443926393985748, -0.02782718650996685, -0.07419663667678833, -0.06736211478710175, 0.034309905022382736, -0.0779784545302391, 0.01821291819214821, 0.15298676490783691, -0.2450719177722931, 0.12628597021102905, 0.17319883406162262, -0.0757521465420723, 0.15135730803012848, -0.012497462332248688, 0.014874801971018314, -0.07638552784919739, 0.008343305438756943, -0.04349389299750328, -0.1549689918756485, 0.05943650007247925, 0.01790473982691765, 0.01794610358774662, 0.008542003110051155]],
			[[-0.20961815118789673, 0.06105230748653412, 0.014036890119314194, -0.0495552234351635, -0.11377721279859543, -0.07528302073478699, 0.07221299409866333, -0.09181515872478485, 0.17199867963790894, -0.01223344262689352, 0.17170801758766174, 0.05393688380718231, -0.2401692420244217, -0.09862909466028214, 0.019095052033662796, 0.10495712608098984, -0.1208900436758995, -0.21160227060317993, -0.08712233603000641, -0.08424024283885956, 0.0643443763256073, -0.06427127122879028, -0.01702149026095867, -0.007999409921467304, -0.12114622443914413, -0.23151138424873352, -0.032669149339199066, -0.13614758849143982, 0.06547142565250397, -0.1577216386795044, 0.12080343812704086, -0.01855199970304966, -0.19439204037189484, -0.09853354841470718, 0.022512156516313553, 0.13858020305633545, -0.060158420354127884, -0.03838701546192169, 0.25341349840164185, -0.05963406711816788, -0.1675964742898941, -0.06292786449193954, 0.03081529587507248, 0.3072075843811035, 0.22277259826660156, -0.008151772432029247, 0.01966981589794159, -0.08702794462442398, 0.09443752467632294, -0.3183453679084778, 0.11259877681732178, 0.10037986934185028, 0.1534847915172577, 0.09169894456863403, 0.049393102526664734, -0.18481117486953735, 0.03767263516783714, 0.15214312076568604, -0.3061216473579407, 0.10409204661846161, 0.11634810268878937, -0.09241301566362381, -0.1303841918706894, -0.08238063752651215, 0.21043622493743896, 0.06016888841986656, -0.21372723579406738, -0.047274164855480194, 0.14816349744796753, -0.1635306477546692, -0.03894665464758873, 0.03744018077850342, -0.10627448558807373, -0.2295120358467102, -0.34706607460975647, 0.08364175260066986, 0.3752904534339905, 0.15706725418567657, -0.19040459394454956, -0.053027816116809845, -0.040193066000938416, 0.030054155737161636, -0.015673048794269562, 0.07442665845155716, -0.07745516300201416, -0.027692634612321854, -0.05729616433382034, 0.06609559059143066, 0.09359648823738098, 0.007030919194221497, -0.04064972698688507, 0.1534118950366974, 0.011625465005636215, -0.021428558975458145, -0.03970024734735489, 0.13507162034511566, -0.030093301087617874, -0.03864838182926178, -0.12630881369113922, 0.001214196439832449, 0.029221713542938232, -0.10574918985366821, 0.0497749038040638, 0.12043121457099915, -0.16021546721458435, 0.18556728959083557, 0.0033217747695744038, -0.02147534489631653, -0.09977619349956512, -0.1065196618437767, -0.05902140587568283, 0.020462218672037125, 0.15949882566928864, -0.24322275817394257, 0.26638826727867126, 0.28189152479171753, 0.004669694229960442, 0.1482163369655609, 0.02986069954931736, -0.000682314857840538, 0.033924419432878494, -0.009296289645135403, -0.18183429539203644, -0.027455387637019157, -0.030691448599100113, -0.024062005802989006, 0.06612871587276459, 0.07825887203216553]]
		], 
		"method": "compare_faces", 
		"id": "20", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Compare identical faces…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			[[-0.08509126305580139, 0.0969925969839096, 0.044297367334365845, -0.09508570283651352, -0.06251055747270584, -0.02034267783164978, 0.011156408116221428, 0.003917763940989971, 0.1617252230644226, 0.040958382189273834, 0.16215084493160248, 0.03140030801296234, -0.20646324753761292, -0.0816231518983841, -0.08974087238311768, 0.05603593960404396, -0.15876951813697815, -0.09740892797708511, -0.15502634644508362, -0.03320900723338127, 0.12124380469322205, 0.0736188292503357, 0.08565802872180939, 0.01246512308716774, -0.18671827018260956, -0.268212229013443, -0.027730856090784073, -0.11193634569644928, 0.04396963119506836, -0.08755063265562057, 0.02929197996854782, 0.022718630731105804, -0.271373450756073, -0.12863454222679138, 0.05408309027552605, 0.08521923422813416, -0.049797527492046356, -0.058145564049482346, 0.19655653834342957, 0.0630371943116188, -0.14204521477222443, 0.11023899167776108, 0.05862988159060478, 0.27805033326148987, 0.2018718421459198, 0.029409093782305717, -0.0586247444152832, -0.01372818648815155, 0.10176349431276321, -0.28014498949050903, 0.06689117103815079, 0.19066868722438812, 0.11582116037607193, 0.12207555770874023, 0.07099508494138718, -0.16953407227993011, 0.07910638302564621, 0.14847451448440552, -0.2561414837837219, 0.0671769231557846, -0.03388526290655136, -0.05840519443154335, -0.029516592621803284, -0.019184419885277748, 0.07995017617940903, 0.08575835078954697, -0.11621250212192535, -0.14164142310619354, 0.08009433001279831, -0.10425757616758347, 0.03592710569500923, 0.09198196232318878, -0.13113732635974884, -0.15679702162742615, -0.20473749935626984, 0.08132606744766235, 0.3236461579799652, 0.1442919820547104, -0.20733895897865295, -0.006841196678578854, -0.12109501659870148, 0.00978242140263319, -0.026041869074106216, -0.027074145153164864, -0.0780525952577591, 0.013859241269528866, -0.08605197072029114, 0.04624020308256149, 0.09736470878124237, -0.024060089141130447, -0.06338053941726685, 0.2709650993347168, 0.035454168915748596, -0.013238200917840004, 0.046618830412626266, 0.004048735368996859, -0.1379617601633072, 0.010612402111291885, -0.17151865363121033, 0.003571774810552597, 0.040337737649679184, -0.1224462017416954, -0.009275238960981369, 0.06417059153318405, -0.15579672157764435, 0.07313348352909088, 0.028806425631046295, -0.06439120322465897, -0.04729015380144119, -0.01716649904847145, -0.14811593294143677, -0.04423397779464722, 0.13290098309516907, -0.24098987877368927, 0.3310350775718689, 0.22518713772296906, 0.029777105897665024, 0.12787485122680664, 0.13197681307792664, -0.017746303230524063, 0.044590167701244354, 0.042950958013534546, -0.03937744349241257, -0.1032700166106224, 0.046393170952796936, 0.009980985894799232, 0.04805765300989151, -0.004733930341899395]],
			[[-0.08509126305580139, 0.0969925969839096, 0.044297367334365845, -0.09508570283651352, -0.06251055747270584, -0.02034267783164978, 0.011156408116221428, 0.003917763940989971, 0.1617252230644226, 0.040958382189273834, 0.16215084493160248, 0.03140030801296234, -0.20646324753761292, -0.0816231518983841, -0.08974087238311768, 0.05603593960404396, -0.15876951813697815, -0.09740892797708511, -0.15502634644508362, -0.03320900723338127, 0.12124380469322205, 0.0736188292503357, 0.08565802872180939, 0.01246512308716774, -0.18671827018260956, -0.268212229013443, -0.027730856090784073, -0.11193634569644928, 0.04396963119506836, -0.08755063265562057, 0.02929197996854782, 0.022718630731105804, -0.271373450756073, -0.12863454222679138, 0.05408309027552605, 0.08521923422813416, -0.049797527492046356, -0.058145564049482346, 0.19655653834342957, 0.0630371943116188, -0.14204521477222443, 0.11023899167776108, 0.05862988159060478, 0.27805033326148987, 0.2018718421459198, 0.029409093782305717, -0.0586247444152832, -0.01372818648815155, 0.10176349431276321, -0.28014498949050903, 0.06689117103815079, 0.19066868722438812, 0.11582116037607193, 0.12207555770874023, 0.07099508494138718, -0.16953407227993011, 0.07910638302564621, 0.14847451448440552, -0.2561414837837219, 0.0671769231557846, -0.03388526290655136, -0.05840519443154335, -0.029516592621803284, -0.019184419885277748, 0.07995017617940903, 0.08575835078954697, -0.11621250212192535, -0.14164142310619354, 0.08009433001279831, -0.10425757616758347, 0.03592710569500923, 0.09198196232318878, -0.13113732635974884, -0.15679702162742615, -0.20473749935626984, 0.08132606744766235, 0.3236461579799652, 0.1442919820547104, -0.20733895897865295, -0.006841196678578854, -0.12109501659870148, 0.00978242140263319, -0.026041869074106216, -0.027074145153164864, -0.0780525952577591, 0.013859241269528866, -0.08605197072029114, 0.04624020308256149, 0.09736470878124237, -0.024060089141130447, -0.06338053941726685, 0.2709650993347168, 0.035454168915748596, -0.013238200917840004, 0.046618830412626266, 0.004048735368996859, -0.1379617601633072, 0.010612402111291885, -0.17151865363121033, 0.003571774810552597, 0.040337737649679184, -0.1224462017416954, -0.009275238960981369, 0.06417059153318405, -0.15579672157764435, 0.07313348352909088, 0.028806425631046295, -0.06439120322465897, -0.04729015380144119, -0.01716649904847145, -0.14811593294143677, -0.04423397779464722, 0.13290098309516907, -0.24098987877368927, 0.3310350775718689, 0.22518713772296906, 0.029777105897665024, 0.12787485122680664, 0.13197681307792664, -0.017746303230524063, 0.044590167701244354, 0.042950958013534546, -0.03937744349241257, -0.1032700166106224, 0.046393170952796936, 0.009980985894799232, 0.04805765300989151, -0.004733930341899395]]
		], 
		"method": "compare_faces", 
		"id": "21", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"


echo -e "\n************************************************************************"
echo "> Compare different faces…"
curl -X POST \
 	-H 'Content-Type: application/json' \
	-u 'automedia:automedia' \
 	-d '{
		"params": [
			[[-0.08509126305580139, 0.0969925969839096, 0.044297367334365845, -0.09508570283651352, -0.06251055747270584, -0.02034267783164978, 0.011156408116221428, 0.003917763940989971, 0.1617252230644226, 0.040958382189273834, 0.16215084493160248, 0.03140030801296234, -0.20646324753761292, -0.0816231518983841, -0.08974087238311768, 0.05603593960404396, -0.15876951813697815, -0.09740892797708511, -0.15502634644508362, -0.03320900723338127, 0.12124380469322205, 0.0736188292503357, 0.08565802872180939, 0.01246512308716774, -0.18671827018260956, -0.268212229013443, -0.027730856090784073, -0.11193634569644928, 0.04396963119506836, -0.08755063265562057, 0.02929197996854782, 0.022718630731105804, -0.271373450756073, -0.12863454222679138, 0.05408309027552605, 0.08521923422813416, -0.049797527492046356, -0.058145564049482346, 0.19655653834342957, 0.0630371943116188, -0.14204521477222443, 0.11023899167776108, 0.05862988159060478, 0.27805033326148987, 0.2018718421459198, 0.029409093782305717, -0.0586247444152832, -0.01372818648815155, 0.10176349431276321, -0.28014498949050903, 0.06689117103815079, 0.19066868722438812, 0.11582116037607193, 0.12207555770874023, 0.07099508494138718, -0.16953407227993011, 0.07910638302564621, 0.14847451448440552, -0.2561414837837219, 0.0671769231557846, -0.03388526290655136, -0.05840519443154335, -0.029516592621803284, -0.019184419885277748, 0.07995017617940903, 0.08575835078954697, -0.11621250212192535, -0.14164142310619354, 0.08009433001279831, -0.10425757616758347, 0.03592710569500923, 0.09198196232318878, -0.13113732635974884, -0.15679702162742615, -0.20473749935626984, 0.08132606744766235, 0.3236461579799652, 0.1442919820547104, -0.20733895897865295, -0.006841196678578854, -0.12109501659870148, 0.00978242140263319, -0.026041869074106216, -0.027074145153164864, -0.0780525952577591, 0.013859241269528866, -0.08605197072029114, 0.04624020308256149, 0.09736470878124237, -0.024060089141130447, -0.06338053941726685, 0.2709650993347168, 0.035454168915748596, -0.013238200917840004, 0.046618830412626266, 0.004048735368996859, -0.1379617601633072, 0.010612402111291885, -0.17151865363121033, 0.003571774810552597, 0.040337737649679184, -0.1224462017416954, -0.009275238960981369, 0.06417059153318405, -0.15579672157764435, 0.07313348352909088, 0.028806425631046295, -0.06439120322465897, -0.04729015380144119, -0.01716649904847145, -0.14811593294143677, -0.04423397779464722, 0.13290098309516907, -0.24098987877368927, 0.3310350775718689, 0.22518713772296906, 0.029777105897665024, 0.12787485122680664, 0.13197681307792664, -0.017746303230524063, 0.044590167701244354, 0.042950958013534546, -0.03937744349241257, -0.1032700166106224, 0.046393170952796936, 0.009980985894799232, 0.04805765300989151, -0.004733930341899395]],
			[[-0.0718456357717514, 0.15015248954296112, 0.06666910648345947, -0.09723062068223953, -0.08834396302700043, 0.03554505482316017, -0.06545256823301315, -0.03243454545736313, 0.15153762698173523, -0.040820106863975525, 0.1510402411222458, 0.04626286029815674, -0.17995314300060272, 0.006043959874659777, -0.09791521728038788, 0.09176614135503769, -0.14302141964435577, -0.07585341483354568, -0.18017756938934326, -0.044820189476013184, -0.0030051516368985176, 0.13010980188846588, 0.015650825574994087, 0.06075601652264595, -0.1528254896402359, -0.23046264052391052, -0.05505158752202988, -0.02413334511220455, 0.03661765158176422, -0.09482012689113617, -0.016625333577394485, -0.003276306902989745, -0.1735827922821045, -0.053672078996896744, 0.07575438171625137, 0.01788134127855301, -0.017925694584846497, -0.05931895226240158, 0.16873900592327118, 0.09624198824167252, -0.19604483246803284, 0.12634658813476562, 0.06509960442781448, 0.2912139892578125, 0.2630680799484253, -0.03532975912094116, -0.013689333572983742, -0.11058878898620605, 0.17060618102550507, -0.24328429996967316, 0.10102210938930511, 0.1726190745830536, 0.19679248332977295, 0.033245883882045746, 0.07558383047580719, -0.12437669932842255, -0.0031468989327549934, 0.250045508146286, -0.14441096782684326, 0.09242918342351913, 0.05347294360399246, -0.06116461753845215, -0.004591219127178192, -0.0033390435855835676, 0.005219725891947746, 0.08765427023172379, -0.0984090119600296, -0.22256410121917725, 0.12582585215568542, -0.1044386699795723, -0.013804391026496887, 0.11247298121452332, -0.09890149533748627, -0.1850326955318451, -0.22936615347862244, 0.08475778996944427, 0.4035812020301819, 0.20282766222953796, -0.19570589065551758, 0.009215271100401878, -0.1283261924982071, -0.0015859659761190414, 0.006588320713490248, 0.019818197935819626, -0.12472666800022125, -0.12771329283714294, -0.054561108350753784, 0.06310522556304932, 0.20543132722377777, 0.027805853635072708, -0.05268317461013794, 0.2097967118024826, 0.061709582805633545, -0.04302190616726875, -0.009629517793655396, 0.0011043817503377795, -0.15567737817764282, 0.03716513141989708, -0.1325567364692688, -0.010764474980533123, -0.03748172149062157, -0.05270610377192497, 0.028773846104741096, 0.12025874853134155, -0.2178526073694229, 0.17098553478717804, 0.03324291110038757, -0.06326697766780853, 0.03130997717380524, 0.04130818322300911, -0.09427203983068466, -0.012537526898086071, 0.16454623639583588, -0.21878720819950104, 0.2060767114162445, 0.15252532064914703, 0.09923525154590607, 0.11038853228092194, 0.13984130322933197, 0.021499283611774445, 0.0938568264245987, 0.01046951673924923, -0.061014074832201004, -0.08965325355529785, 0.0603114478290081, -0.06903629750013351, 0.07807900011539459, 0.00083954818546772]]
		], 
		"method": "compare_faces", 
		"id": "22", 
		"jsonrpc": "2.0"
	}' \
	localhost:11321
echo -e "\n************************************************************************"
