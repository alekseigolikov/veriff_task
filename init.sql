create schema veriff;

CREATE TABLE IF NOT EXISTS veriff.input_data (
  vector_id text NOT NULL,
  coord float8[] NOT NULL,
)

CREATE TABLE IF NOT EXISTS veriff.distance_matrix (
  vector_a text NOT NULL,
  vector_b text NOT NULL,
  distance float8 NOT NULL,
  pass integer default null
)

insert into veriff.input_data(vector_id, coord) values ('173979786296072426',array[-0.0491643100976944, -0.00869666412472725, -0.0217429138720036, 0.0283253788948059, -0.0928698778152466, -0.0603890940546989, 0.0172719601541758, -0.0131679065525532, 0.0975826233625412, -0.0464642718434334, 0.148802384734154, -0.0950625836849213, -0.298456311225891, -0.0462196543812752, 0.0207578241825104, 0.134631484746933, -0.105532683432102, 0.0293211415410042, -0.175592064857483, -0.0620094835758209, -0.0248450320214033, -0.00911328848451376, 0.059450451284647, -0.00227785878814757, -0.000975500792264938, -0.31088587641716, -0.0922960489988327, -0.121313974261284, 0.0376915819942951, -0.0811105594038963, -0.00216261297464371, 0.0700793191790581, -0.146833077073097, -0.149723678827286, -0.0214081089943647, 0.0206175446510315, -0.102745711803436, -0.0944995433092117, 0.206684201955795, 0.0328042916953564, -0.158190444111824, -0.0551755093038082, -0.000144629739224911, 0.215359166264534, 0.272085696458817, -0.00918350834399462, -0.0130788888782263, -0.0515682809054852, 0.146821081638336, -0.309445202350616, 0.0204346217215061, 0.0952344387769699, 0.0747626572847366, 0.0892506092786789, 0.0961335524916649, -0.0361137986183167, 0.0962254852056503, 0.149359166622162, -0.237185835838318, -0.0053280470892787, 0.0552767477929592, -0.101757161319256, -0.0561878457665443, -0.0137738361954689, 0.124271929264069, 0.152195125818253, 0.00904462300240993, -0.112618446350098, 0.206877872347832, -0.204803317785263, -0.045446302741766, 0.0106367468833923, -0.0830926969647408, -0.170853793621063, -0.327801376581192, 0.0160225760191679, 0.289051413536072, 0.187721490859985, -0.0920265018939972, 0.0533874481916428, -0.0275202393531799, -0.0413134507834911, 0.116107448935509, 0.0414622649550438, -0.0621825493872166, -0.0452558398246765, -0.0337727926671505, 0.0346353873610497, 0.113184295594692, -0.0907248631119728, -0.026361208409071, 0.188920333981514, -0.0157354325056076, -0.0219651982188225, 0.126489475369453, -0.000794407213106751, -0.0476085245609283, -0.0433289520442486, -0.173774763941765, -0.0294548440724611, 0.172237440943718, -0.172128602862358, 0.0746471211314201, 0.0329944044351578, -0.159080311655998, 0.114950723946095, -0.0428435355424881, -0.012358944863081, 0.0550053976476192, -0.133593931794167, -0.0685338005423546, 0.0845259726047516, 0.205139636993408, -0.144676014780998, 0.229387074708939, 0.117650255560875, -0.0718654841184616, 0.0961102619767189, 0.058850035071373, 0.0772066116333008, -0.0664640665054321, -0.052840068936348, -0.167291671037674, -0.0748672112822533, 0.0496686846017838, 0.102279230952263, 0.0184845011681318, 0.0181615967303514])
insert into veriff.input_data(vector_id, coord) values ('1167069512928616413',array[-0.0431437641382217, 0.0371747687458992, 0.00452288240194321, 0.00438318401575089, -0.0798469707369804, -0.099225752055645, 0.00698202941566706, -0.0161223895847797, 0.0956060960888863, -0.0590682365000248, 0.175050795078278, -0.0739337950944901, -0.279575526714325, -0.024936381727457, -0.0454487726092339, 0.144656866788864, -0.0991846099495888, 0.0197847262024879, -0.186104938387871, -0.0848130583763123, -0.0502959191799164, -0.0207752697169781, 0.0507831834256649, 0.0237892866134644, 0.0378098897635937, -0.299911618232727, -0.0795065239071846, -0.112595371901989, 0.0549182333052158, -0.0543193183839321, 0.00309312902390957, 0.0602970644831657, -0.142833232879639, -0.151641339063644, -0.0257870964705944, 0.0126429088413715, -0.126559793949127, -0.0965690612792969, 0.247735425829887, 0.0206076111644506, -0.137742638587952, 0.000452941283583641, -0.00232868734747171, 0.274592101573944, 0.305724620819092, -0.0474862828850746, 0.00395509228110313, -0.067151241004467, 0.130630001425743, -0.323673069477081, 0.0204960871487856, 0.117789603769779, 0.109486475586891, 0.0755339339375496, 0.11244897544384, -0.0226973704993725, 0.0803391113877296, 0.135889574885368, -0.19073012471199, -0.00602748058736324, 0.0424282178282738, -0.0958060324192047, -0.0689755231142044, -0.044808991253376, 0.138429626822472, 0.13474914431572, -0.0191469825804234, -0.0829765573143959, 0.217254459857941, -0.2066820114851, -0.0273260101675987, 0.0064849853515625, -0.0759192928671837, -0.15463562309742, -0.302842140197754, 0.0408875942230225, 0.275931149721146, 0.221368342638016, -0.127638503909111, 0.07172791659832, -0.0586418956518173, -0.0291365012526512, 0.10745994001627, 0.0279678925871849, -0.0776492059230804, -0.0709724277257919, -0.0491688512265682, 0.0347409099340439, 0.111377045512199, -0.102189414203167, -0.0414836890995502, 0.180641651153564, -0.00179078616201878, -0.0464956127107143, 0.117941968142986, -0.00618006475269794, -0.0795854926109314, -0.0620054863393307, -0.214267253875732, -0.0359418541193008, 0.181758508086205, -0.155469924211502, 0.0492123924195766, 0.0311568789184093, -0.168582946062088, 0.0976245030760765, -0.047205813229084, -0.023144006729126, 0.074138306081295, -0.112156488001347, -0.0792627856135368, 0.062870591878891, 0.225809678435326, -0.100616738200188, 0.241077423095703, 0.110796473920345, -0.0712934359908104, 0.0870145112276077, 0.110485568642616, 0.0495506785809994, -0.0643872991204262, -0.0666523799300194, -0.130247160792351, -0.0905630737543106, 0.0435619167983532, 0.10063636302948, 0.0480781123042107, 0.00557510275393724])
insert into veriff.input_data(vector_id, coord) values ('5955199390509241758',array[-0.0589290969073772, -0.0250863619148731, 0.0328111238777637, 0.00321731599979103, -0.0683641210198402, -0.150892868638039, 0.0122943669557571, -0.0840637981891632, 0.00269767921417952, -0.0200784038752317, 0.152480393648148, -0.0750722885131836, -0.22912834584713, -0.0800257101655006, -0.030044199898839, 0.0739029422402382, -0.0896730348467827, 0.000941210426390171, -0.167208671569824, -0.0443044826388359, -0.00237836176529527, 0.0232237465679646, 0.0454583913087845, -0.0101084634661674, -0.0161494575440884, -0.271258473396301, -0.140429884195328, -0.0677309036254883, 0.0345723628997803, -0.0407843068242073, 0.0500191748142242, 0.152189165353775, -0.176341444253922, -0.0708238109946251, -0.00257398188114166, 0.060218371450901, -0.107105880975723, -0.0936472713947296, 0.264623880386353, -0.0148707227781415, -0.145900741219521, -0.0223545227199793, 0.074759267270565, 0.256877720355988, 0.21387454867363, -0.0360930189490318, -0.0263658426702023, 0.0410467684268951, 0.102106794714928, -0.272822320461273, 0.0187549144029617, 0.159242182970047, 0.0616110004484653, 0.0688673853874207, 0.0617364607751369, -0.0740333199501038, 0.101469770073891, 0.179640352725983, -0.294861882925034, 0.014399278908968, 0.0271362587809563, -0.208385050296783, -0.0783709958195686, -0.0239237360656261, 0.163720473647118, 0.171363368630409, -0.0697254464030266, -0.112138897180557, 0.182165890932083, -0.198056399822235, 0.0175761319696903, 0.0258438214659691, -0.115777470171452, -0.141501814126968, -0.293078243732452, 0.0490381084382534, 0.309289187192917, 0.133012861013412, -0.0784728303551674, 0.0967436134815216, -0.0641242116689682, -0.0913883745670319, 0.0764926075935364, 0.0185404885560274, -0.0813575088977814, -0.0164995286613703, -0.0995600819587708, 0.064851701259613, 0.121116250753403, -0.044653233140707, -0.0223059058189392, 0.190678149461746, -0.0170032605528831, -0.0547167062759399, 0.0666949450969696, -0.0519789457321167, -0.0723281800746918, -0.0755487009882927, -0.158377215266228, 0.0285721179097891, 0.110689729452133, -0.195801988244057, 0.0263527650386095, 0.0684410855174065, -0.108235739171505, 0.108308218419552, 0.00162024516612291, -0.0305313412100077, -0.00476391846314073, -0.171592369675636, -0.115696132183075, 0.0433634966611862, 0.158715486526489, -0.180119901895523, 0.248419880867004, 0.0566738098859787, -0.0186125617474318, 0.118519112467766, 0.0974796265363693, 0.0586418583989143, -0.0591551065444946, -0.0651341676712036, -0.156498670578003, -0.0688389465212822, 0.0954873412847519, 0.0692399442195892, 0.0900936052203178, 0.0264877695590258])
insert into veriff.input_data(vector_id, coord) values ('-257145795754959675',array[-0.148958653211594, 0.0726741030812263, 0.0611441433429718, -0.0534704886376858, -0.162960886955261, -0.00655905203893781, -0.0723681300878525, -0.031452938914299, 0.0786419361829758, -0.0814784020185471, 0.161295473575592, -0.0816709920763969, -0.259368121623993, 0.00832404103130102, -0.025828393176198, 0.146129608154297, -0.146447733044624, -0.116205409169197, -0.0591839253902435, -0.059111338108778, 0.118666030466557, 0.0575188808143139, -0.0205257553607225, 0.0632032826542854, -0.0983360856771469, -0.317039579153061, -0.0632544159889221, -0.0814162939786911, 0.0873682424426079, -0.0252955965697765, -0.0741060897707939, 0.0106294602155685, -0.184704199433327, -0.0133363120257854, 0.0603308640420437, 0.106152087450027, -0.113313764333725, -0.0910399109125137, 0.126656591892242, -0.058989480137825, -0.17101015150547, 0.0107080237939954, 0.0718051120638847, 0.170628309249878, 0.248519629240036, 0.0667338594794273, 0.00495144911110401, -0.0498852171003819, 0.115321800112724, -0.360584050416946, 0.0643449723720551, 0.175864070653915, 0.0452870726585388, 0.120471194386482, 0.112989671528339, -0.210015773773193, 0.0135003197938204, 0.23011839389801, -0.18687915802002, 0.0881129279732704, -0.0405506491661072, -0.102969616651535, -0.0261428505182266, -0.0687829107046127, 0.217826247215271, 0.148529797792435, -0.115091726183891, -0.177734196186066, 0.232535660266876, -0.206511780619621, -0.0364122167229652, 0.0967861488461494, -0.0634386762976646, -0.162299513816833, -0.197923585772514, 0.0100723952054977, 0.322512000799179, 0.145514607429504, -0.18256901204586, 0.0813719555735588, -0.0464638620615005, 0.0110288308933377, 0.0521816797554493, 0.0406075343489647, -0.0171849969774485, -0.0974911376833916, -0.130033031105995, -0.0769877731800079, 0.200578242540359, -0.0621160790324211, 0.0759045630693436, 0.316945344209671, 0.0378031134605408, -0.00671630725264549, 0.0926561877131462, 0.0707211568951607, -0.123327642679214, -0.0986372455954552, -0.101312890648842, -0.0853061750531197, 0.00727732898667455, -0.161308288574219, -0.0643721222877502, 0.0974569395184517, -0.196146726608276, 0.148250758647919, -0.083514615893364, 0.0498227477073669, -0.0293907634913921, -0.0926867425441742, -0.0218715779483318, 0.0146528938785195, 0.139075040817261, -0.287390440702438, 0.217130765318871, 0.163361206650734, -0.00896393600851297, 0.186993569135666, 0.0412729494273663, 0.0609899275004864, 0.024468045681715, -0.0994949266314507, -0.187271893024445, -0.100394882261753, 0.0321640446782112, -0.0544617362320423, -0.11153881251812, 0.0595672838389874])
insert into veriff.input_data(vector_id, coord) values ('2093213291620976046',array[-0.14405731856823, 0.0765742510557175, 0.107878133654594, -0.0846485570073128, -0.188329726457596, -0.0183813031762838, -0.0748734921216965, -0.0717538744211197, 0.0825422629714012, -0.100314140319824, 0.187493413686752, -0.0778879448771477, -0.242766007781029, 0.022133894264698, -0.0730705559253693, 0.15654069185257, -0.152756959199905, -0.107914827764034, -0.062514491379261, -0.0353041961789131, 0.125631466507912, 0.0324921868741512, -0.0179953388869762, 0.026896346360445, -0.091407984495163, -0.34543651342392, -0.113689221441746, -0.0696815177798271, 0.0828199237585068, -0.0060300468467176, -0.0443152785301208, -0.00337944296188653, -0.187701553106308, -0.0186182353645563, 0.0386931672692299, 0.0769660174846649, -0.128781959414482, -0.116911835968494, 0.13287378847599, -0.0526377446949482, -0.18317012488842, 0.0197657607495785, 0.094155840575695, 0.16401518881321, 0.23409004509449, 0.0672993063926697, 0.0240235347300768, -0.0584420077502728, 0.108458049595356, -0.345133513212204, 0.061505138874054, 0.158002570271492, 0.0408713780343533, 0.133057460188866, 0.136443018913269, -0.202352851629257, 0.0334426611661911, 0.195484906435013, -0.199547827243805, 0.0715290009975433, -0.0382805839180946, -0.0861199498176575, -0.0363060384988785, -0.0850106775760651, 0.217500224709511, 0.15827551484108, -0.110116459429264, -0.168417975306511, 0.272605150938034, -0.17632845044136, -0.0057636508718133, 0.0955552905797958, -0.0888952165842056, -0.152537330985069, -0.19271282851696, -0.00776339508593082, 0.387298136949539, 0.150486260652542, -0.169813886284828, 0.0491325855255127, -0.0903268530964851, -0.0067682508379221, 0.030382227152586, 0.0171563439071178, 0.00828781723976135, -0.0811744034290314, -0.121428787708282, -0.0582375377416611, 0.192788630723953, -0.0916266962885857, 0.0666064843535423, 0.323446273803711, 0.0530795194208622, -0.0143491858616471, 0.0748781636357307, 0.0728391706943512, -0.139302581548691, -0.0889124721288681, -0.117670804262161, -0.0858045443892479, 0.00546310609206557, -0.145312279462814, -0.0653350800275803, 0.0942808613181114, -0.1935203820467, 0.161358758807182, -0.045591726899147, 0.0327333770692348, -0.0459934510290623, -0.0868195965886116, -0.0413788482546806, 0.0116749852895737, 0.14934991300106, -0.282003372907639, 0.216723054647446, 0.166591629385948, -0.0158263985067606, 0.178558766841888, 0.0415861234068871, 0.0490378960967064, 0.00718907732516527, -0.123014904558659, -0.16873274743557, -0.11160047352314, 0.00607586884871125, -0.0514213107526302, -0.104514040052891, 0.0692594647407532])
insert into veriff.input_data(vector_id, coord) values ('-1868657356679014051',array[-0.0906362384557724, 0.130501076579094, 0.0439129695296288, 0.0128505975008011, -0.113592579960823, 0.0263926386833191, -0.0594998113811016, -0.0706754326820374, 0.0388786308467388, 0.02101562730968, 0.199101895093918, -0.0475217252969742, -0.242227897047997, 0.0126252118498087, -0.00671980390325189, 0.125776663422585, -0.120824053883553, -0.0302526988089085, -0.180961608886719, -0.0345283970236778, 0.054167877882719, 0.00961467530578375, 0.0746505111455917, -0.0446935221552849, -0.112953081727028, -0.261260449886322, -0.0570571720600128, -0.133405119180679, -0.0125966286286712, -0.0684361308813095, 0.0241106506437063, -0.0617053955793381, -0.215336665511131, -0.0700505897402763, -0.0421212539076805, -0.0398036763072014, -0.0312877334654331, -0.0809869170188904, 0.189187705516815, -0.0100271245464683, -0.169340401887894, 0.106629878282547, 0.0511337369680405, 0.192552089691162, 0.259485572576523, -0.0120698213577271, 0.0351303219795227, -0.0743633061647415, 0.0848933458328247, -0.154548317193985, 0.0240368116647005, 0.098336860537529, 0.207037344574928, 0.0625190809369087, 0.0469604954123497, -0.0277024507522583, 0.0233986936509609, 0.19771508872509, -0.212897330522537, 0.0632105320692062, 0.0144960228353739, 0.0163320489227772, 0.0117337992414832, -0.0797842964529991, 0.176658943295479, 0.125584661960602, -0.0770662501454353, -0.127678796648979, 0.149228900671005, -0.112130895256996, -0.0974510163068771, 0.050635140389204, -0.148417353630066, -0.162909910082817, -0.33750119805336, -0.0235987473279238, 0.291672140359879, 0.0423419661819935, -0.267008274793625, -0.0716984570026398, -0.061496190726757, -0.0863863900303841, -0.0358396284282207, 0.0800584554672241, -0.0416789948940277, -0.0833237394690514, -0.0344262681901455, -0.0031861187890172, 0.265497207641602, -0.0853763222694397, -0.0169152673333883, 0.248393356800079, 0.0459891855716705, -0.139270469546318, 0.000407504849135876, 0.0782699882984161, -0.0859986245632172, -0.0674983859062195, -0.0873581245541573, -0.0551046654582024, -0.0304928161203861, -0.148498624563217, -0.04195162281394, 0.122449994087219, -0.232221126556396, 0.113415747880936, -0.0408747307956219, -0.0178678873926401, -0.0312631130218506, -0.0412928313016891, -0.00240085832774639, -0.00365441991016269, 0.204570829868317, -0.163516849279404, 0.17506517469883, 0.192198231816292, -0.0450541041791439, 0.0177164264023304, -0.0184129998087883, 0.0786825567483902, -0.0481118261814117, 0.0942370146512985, -0.182641267776489, -0.110528618097305, 0.011312847957015, -0.0128239830955863, 0.0159864351153374, 0.0861794576048851])
insert into veriff.input_data(vector_id, coord) values ('1092146996456670466',array[-0.056547399610281, 0.0732719004154205, -0.0249058902263641, -0.0390865057706833, -0.0380047373473644, -0.0718947276473045, -0.0165736768394709, -0.095217265188694, 0.168990731239319, -0.0371696427464485, 0.0673002004623413, -0.0934935361146927, -0.346097469329834, -0.046216256916523, -0.0576271042227745, 0.160587340593338, -0.208116307854652, -0.129799753427505, -0.0989337861537933, 0.0106174796819687, 0.119720242917538, 0.032114289700985, 0.0641356557607651, 0.0924611985683441, -0.106747590005398, -0.311041414737701, 0.0251278188079596, -0.0814066231250763, -0.0659615248441696, -0.0565759688615799, 0.102118566632271, 0.204143062233925, -0.178932264447212, 0.0294833891093731, -0.0457268133759499, 0.0776843428611755, -0.00707074860110879, -0.120882287621498, 0.198904395103455, 0.00412817858159542, -0.237843886017799, -0.0572366900742054, 0.0239353440701962, 0.234494850039482, 0.233307465910912, -0.0118006113916636, 0.00678061321377754, -0.0594527013599873, 0.168133586645126, -0.41520282626152, -0.064917579293251, 0.18751984834671, 0.00902410410344601, 0.0872644335031509, 0.0345056988298893, -0.213106051087379, 0.0837812051177025, 0.106730028986931, -0.25400123000145, 0.00505224708467722, 0.00289201410487294, -0.0799364745616913, 0.0599510595202446, -0.0636666342616081, 0.21186038851738, 0.050529558211565, -0.149115011096001, -0.000733836553990841, 0.157622754573822, -0.173196762800217, 0.00780783221125603, 0.0972895100712776, -0.104252301156521, -0.2288478910923, -0.259750485420227, -0.0497024841606617, 0.293246060609818, 0.142954036593437, -0.0896047875285149, 0.0340546034276485, -0.135449260473251, -0.012655571103096, -0.0304973907768726, 0.0754311978816986, -0.0133683141320944, -0.0608412325382233, -0.14161229133606, 0.0247544385492802, 0.210434943437576, -0.0546067096292973, 0.0173902362585068, 0.369086176156998, 0.0507783517241478, -0.0456288903951645, -0.0628412738442421, 0.0553216189146042, -0.101237922906876, 0.0236329827457666, -0.100031644105911, 0.0224224738776684, 0.0169765241444111, -0.0806127637624741, 0.013578362762928, 0.0863731354475021, -0.165518209338188, 0.136255443096161, -0.00838201027363539, 0.0402678996324539, 0.0191392824053764, -0.0823301672935486, -0.0564799010753632, -0.020692253485322, 0.127427041530609, -0.214994251728058, 0.158350452780724, 0.136129349470139, 0.0711070820689201, 0.152151331305504, -0.0360324010252953, 0.0994581803679466, -0.036860816180706, -0.100204914808273, -0.165247350931168, -0.0493979975581169, 0.0898366943001747, 0.0447783321142197, -0.0622172579169273, 0.0611787438392639])
insert into veriff.input_data(vector_id, coord) values ('-7934532626214689145',array[-0.07059296220541, 0.144000738859177, 0.0460811369121075, -0.0258413422852755, -0.151206225156784, 0.0146997356787324, -0.0920240134000778, -0.0204590260982513, 0.109164319932461, -0.0629628226161003, 0.17799736559391, -0.0908337086439133, -0.256435245275497, 0.0606337636709213, -0.0398958511650562, 0.159309804439545, -0.161582201719284, -0.0719065368175507, -0.108386658132076, -0.14363831281662, 0.0149468034505844, 0.0868746191263199, 0.000305687426589429, 0.00227339845150709, -0.00205086544156075, -0.279378592967987, -0.027395635843277, -0.0570688992738724, 0.150735422968864, -0.12381087243557, -0.0120216784998775, 0.030623197555542, -0.139627173542976, -0.0699766203761101, 0.0266175121068954, 0.00366010330617428, -0.0711833387613297, -0.103402659296989, 0.228178888559341, -0.0372214391827583, -0.15179055929184, 0.0401652231812477, 0.0919228941202164, 0.251558601856232, 0.189468115568161, 0.00132493360433728, 0.0166663248091936, -0.108867667615414, 0.0748421996831894, -0.166186854243279, 0.0171477384865284, 0.223598271608353, 0.177581578493118, 0.0796669274568558, 0.0217644721269608, -0.101729951798916, -0.00137696415185928, 0.157269790768623, -0.181429609656334, 0.0186766013503075, 0.110664919018745, -0.00859150849282742, -0.0303320698440075, -0.0380721315741539, 0.214593842625618, 0.11062153428793, -0.0847242027521133, -0.180523589253426, 0.194068670272827, -0.111301891505718, -0.113087102770805, 0.0200683176517487, -0.11648928374052, -0.104542620480061, -0.212279826402664, 0.0143210729584098, 0.311813861131668, 0.0549228340387344, -0.160899773240089, 0.0764799565076828, -0.0328564643859863, -0.0778423622250557, 0.00574543001130223, 0.120428740978241, -0.135855913162231, -0.0931477397680283, -0.0114587983116508, 0.0535095520317554, 0.14394810795784, -0.0562016665935516, -0.0162140503525734, 0.114044964313507, 0.0876718983054161, -0.0626396536827087, 0.0504236817359924, 0.0983561500906944, -0.12397526204586, -0.0411238931119442, -0.146014124155045, -0.0710328295826912, 0.03858557716012, -0.0833995193243027, 0.00155389867722988, 0.150003999471664, -0.166058972477913, 0.188083335757256, -0.00833583436906338, -0.0379380062222481, 0.0108649609610438, 0.027362709864974, 0.0353771224617958, -0.0227179061621428, 0.157657235860825, -0.168304964900017, 0.175788506865501, 0.128546133637428, -0.00250075687654316, 0.107448674738407, 0.0592322833836079, 0.129947781562805, 0.0441181138157845, 0.0116598168388009, -0.160143166780472, -0.138530984520912, 0.00132444314658642, 0.015345866791904, 0.00491415709257126, 0.0700541064143181])
insert into veriff.input_data(vector_id, coord) values ('-1085231394383393544',array[-0.101977579295635, 0.038644477725029, -0.0397036634385586, -0.0218155607581139, -0.105188995599747, -0.0634307488799095, 0.00497367046773434, -0.0847550481557846, 0.146513551473618, -0.0920004099607468, 0.195319756865501, -0.00189368426799774, -0.27168795466423, -0.0800637230277061, -0.0578225739300251, 0.118434891104698, -0.149220749735832, -0.10606000572443, -0.187883347272873, -0.0877610594034195, -0.0762693956494331, 0.0574979707598686, -0.0104331634938717, 0.00526847364380956, -0.022621450945735, -0.233380347490311, -0.0592651478946209, -0.0927391424775124, 0.14563399553299, -0.0658610537648201, -0.0281860344111919, 0.0661861822009087, -0.195627480745316, -0.15527018904686, 0.0427438728511333, 0.0166349671781063, -0.0532282777130604, -0.0670502930879593, 0.267663240432739, 0.0474377498030663, -0.153776109218597, -0.0576464049518108, 0.0531528703868389, 0.318028450012207, 0.224221855401993, -0.00708657735958695, 0.00925000198185444, -0.0284863207489252, 0.139659717679024, -0.329650968313217, 0.0788680016994476, 0.132370129227638, 0.145021617412567, 0.0468137487769127, 0.0886745303869247, -0.228626057505608, -0.0108984922990203, 0.159258961677551, -0.181259512901306, 0.146863296627998, 0.0909572541713715, -0.0610746406018734, -0.048813983798027, -0.0260334406048059, 0.200012117624283, 0.102473244071007, -0.0864344835281372, -0.138530492782593, 0.273416876792908, -0.206845477223396, 0.00726381503045559, 0.0800707712769508, -0.0492065921425819, -0.145913556218147, -0.271041721105576, -0.0103702917695045, 0.36101895570755, 0.17705363035202, -0.133399218320847, -0.0135483415797353, -0.107371419668198, -0.0659362748265266, 0.0696520507335663, -0.00510030146688223, -0.085020512342453, -0.0436956807971001, -0.0975116938352585, -0.040036216378212, 0.250796914100647, 0.0422945246100426, -0.0611043721437454, 0.225709363818169, 0.0239035859704018, -0.1047428175807, 0.08812215924263, 0.0255799684673548, -0.0798949673771858, -0.129083663225174, -0.157112404704094, -0.0129850301891565, 0.0381626971065998, -0.237444281578064, 0.00150960520841181, 0.107752397656441, -0.143082737922668, 0.136780425906181, -0.0252970438450575, 0.0255477949976921, -0.0391405932605267, -0.0589749664068222, -0.0998184159398079, 0.044277735054493, 0.225863322615623, -0.168443441390991, 0.265514492988586, 0.116811394691467, 0.0399875454604626, 0.12917061150074, 0.0714723542332649, 0.0478308238089085, -0.0203764978796244, -0.060948982834816, -0.11594158411026, -0.194604620337486, -0.0436948463320732, -0.0441890880465508, 0.0950524359941483, 0.0810198187828064])
insert into veriff.input_data(vector_id, coord) values ('7301193463472806501',array[-0.14985890686512, 0.0975085496902466, 0.0640845522284508, 0.040802888572216, -0.0981926023960114, -0.0422065928578377, -0.0115692354738712, -0.136375829577446, 0.0786807164549828, -0.0881870985031128, 0.201752871274948, -0.0334223657846451, -0.26561239361763, -0.0559013485908508, 0.00883355643600225, 0.135525912046432, -0.153189703822136, -0.0739246681332588, -0.138743624091148, -0.12441772967577, 0.0850145891308784, 0.0589446686208248, 0.00470177456736565, -0.0179763678461313, -0.14844486117363, -0.193147242069244, -0.0963066145777702, -0.101683109998703, 0.0303166843950748, -0.1368368268013, 0.0606604777276516, -0.0251531973481178, -0.25892773270607, -0.0719583332538605, -0.0759166479110718, 0.0872787833213806, -0.113568648695946, -0.123450525105, 0.151317179203033, -0.0257006324827671, -0.168525949120522, -0.0264674425125122, 0.00849282182753086, 0.221917331218719, 0.210771799087524, -0.0620753094553947, -0.026221064850688, -0.0991568565368652, 0.125875622034073, -0.229491874575615, 0.00881550833582878, 0.154779329895973, 0.105148680508137, 0.142984226346016, 0.0319386273622513, -0.0526677072048187, 0.075543113052845, 0.174846991896629, -0.207324087619781, 0.0249112360179424, 0.117717653512955, -0.118648625910282, 0.0176173970103264, -0.0517791472375393, 0.119464561343193, 0.0769360139966011, -0.0588698051869869, -0.106430202722549, 0.17907327413559, -0.168895065784454, -0.128504931926727, 0.0607680417597294, -0.0826897397637367, -0.204142168164253, -0.409100353717804, 0.0324107967317104, 0.371589064598083, 0.164903193712234, -0.136215761303902, 0.00238142535090446, -0.0712342113256454, -0.034552451223135, 0.041645348072052, 0.0933549776673317, -0.0572174340486526, 0.0107369804754853, -0.102748058736324, 0.107462219893932, 0.191046178340912, -0.0488347746431828, -0.0167371053248644, 0.251944184303284, 0.030383512377739, -0.053421575576067, 0.0588061138987541, 0.0703894421458244, -0.099906399846077, -0.0625680387020111, -0.0908568128943443, -0.0391757786273956, 0.0691584646701813, -0.134907275438309, 0.0269654951989651, 0.147147998213768, -0.099305659532547, 0.218437716364861, -0.000844023888930678, 0.00809089653193951, -0.0461854934692383, -0.0857100784778595, -0.0793194770812988, 0.0360011383891106, 0.162772491574287, -0.160153418779373, 0.189336434006691, 0.142153292894363, -0.0592656880617142, 0.11117722094059, 0.0734860450029373, 0.144631057977676, -0.12691755592823, -0.0450457185506821, -0.203540101647377, -0.0933181345462799, 0.0459230542182922, 0.0549232102930546, 0.0739385783672333, 0.0681694075465202])
