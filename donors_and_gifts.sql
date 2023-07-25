/* # of unique donors that donated */
/* 142 */
SELECT
	COUNT (DISTINCT donor_id)
FROM
	gifts;


/* # of gifts */
/* 1,500 gifts */
SELECT
	COUNT (gift_id)
FROM gifts;


/* Smallest and largest gift amounts */
/* Smallest = $5   Largest = $2,000 */
SELECT
	MIN (amount) AS smallest_gift,
	MAX (amount) AS largest_gift
FROM
	gifts;


/* # of gifts per month */
/* Jan - 218, Feb - 228, March - 250 
April - 223, May - 221, June - 215, July - 145 */
SELECT
	DATE_TRUNC('month', gift_date)
	AS month_of_gift,
	COUNT(gift_id) AS monthly_gifts
FROM
	gifts
GROUP BY
	DATE_TRUNC('month', gift_date)
ORDER BY
	month_of_gift;


/* # of gifts per appeal */
/* M0004 - 215   E0002 - 244   W0001 - 189   E0001 - 223
M0002 - 208   M0003 - 201   M0001 - 220 */
SELECT
	appeal,
	COUNT (gift_id) AS total_gifts
FROM
	gifts
GROUP BY
	appeal;


/* # of gifts over $1,000 */
/* 756 gifts */
SELECT
	COUNT (gift_id)
FROM
	gifts
WHERE amount > 1000;


/* # of gifts by tender for mailed appeals (appeals that start with "M") */
/* Securities - 203   Credit Card - 225   Wire - 214   Check - 202 */
SELECT
	tender,
	COUNT (gift_id)
FROM
	gifts
WHERE
	appeal LIKE 'M%'
GROUP BY
	tender;


/* Top 5 donors by total gift amount */
/*
006752	Maria Coleman   19910.00
780315	Brandy Taylor	  19765.00
663137	Kevin Sosa	    18955.00
149651	Eric Faulkner	  18560.00
730060	Kevin Oliver	  18510.00 */
SELECT
	gifts.donor_id,
	first_name,
	last_name,
	SUM (amount) AS total_giving
FROM
	gifts
INNER JOIN
	donors ON gifts.donor_id = donors.donor_id
GROUP BY
	gifts.donor_id, first_name, last_name
ORDER BY
	total_giving DESC LIMIT 5;


/* Mailing list of donors who donated because of a mailed appeal (appeal starts with "M" and gave $1,500 or more */
SELECT 
	DISTINCT (donors.donor_id),
	first_name,
	last_name,
	street,
	city,
	state,
	zip_code
FROM
	donors
INNER JOIN
	gifts ON gifts.donor_id = donors.donor_id
WHERE
	appeal LIKE 'M%' AND amount >= 1500
ORDER BY
	last_name;

"283583"	"Joseph"	"Acosta"	"63026 Stephen River"	"New Dustinbury"	"Minnesota"	"29623"
"660511"	"Billy"	"Alvarado"	"23648 Eric Pike Suite 977"	"New Bryce"	"Utah"	"16174"
"590746"	"Mark"	"Andrews"	"96919 Wade Glens"	"Mayside"	"Virginia"	"76414"
"138596"	"Michelle"	"Andrews"	"7034 Leslie Circles"	"Tarabury"	"New York"	"13755"
"888865"	"Christian"	"Arroyo"	"48620 Santana Locks Suite 576"	"Robertsmouth"	"New Jersey"	"56788"
"907819"	"Rachel"	"Baker"	"02456 Sanders Route"	"Danielhaven"	"Oklahoma"	"52846"
"503671"	"Samantha"	"Baker"	"089 Timothy Streets"	"North Johnberg"	"Pennsylvania"	"87650"
"184974"	"Mike"	"Banks"	"020 Mclean Knolls Suite 580"	"Daveport"	"Florida"	"22366"
"002944"	"Michael"	"Barber"	"277 Bender Mountain"	"West Elizabethborough"	"Rhode Island"	"34315"
"084941"	"Elizabeth"	"Barber"	"44171 Mckenzie Spurs"	"East Michael"	"Tennessee"	"06338"
"544555"	"Valerie"	"Barnett"	"8037 Mandy Squares"	"North Jonathonside"	"Tennessee"	"05754"
"377533"	"Heather"	"Bell"	"138 Brandon Grove"	"Marshallton"	"Alaska"	"99408"
"888690"	"Daniel"	"Brady"	"0898 Ibarra Harbors Suite 821"	"Jonesmouth"	"Alaska"	"09597"
"915538"	"Elizabeth"	"Brewer"	"1582 Lisa Pines Apt. 588"	"Lake Kevin"	"Virginia"	"30787"
"953171"	"Brian"	"Burnett"	"5163 Gregory Mews Suite 046"	"Jacobview"	"Utah"	"92719"
"601444"	"James"	"Cain"	"88727 Michael Springs Apt. 566"	"Carpenterstad"	"Georgia"	"07418"
"265099"	"Karen"	"Camacho"	"230 Ortiz Manors"	"Jacobbury"	"California"	"68942"
"592213"	"Nicholas"	"Campbell"	"4623 Smith Lock Suite 563"	"Bellborough"	"Missouri"	"38115"
"640815"	"Richard"	"Cardenas"	"393 Nicholas Cliffs"	"Robinsonside"	"Utah"	"18332"
"924086"	"Anita"	"Clark"	"3147 Carla Skyway Suite 067"	"Lake Glennview"	"Nebraska"	"35687"
"006752"	"Maria"	"Coleman"	"12860 Kelsey Valley"	"West Victorshire"	"North Dakota"	"17577"
"487051"	"Justin"	"Cooke"	"583 Kimberly Throughway Apt. 713"	"West Kevinfurt"	"Alaska"	"76374"
"898531"	"Andrew"	"Cooke"	"66252 Heather Cliff Apt. 189"	"Kylestad"	"Indiana"	"08947"
"412425"	"Jaclyn"	"Cortez"	"380 Anna Estate"	"New Sean"	"Maine"	"65081"
"237021"	"Cody"	"Curtis"	"1350 James Junction"	"Rachelland"	"Hawaii"	"21394"
"488229"	"Andrew"	"Donaldson"	"9350 King Bypass Apt. 614"	"Lake Tonyashire"	"Delaware"	"74228"
"479171"	"Cindy"	"Duncan"	"912 John Neck Suite 730"	"New Matthewfurt"	"Wisconsin"	"60815"
"149651"	"Eric"	"Faulkner"	"263 David Mission Apt. 637"	"Ramosbury"	"South Dakota"	"58524"
"438848"	"Emily"	"Ferguson"	"51912 Martinez Trail"	"Orozcoside"	"Kansas"	"18029"
"253979"	"Dawn"	"Frazier"	"3337 Alicia Junctions"	"Myersland"	"Ohio"	"06658"
"250604"	"Kimberly"	"Frazier"	"62001 Michael Spurs Apt. 157"	"Lewisview"	"Arizona"	"24852"
"330410"	"Stephen"	"Frazier"	"53030 John Forks"	"Haysbury"	"Georgia"	"55355"
"532732"	"John"	"Garcia"	"451 Troy Square Apt. 638"	"Jeffreyland"	"Kentucky"	"16044"
"307905"	"Kevin"	"Gates"	"647 Smith Courts"	"East Kathleenport"	"South Carolina"	"01720"
"664068"	"Paul"	"Greer"	"548 Kathryn Mall Apt. 553"	"Aguirremouth"	"Wisconsin"	"52648"
"752617"	"Megan"	"Hammond"	"685 King Union Suite 147"	"Christianhaven"	"Maine"	"24643"
"663803"	"Amber"	"Hampton"	"39962 Michael Fort Suite 185"	"Tylerview"	"Wisconsin"	"84738"
"953364"	"Gerald"	"Hensley"	"84046 Harris Courts Suite 905"	"Port Codyville"	"Kentucky"	"16901"
"718831"	"Jill"	"Hicks"	"6773 Lawson Row Suite 543"	"South Heatherborough"	"Montana"	"07991"
"860069"	"Meghan"	"Hill"	"8435 Allen Highway"	"New Kelly"	"North Carolina"	"66131"
"036841"	"Kimberly"	"Hines"	"41334 Ruiz Turnpike"	"Mariabury"	"Alabama"	"73063"
"631189"	"Roger"	"Horton"	"7053 Smith Bypass Suite 199"	"North Robertbury"	"New Hampshire"	"29727"
"201216"	"Katherine"	"Howard"	"0217 William Ways Suite 141"	"East Jamie"	"Maine"	"13591"
"170836"	"Elizabeth"	"Jackson"	"48415 Garcia Light Apt. 625"	"Sarahfort"	"Maryland"	"78884"
"012498"	"Kelly"	"Jackson"	"21385 Olson Prairie Apt. 762"	"North Gregoryside"	"Nevada"	"31323"
"382728"	"Rachel"	"Johnson"	"22828 Richard Lodge Apt. 968"	"West Justinhaven"	"Louisiana"	"15877"
"372270"	"Kaitlyn"	"Jones"	"6183 Travis Villages"	"Port Randall"	"Rhode Island"	"11494"
"616661"	"James"	"Jones"	"5012 Carrillo Grove Suite 782"	"Smithside"	"Florida"	"65223"
"275961"	"Mikayla"	"Kelly"	"2666 Suzanne Knolls"	"Elizabethshire"	"Pennsylvania"	"72973"
"116097"	"Miranda"	"Kirby"	"083 Guy Pines Suite 510"	"New Ellentown"	"Pennsylvania"	"37494"
"694136"	"Heidi"	"Kline"	"2875 Newton Path Apt. 102"	"Brownfurt"	"Wisconsin"	"38610"
"159494"	"John"	"Koch"	"22930 Emma Drive Apt. 520"	"Lake Tara"	"Virginia"	"83633"
"744031"	"Darren"	"Larsen"	"588 Kimberly Shoals Suite 037"	"West Joechester"	"New Mexico"	"69563"
"403038"	"Richard"	"Lawrence"	"2000 Paul Isle Apt. 959"	"Port Timothy"	"West Virginia"	"44575"
"451368"	"Christopher"	"Lester"	"8524 Mason Oval Suite 776"	"North Theresatown"	"Wyoming"	"85410"
"411234"	"John"	"Lewis"	"36603 Donna Trail Suite 513"	"Estradaport"	"Utah"	"68783"
"502078"	"Joseph"	"Lindsey"	"6628 Williams Rapids Suite 087"	"West Lisaville"	"Nevada"	"92801"
"508027"	"Kelli"	"Martinez"	"049 Miller Grove Apt. 386"	"North Danielview"	"New Hampshire"	"09256"
"895284"	"Kathy"	"Martinez"	"38738 Perry Alley Suite 918"	"Mcdonaldtown"	"Oregon"	"92048"
"464298"	"Jamie"	"Mccoy"	"29980 Murphy Mill Suite 146"	"South Gloriaport"	"Oregon"	"89604"
"944828"	"Kimberly"	"Mcneil"	"0489 Harris Run"	"Port Juliaville"	"Pennsylvania"	"20652"
"232978"	"Karen"	"Mendez"	"32427 Marshall Lake Apt. 650"	"Martinchester"	"North Dakota"	"24767"
"078659"	"Nicholas"	"Mendez"	"79515 Lisa Crest"	"North David"	"Tennessee"	"99603"
"362373"	"Justin"	"Moore"	"0216 Strong Forks"	"North Dana"	"Rhode Island"	"86958"
"730060"	"Kevin"	"Oliver"	"8143 Michael Lane Apt. 199"	"Travishaven"	"Michigan"	"13352"
"600622"	"Gregory"	"Payne"	"448 Sampson Squares"	"Cindyton"	"Iowa"	"10227"
"156747"	"Natasha"	"Perez"	"80071 Kelly Flat Apt. 573"	"Matthewmouth"	"Nebraska"	"33358"
"434025"	"Riley"	"Perez"	"378 Anderson Circle"	"East Alexander"	"New Jersey"	"74607"
"976003"	"Sandra"	"Perkins"	"53577 Ashley Coves Suite 068"	"Murphymouth"	"Washington"	"91802"
"523650"	"Andrew"	"Pierce"	"2200 James Rapids Apt. 922"	"Amyland"	"North Dakota"	"70299"
"702699"	"Timothy"	"Proctor"	"0662 Mayer Viaduct Suite 595"	"West Nicholasshire"	"Ohio"	"17112"
"768279"	"Michael"	"Ramos"	"2112 Jill Cliffs"	"Lake Matthew"	"Mississippi"	"94553"
"781879"	"Kimberly"	"Ray"	"5146 Clay Lodge"	"West Jenniferside"	"North Dakota"	"06776"
"347514"	"Toni"	"Robbins"	"3636 Cindy Inlet Apt. 135"	"South Rogerberg"	"New York"	"85287"
"795393"	"Dorothy"	"Robertson"	"010 Vance Fort Apt. 602"	"New Lawrenceville"	"Alaska"	"98350"
"299397"	"Cynthia"	"Rodriguez"	"34307 Neal Heights"	"Wangmouth"	"Kentucky"	"03779"
"195121"	"John"	"Rodriguez"	"61130 Christopher Viaduct Apt. 075"	"West Laurafurt"	"South Carolina"	"16547"
"650569"	"Amanda"	"Sanchez"	"818 Solis Fords Suite 802"	"North Benjamin"	"Nevada"	"30810"
"431431"	"Troy"	"Schmitt"	"22944 Blackwell Stream"	"East Tony"	"Illinois"	"26943"
"349457"	"Cheyenne"	"Sharp"	"88982 Greer Street Apt. 856"	"Phillipsside"	"North Carolina"	"05767"
"131651"	"Brittney"	"Shaw"	"347 Blackburn Rest Suite 707"	"Samanthaberg"	"Kansas"	"55703"
"902159"	"Justin"	"Sims"	"13319 Hale Wall"	"Lake Nathan"	"Texas"	"36300"
"792537"	"Nicolas"	"Smith"	"2200 Dawn Canyon Suite 374"	"North Ruth"	"Alabama"	"25096"
"806076"	"Martin"	"Smith"	"39332 Carter Parkway Apt. 094"	"East Markburgh"	"Mississippi"	"08118"
"826836"	"Brian"	"Smith"	"30188 Catherine Underpass Suite 359"	"New Jonathan"	"New Jersey"	"18010"
"663137"	"Kevin"	"Sosa"	"91707 Michael Square"	"Williamfurt"	"Georgia"	"04516"
"423415"	"Jonathan"	"Stone"	"7850 Weaver Lake"	"South Rebecca"	"Idaho"	"33764"
"063935"	"John"	"Taylor"	"05167 Morgan Extensions"	"Nguyenburgh"	"Massachusetts"	"61191"
"780315"	"Brandy"	"Taylor"	"315 Robert Alley"	"West Julieshire"	"New Mexico"	"09436"
"825658"	"Randy"	"Thomas"	"921 Stacy Alley Suite 901"	"Michaelburgh"	"Arkansas"	"88253"
"407910"	"Angela"	"Thompson"	"408 Newton Mews Suite 064"	"Frostshire"	"Iowa"	"34336"
"022645"	"Alan"	"Torres"	"49412 Adams Square Apt. 949"	"Oconnorhaven"	"Kentucky"	"35154"
"667466"	"Lisa"	"Trevino"	"52745 Fisher Lakes Apt. 804"	"South Jeffrey"	"Massachusetts"	"70674"
"360376"	"Carol"	"Trujillo"	"98114 Andrea Inlet"	"Blairfort"	"Nevada"	"69769"
"345672"	"Tracy"	"Tucker"	"874 John Shoals Apt. 968"	"Ramirezton"	"California"	"18967"
"494841"	"Andrew"	"Vega"	"7022 Smith Ways Suite 452"	"East Jessica"	"Indiana"	"75030"
"144145"	"Laura"	"Villarreal"	"51287 Rebecca Key"	"Morenoland"	"Wisconsin"	"27982"
"723536"	"William"	"Wagner"	"5463 Michael Hill"	"Nelsonland"	"California"	"54655"
"669330"	"Kathy"	"Walker"	"5081 Amy Estate"	"New Deborahland"	"South Dakota"	"33406"
"173805"	"Michael"	"Walker"	"2344 Garcia Trace Suite 633"	"West Jacqueline"	"Hawaii"	"32909"
"202892"	"Kelly"	"Wallace"	"11703 Melissa Plaza Suite 861"	"West Jamiefurt"	"Michigan"	"18438"
"558425"	"Zachary"	"Wang"	"7162 William Union Suite 965"	"New Jeanbury"	"Colorado"	"78103"
"750596"	"Adam"	"West"	"96643 Patricia Springs"	"North Frank"	"Arizona"	"90400"
"657909"	"Christopher"	"Williams"	"238 Mark Road"	"Lake Devinfurt"	"Kentucky"	"95288"
"410536"	"Brittany"	"Wolfe"	"139 Williams Greens"	"Port Joseph"	"Arkansas"	"72930"
"760734"	"Barry"	"Wolfe"	"893 Justin Course"	"Bakermouth"	"Florida"	"58758"
"524808"	"Deborah"	"Wright"	"66416 Paul Underpass Apt. 224"	"Gilbertview"	"Utah"	"77950"
"549342"	"Eric"	"Wright"	"6089 Rivera Viaduct"	"Tammieberg"	"Massachusetts"	"84982"
"195626"	"Sharon"	"Yang"	"23020 Katherine Crescent"	"Simmonsbury"	"Virginia"	"16412"
"047581"	"Meagan"	"Yates"	"971 Austin Mills"	"Jefferyland"	"Wyoming"	"74461"
