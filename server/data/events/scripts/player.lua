local pokemonOutfitIds = {
	["Abomasnow"] = 3068,
	["Abra"] = 966,
	["Absol"] = 1540,
	["Aerodactyl"] = 1045,
	["Aggron"] = 1487,
	["Aipom"] = 1093,
	["Alakazam"] = 968,
	["Altaria"] = 1515,
	["Ambipom"] = 3032,
	["Ampharos"] = 1084,
	["Anorith"] = 1528,
	["Arbok"] = 927,
	["Arcanine"] = 962,
	["Arceus"] = 3101,
	["Ariados"] = 3183,
	["Armaldo"] = 1529,
	["Aron"] = 1485,
	["Articuno"] = 1047,
	["Azelf"] = 3090,
	["Azumarill"] = 1087,
	["Azurill"] = 1479,
	["Bagon"] = 1552,
	["Baltoy"] = 1524,
	["Banette"] = 1535,
	["Barboach"] = 1520,
	["Bastiodon"] = 3019,
	["Bayleef"] = 1056,
	["Beautifly"] = 1448,
	["Beedrill"] = 918,
	["Beldum"] = 1555,
	["Bellossom"] = 1085,
	["Bellsprout"] = 972,
	["Bibarel"] = 3008,
	["Bidoof"] = 3007,
	["Blastoise"] = 912,
	["Blaziken"] = 1438,
	["Blissey"] = 1145,
	["Bonsly"] = 3046,
	["Breloom"] = 1467,
	["Bronzong"] = 3045,
	["Bronzor"] = 3044,
	["Budew"] = 3014,
	["Buizel"] = 3026,
	["Bulbasaur"] = 904,
	["Buneary"] = 3035,
	["Burmy"] = 3020,
	["Butterfree"] = 915,
	["Cacnea"] = 1512,
	["Cacturne"] = 1513,
	["Camerupt"] = 1504,
	["Carnivine"] = 3063,
	["Carvanha"] = 1499,
	["Cascoon"] = 1449,
	["Castform"] = 1532,
	["Caterpie"] = 913,
	["Celebi"] = 1154,
	["Chansey"] = 1016,
	["Charizard"] = 909,
	["Charmander"] = 907,
	["Charmeleon"] = 908,
	["Chatot"] = 3049,
	["Cherrim"] = 3029,
	["Cherubi"] = 3028,
	["Chikorita"] = 1055,
	["Chimchar"] = 2998,
	["Chimecho"] = 1539,
	["Chinchou"] = 1073,
	["Chingling"] = 3041,
	["Clamperl"] = 1547,
	["Claydol"] = 1525,
	["Clefable"] = 3184,
	["Clefairy"] = 3185,
	["Cleffa"] = 1076,
	["Cloyster"] = 994,
	["Combee"] = 3023,
	["Combusken"] = 1437,
	["Corphish"] = 1522,
	["Corsola"] = 3186,
	["Cradily"] = 1527,
	["Cranidos"] = 3016,
	["Crawdaunt"] = 1523,
	["Cresselia"] = 3096,
	["Croagunk"] = 3061,
	["Crobat"] = 1072,
	["Croconaw"] = 1062,
	["Crystal Onix"] = 1303,
	["Cubone"] = 1007,
	["Cultist Flareon"] = 2918,
	["Cyndaquil"] = 1058,
	["Dark Abra"] = 1304,
	["Darkrai"] = 3099,
	["Delcatty"] = 1482,
	["Delibird"] = 3249,
	["Deoxys"] = 1567,
	["Devil Scizor"] = 2915,
	["Dewgong"] = 990,
	["Dialga"] = 3091,
	["Diglett"] = 953,
	["Ditto"] = 1035,
	["Dodrio"] = 988,
	["Doduo"] = 987,
	["Donphan"] = 1135,
	["Dragonair"] = 1051,
	["Dragonite"] = 1052,
	["Drapion"] = 3060,
	["Dratini"] = 1050,
	["Drifblim"] = 3034,
	["Drifloon"] = 3033,
	["Drowzee"] = 999,
	["Dugtrio"] = 954,
	["Dunsparce"] = 1109,
	["Dusclops"] = 1537,
	["Dusknoir"] = 3085,
	["Duskull"] = 1536,
	["Dustox"] = 1450,
	["Eevee"] = 1036,
	["Ekans"] = 926,
	["Electabuzz"] = 1028,
	["Electivire"] = 3074,
	["Electrike"] = 1490,
	["Electrode"] = 1004,
	["Elekid"] = 1142,
	["Elite Hitmonchan"] = 1915,
	["Elite Hitmonlee"] = 1916,
	["Empoleon"] = 3003,
	["Entei"] = 1147,
	["Espeon"] = 1099,
	["Exeggcute"] = 1005,
	["Exeggutor"] = 1006,
	["Exploud"] = 1476,
	["Farfetch'd"] = 986,
	["Fearow"] = 925,
	["Feebas"] = 1530,
	["Feraligatr"] = 1063,
	["Finneon"] = 3064,
	["Flaaffy"] = 3244,
	["Flareon"] = 1039,
	["Floatzel"] = 3027,
	["Flygon"] = 1511,
	["Forretress"] = 3190,
	["Froslass"] = 3086,
	["Furret"] = 1065,
	["Gabite"] = 3052,
	["Gallade"] = 3083,
	["Garchomp"] = 3053,
	["Gardevoir"] = 1463,
	["Gastly"] = 995,
	["Gastrodon"] = 3031,
	["Gengar"] = 997,
	["Geodude"] = 977,
	["Gible"] = 3051,
	["Girafarig"] = 3245,
	["Giratina"] = 3095,
	["Glaceon"] = 3079,
	["Glalie"] = 1543,
	["Glameow"] = 3039,
	["Gligar"] = 1110,
	["Gliscor"] = 3080,
	["Gloom"] = 947,
	["Golbat"] = 945,
	["Goldeen"] = 1021,
	["Golduck"] = 3191,
	["Golem"] = 979,
	["Gorebyss"] = 1549,
	["Granbull"] = 1113,
	["Graveler"] = 978,
	["Grimer"] = 991,
	["Grotle"] = 2996,
	["Groudon"] = 1564,
	["Grovyle"] = 1434,
	["Growlithe"] = 961,
	["Grumpig"] = 1507,
	["Gulpin"] = 1497,
	["Gyarados"] = 1033,
	["Hag Jynx"] = 3253,
	["Happiny"] = 3048,
	["Hariyama"] = 1478,
	["Haunter"] = 996,
	["Heatran"] = 3093,
	["Heracross"] = 3192,
	["Hippopotas"] = 3057,
	["Hippowdon"] = 3058,
	["Hitmonchan"] = 1010,
	["Hitmonlee"] = 1009,
	["Hitmontop"] = 1140,
	["Ho-oh"] = 1153,
	["Honchkrow"] = 3038,
	["Hoothoot"] = 1066,
	["Hoppip"] = 1090,
	["Horsea"] = 1019,
	["Houndoom"] = 1132,
	["Houndour"] = 1131,
	["Huntail"] = 1548,
	["Hypno"] = 1000,
	["Igglybuff"] = 1077,
	["Illumise"] = 1495,
	["Infernape"] = 3000,
	["Ivysaur"] = 905,
	["Jigglypuff"] = 3194,
	["Jirachi"] = 1566,
	["Jolteon"] = 1038,
	["Jumpluff"] = 1092,
	["Jynx"] = 1027,
	["Kabuto"] = 1043,
	["Kabutops"] = 1044,
	["Kadabra"] = 3196,
	["Kakuna"] = 917,
	["Kangaskhan"] = 1018,
	["Kecleon"] = 1533,
	["Kingdra"] = 1133,
	["Kingler"] = 1002,
	["Kirlia"] = 1462,
	["Koffing"] = 1012,
	["Krabby"] = 1001,
	["Kricketot"] = 3009,
	["Kricketune"] = 3010,
	["Kyogre"] = 1563,
	["Lairon"] = 1486,
	["Lanturn"] = 3197,
	["Lapras"] = 1034,
	["Larvitar"] = 1149,
	["Latias"] = 1561,
	["Latios"] = 1562,
	["Leafeon"] = 3078,
	["Ledian"] = 1069,
	["Ledyba"] = 1068,
	["Lickilicky"] = 3071,
	["Lickitung"] = 1011,
	["Lileep"] = 1526,
	["Linoone"] = 1445,
	["Lombre"] = 1452,
	["Lopunny"] = 3036,
	["Lotad"] = 1451,
	["Loudred"] = 1475,
	["Lucario"] = 3056,
	["Ludicolo"] = 1453,
	["Lugia"] = 1152,
	["Lumineon"] = 3065,
	["Lunatone"] = 1518,
	["Luvdisc"] = 1551,
	["Luxio"] = 3012,
	["Luxray"] = 3013,
	["Machamp"] = 971,
	["Machoke"] = 3198,
	["Machop"] = 3199,
	["Magby"] = 1143,
	["Magcargo"] = 3248,
	["Magikarp"] = 1032,
	["Magmar"] = 1029,
	["Magmortar"] = 3075,
	["Magnemite"] = 3200,
	["Magneton"] = 985,
	["Magnezone"] = 3070,
	["Makuhita"] = 1477,
	["Mamoswine"] = 3081,
	["Manaphy"] = 3098,
	["Manectric"] = 1491,
	["Mankey"] = 959,
	["Mantine"] = 3201,
	["Mantyke"] = 3066,
	["Mareep"] = 3202,
	["Marill"] = 1086,
	["Marowak"] = 1008,
	["Marshtomp"] = 1440,
	["Masquerain"] = 1465,
	["Mawile"] = 1484,
	["Medicham"] = 1489,
	["Meditite"] = 1488,
	["Meganium"] = 1057,
	["Meowth"] = 3203,
	["Mesprit"] = 3089,
	["Metagross"] = 1557,
	["Metang"] = 1556,
	["Metapod"] = 914,
	["Mew"] = 1054,
	["Mewtwo"] = 1053,
	["Mightyena"] = 1443,
	["Milotic"] = 1531,
	["Miltank"] = 1144,
	["Mime Jr"] = 3047,
	["Mime"] = 0,
	["Minun"] = 1493,
	["Misdreavus"] = 1103,
	["Mismagius"] = 3037,
	["Moltres"] = 1049,
	["Monferno"] = 2999,
	["Mothim"] = 3022,
	["Mr. Mime"] = 1025,
	["Mudkip"] = 1439,
	["Muk"] = 992,
	["Munchlax"] = 3054,
	["Murkrow"] = 3246,
	["Natu"] = 1080,
	["Nidoking"] = 937,
	["Nidoqueen"] = 934,
	["Nidoran Female"] = 932,
	["Nidoran Male"] = 935,
	["Nidorina"] = 933,
	["Nidorino"] = 936,
	["Nincada"] = 1471,
	["Ninetales"] = 941,
	["Ninjask"] = 1472,
	["Noctowl"] = 1067,
	["Nosepass"] = 1480,
	["Numel"] = 1503,
	["Nuzleaf"] = 1455,
	["Octillery"] = 1127,
	["Oddish"] = 946,
	["Omanyte"] = 1041,
	["Omastar"] = 1042,
	["Onix"] = 998,
	["Pachirisu"] = 3025,
	["Palkia"] = 3092,
	["Panic Hypno"] = 2916,
	["Paras"] = 949,
	["Parasect"] = 950,
	["Pelipper"] = 1460,
	["Persian"] = 3205,
	["Phanpy"] = 1134,
	["Phione"] = 3097,
	["Pichu"] = 1075,
	["Pidgeot"] = 921,
	["Pidgeotto"] = 3206,
	["Pidgey"] = 919,
	["Pikachu"] = 3375,
	["Piloswine"] = 3207,
	["Pineco"] = 1107,
	["Pinsir"] = 1030,
	["Piplup"] = 3001,
	["Pirate Raichu"] = 2929,
	["Plusle"] = 1492,
	["Politoed"] = 3209,
	["Poliwag"] = 963,
	["Poliwhirl"] = 964,
	["Poliwrath"] = 965,
	["Ponyta"] = 980,
	["Poochyena"] = 1442,
	["Porygon-Z"] = 3082,
	["Porygon"] = 1040,
	["Porygon2"] = 1136,
	["Primeape"] = 960,
	["Prinplup"] = 3002,
	["Probopass"] = 3084,
	["Psyduck"] = 3211,
	["Pupitar"] = 3212,
	["Purugly"] = 3040,
	["Quagsire"] = 1098,
	["Quilava"] = 1059,
	["Qwilfish"] = 1114,
	["Raichu"] = 929,
	["Raikou"] = 1146,
	["Ralts"] = 1461,
	["Rampardos"] = 3017,
	["Rapidash"] = 981,
	["Raticate"] = 3213,
	["Rattata"] = 3214,
	["Raven Fearow"] = 2920,
	["Rayquaza"] = 1565,
	["Regice"] = 1559,
	["Regigigas"] = 3094,
	["Regirock"] = 1558,
	["Registeel"] = 1560,
	["Relicanth"] = 1550,
	["Remoraid"] = 1126,
	["Rhydon"] = 1015,
	["Rhyhorn"] = 1014,
	["Rhyperior"] = 3072,
	["Riolu"] = 3055,
	["Roselia"] = 1496,
	["Roserade"] = 3015,
	["Rotom"] = 3087,
	["Sableye"] = 1483,
	["Salamence"] = 1554,
	["Sandshrew"] = 3215,
	["Sandslash"] = 3216,
	["Sceptile"] = 1435,
	["Scizor"] = 1115,
	["Scyther"] = 1026,
	["Seadra"] = 1020,
	["Seaking"] = 1022,
	["Sealeo"] = 1545,
	["Seedot"] = 1454,
	["Seel"] = 989,
	["Sentret"] = 1064,
	["Seviper"] = 1517,
	["Sharpedo"] = 1500,
	["Shaymin"] = 3100,
	["Shedinja"] = 1473,
	["Shelgon"] = 1553,
	["Shellder"] = 993,
	["Shellos"] = 3030,
	["Shieldon"] = 3018,
	["Shiftry"] = 1456,
	["Shinx"] = 3011,
	["Shiny Abomasnow"] = 3338,
	["Shiny Abra"] = 1224,
	["Shiny Absol"] = 3217,
	["Shiny Aerodactyl"] = 1295,
	["Shiny Aggron"] = 1795,
	["Shiny Aipom"] = 1663,
	["Shiny Alakazam"] = 1226,
	["Shiny Altaria"] = 1823,
	["Shiny Ambipom"] = 3303,
	["Shiny Ampharos"] = 1654,
	["Shiny Anorith"] = 1836,
	["Shiny Arbok"] = 1195,
	["Shiny Arcanine"] = 1220,
	["Shiny Arceus"] = 0,
	["Shiny Ariados"] = 3218,
	["Shiny Armaldo"] = 1837,
	["Shiny Aron"] = 1793,
	["Shiny Articuno"] = 1296,
	["Shiny Azelf"] = 3360,
	["Shiny Azumarill"] = 1657,
	["Shiny Azurill"] = 1656,
	["Shiny Bagon"] = 1858,
	["Shiny Baltoy"] = 1832,
	["Shiny Banette"] = 1842,
	["Shiny Barboach"] = 1828,
	["Shiny Bastiodon"] = 3290,
	["Shiny Bayleef"] = 1626,
	["Shiny Beautifly"] = 1758,
	["Shiny Beedrill"] = 1186,
	["Shiny Beldum"] = 1861,
	["Shiny Bellossom"] = 1655,
	["Shiny Bellsprout"] = 1230,
	["Shiny Bibarel"] = 3280,
	["Shiny Bidoof"] = 3279,
	["Shiny Blastoise"] = 1180,
	["Shiny Blaziken"] = 1748,
	["Shiny Blissey"] = 1715,
	["Shiny Bonsly"] = 3317,
	["Shiny Breloom"] = 1776,
	["Shiny Bronzong"] = 3316,
	["Shiny Bronzor"] = 3315,
	["Shiny Budew"] = 3285,
	["Shiny Buizel"] = 3297,
	["Shiny Bulbasaur"] = 1172,
	["Shiny Buneary"] = 3306,
	["Shiny Burmy"] = 3291,
	["Shiny Butterfree"] = 1183,
	["Shiny Cacnea"] = 1820,
	["Shiny Cacturne"] = 1821,
	["Shiny Camerupt"] = 1812,
	["Shiny Carnivine"] = 3334,
	["Shiny Carvanha"] = 1807,
	["Shiny Cascoon"] = 1759,
	["Shiny Castform"] = 1532,
	["Shiny Caterpie"] = 1181,
	["Shiny Celebi"] = 1154,
	["Shiny Chansey"] = 1602,
	["Shiny Charizard"] = 1177,
	["Shiny Charmander"] = 1175,
	["Shiny Charmeleon"] = 1176,
	["Shiny Chatot"] = 3320,
	["Shiny Cherrim"] = 3300,
	["Shiny Cherubi"] = 3299,
	["Shiny Chikorita"] = 1625,
	["Shiny Chimchar"] = 3270,
	["Shiny Chimecho"] = 1846,
	["Shiny Chinchou"] = 1643,
	["Shiny Chingling"] = 3312,
	["Shiny Clamperl"] = 1853,
	["Shiny Claydol"] = 1833,
	["Shiny Clefable"] = 1603,
	["Shiny Clefairy"] = 1604,
	["Shiny Cleffa"] = 1646,
	["Shiny Cloyster"] = 1250,
	["Shiny Combee"] = 3294,
	["Shiny Combusken"] = 1747,
	["Shiny Corphish"] = 1830,
	["Shiny Corsola"] = 1695,
	["Shiny Cradily"] = 1835,
	["Shiny Cranidos"] = 3287,
	["Shiny Crawdaunt"] = 1831,
	["Shiny Cresselia"] = 3366,
	["Shiny Croagunk"] = 3332,
	["Shiny Crobat"] = 1642,
	["Shiny Croconaw"] = 1632,
	["Shiny Cubone"] = 1263,
	["Shiny Cyndaquil"] = 1628,
	["Shiny Darkrai"] = 3369,
	["Shiny Delcatty"] = 1790,
	["Shiny Delibird"] = 1698,
	["Shiny Deoxys"] = 1567,
	["Shiny Dewgong"] = 1246,
	["Shiny Dialga"] = 3361,
	["Shiny Diglett"] = 1217,
	["Shiny Ditto"] = 1288,
	["Shiny Dodrio"] = 1244,
	["Shiny Doduo"] = 1243,
	["Shiny Donphan"] = 1705,
	["Shiny Dragonair"] = 1299,
	["Shiny Dragonite"] = 1300,
	["Shiny Drapion"] = 3331,
	["Shiny Dratini"] = 1298,
	["Shiny Drifblim"] = 3305,
	["Shiny Drifloon"] = 3304,
	["Shiny Drowzee"] = 1255,
	["Shiny Dugtrio"] = 1218,
	["Shiny Dunsparce"] = 1679,
	["Shiny Dusclops"] = 1844,
	["Shiny Dusknoir"] = 3355,
	["Shiny Duskull"] = 1843,
	["Shiny Dustox"] = 1760,
	["Shiny Eevee"] = 1289,
	["Shiny Ekans"] = 1194,
	["Shiny Electabuzz"] = 1281,
	["Shiny Electivire"] = 3344,
	["Shiny Electrike"] = 1798,
	["Shiny Electrode"] = 1260,
	["Shiny Elekid"] = 1712,
	["Shiny Empoleon"] = 3275,
	["Shiny Entei"] = 1147,
	["Shiny Espeon"] = 1669,
	["Shiny Exeggcute"] = 1261,
	["Shiny Exeggutor"] = 1262,
	["Shiny Exploud"] = 1785,
	["Shiny Farfetch'd"] = 1242,
	["Shiny Fearow"] = 1193,
	["Shiny Feebas"] = 1838,
	["Shiny Feraligatr"] = 1633,
	["Shiny Finneon"] = 3335,
	["Shiny Flaaffy"] = 1653,
	["Shiny Flareon"] = 3220,
	["Shiny Floatzel"] = 3298,
	["Shiny Flygon"] = 1819,
	["Shiny Forretress"] = 1678,
	["Shiny Froslass"] = 3356,
	["Shiny Furret"] = 1635,
	["Shiny Gabite"] = 3323,
	["Shiny Gallade"] = 3353,
	["Shiny Garchomp"] = 3324,
	["Shiny Gardevoir"] = 1772,
	["Shiny Gastly"] = 1251,
	["Shiny Gastrodon"] = 3302,
	["Shiny Gengar"] = 1253,
	["Shiny Geodude"] = 1235,
	["Shiny Gible"] = 3322,
	["Shiny Girafarig"] = 1676,
	["Shiny Giratina"] = 3365,
	["Shiny Glaceon"] = 3349,
	["Shiny Glalie"] = 1849,
	["Shiny Glameow"] = 3310,
	["Shiny Gligar"] = 1680,
	["Shiny Gliscor"] = 3350,
	["Shiny Gloom"] = 1211,
	["Shiny Golbat"] = 1209,
	["Shiny Goldeen"] = 1274,
	["Shiny Golduck"] = 1606,
	["Shiny Golem"] = 1237,
	["Shiny Gorebyss"] = 1855,
	["Shiny Granbull"] = 1683,
	["Shiny Graveler"] = 1236,
	["Shiny Grimer"] = 1607,
	["Shiny Grotle"] = 3268,
	["Shiny Groudon"] = 1868,
	["Shiny Grovyle"] = 1744,
	["Shiny Growlithe"] = 1219,
	["Shiny Grumpig"] = 1815,
	["Shiny Gulpin"] = 1805,
	["Shiny Gyarados"] = 1286,
	["Shiny Happiny"] = 3319,
	["Shiny Hariyama"] = 1787,
	["Shiny Haunter"] = 1252,
	["Shiny Heatran"] = 3363,
	["Shiny Heracross"] = 1687,
	["Shiny Hippopotas"] = 3328,
	["Shiny Hippowdon"] = 3329,
	["Shiny Hitmonchan"] = 1266,
	["Shiny Hitmonlee"] = 1265,
	["Shiny Hitmontop"] = 1710,
	["Shiny Ho-oh"] = 1153,
	["Shiny Honchkrow"] = 3309,
	["Shiny Hoothoot"] = 1636,
	["Shiny Hoppip"] = 1660,
	["Shiny Horsea"] = 1272,
	["Shiny Houndoom"] = 1702,
	["Shiny Houndour"] = 1701,
	["Shiny Huntail"] = 1854,
	["Shiny Hypno"] = 1256,
	["Shiny Igglybuff"] = 1647,
	["Shiny Illumise"] = 1803,
	["Shiny Infernape"] = 3272,
	["Shiny Ivysaur"] = 1173,
	["Shiny Jigglypuff"] = 1608,
	["Shiny Jirachi"] = 1870,
	["Shiny Jolteon"] = 3221,
	["Shiny Jumpluff"] = 1662,
	["Shiny Jynx"] = 1280,
	["Shiny Kabuto"] = 1293,
	["Shiny Kabutops"] = 1294,
	["Shiny Kadabra"] = 1225,
	["Shiny Kakuna"] = 1185,
	["Shiny Kangaskhan"] = 1018,
	["Shiny Kecleon"] = 1840,
	["Shiny Kingdra"] = 1703,
	["Shiny Kingler"] = 1258,
	["Shiny Kirlia"] = 1462,
	["Shiny Koffing"] = 1267,
	["Shiny Krabby"] = 1257,
	["Shiny Kricketot"] = 3281,
	["Shiny Kricketune"] = 3282,
	["Shiny Kyogre"] = 1867,
	["Shiny Lairon"] = 1794,
	["Shiny Lanturn"] = 3222,
	["Shiny Lapras"] = 1287,
	["Shiny Larvitar"] = 1719,
	["Shiny Latias"] = 1561,
	["Shiny Latios"] = 1562,
	["Shiny Leafeon"] = 3348,
	["Shiny Ledian"] = 1639,
	["Shiny Ledyba"] = 1638,
	["Shiny Lickilicky"] = 3341,
	["Shiny Lickitung"] = 1610,
	["Shiny Lileep"] = 1834,
	["Shiny Linoone"] = 1755,
	["Shiny Lombre"] = 1762,
	["Shiny Lopunny"] = 3307,
	["Shiny Lotad"] = 1761,
	["Shiny Loudred"] = 1784,
	["Shiny Lucario"] = 3327,
	["Shiny Ludicolo"] = 3374,
	["Shiny Lugia"] = 1152,
	["Shiny Lumineon"] = 3335,
	["Shiny Lunatone"] = 1826,
	["Shiny Luvdisc"] = 1857,
	["Shiny Luxio"] = 3284,
	["Shiny Luxray"] = 3284,
	["Shiny Machamp"] = 1229,
	["Shiny Machoke"] = 1228,
	["Shiny Machop"] = 1227,
	["Shiny Magby"] = 1713,
	["Shiny Magcargo"] = 1692,
	["Shiny Magikarp"] = 1285,
	["Shiny Magmar"] = 1282,
	["Shiny Magmortar"] = 3345,
	["Shiny Magnemite"] = 1240,
	["Shiny Magneton"] = 1241,
	["Shiny Magnezone"] = 3340,
	["Shiny Makuhita"] = 1786,
	["Shiny Mamoswine"] = 3351,
	["Shiny Manaphy"] = 3368,
	["Shiny Manectric"] = 1799,
	["Shiny Mankey"] = 1611,
	["Shiny Mantine"] = 1699,
	["Shiny Mantyke"] = 3336,
	["Shiny Mareep"] = 1652,
	["Shiny Marill"] = 1656,
	["Shiny Marowak"] = 1264,
	["Shiny Marshtomp"] = 1750,
	["Shiny Masquerain"] = 1774,
	["Shiny Mawile"] = 1792,
	["Shiny Medicham"] = 1797,
	["Shiny Meditite"] = 1796,
	["Shiny Meganium"] = 1627,
	["Shiny Meowth"] = 1612,
	["Shiny Mesprit"] = 3359,
	["Shiny Metagross"] = 1863,
	["Shiny Metang"] = 1862,
	["Shiny Metapod"] = 1182,
	["Shiny Mew"] = 1302,
	["Shiny Mewtwo"] = 1301,
	["Shiny Mightyena"] = 1753,
	["Shiny Milotic"] = 1839,
	["Shiny Miltank"] = 1714,
	["Shiny Mime Jr"] = 3318,
	["Shiny Minun"] = 1801,
	["Shiny Misdreavus"] = 1673,
	["Shiny Mismagius"] = 3308,
	["Shiny Moltres"] = 1297,
	["Shiny Monferno"] = 3271,
	["Shiny Mothim"] = 3293,
	["Shiny Mr. Mime"] = 1278,
	["Shiny Mudkip"] = 1749,
	["Shiny Muk"] = 1613,
	["Shiny Munchlax"] = 3325,
	["Shiny Murkrow"] = 1671,
	["Shiny Natu"] = 1650,
	["Shiny Nidoking"] = 1205,
	["Shiny Nidoqueen"] = 1202,
	["Shiny Nidoran Female"] = 1200,
	["Shiny Nidoran Male"] = 1203,
	["Shiny Nidorina"] = 1201,
	["Shiny Nidorino"] = 1204,
	["Shiny Nincada"] = 1780,
	["Shiny Ninetales"] = 1911,
	["Shiny Ninjask"] = 1781,
	["Shiny Noctowl"] = 1637,
	["Shiny Nosepass"] = 1788,
	["Shiny Numel"] = 1811,
	["Shiny Nuzleaf"] = 1765,
	["Shiny Octillery"] = 1697,
	["Shiny Oddish"] = 1210,
	["Shiny Omanyte"] = 1291,
	["Shiny Omastar"] = 1292,
	["Shiny Onix"] = 1254,
	["Shiny Pachirisu"] = 3296,
	["Shiny Palkia"] = 3362,
	["Shiny Paras"] = 1213,
	["Shiny Parasect"] = 1214,
	["Shiny Pelipper"] = 1770,
	["Shiny Persian"] = 1614,
	["Shiny Phanpy"] = 1704,
	["Shiny Phione"] = 3367,
	["Shiny Pichu"] = 1645,
	["Shiny Pidgeot"] = 1189,
	["Shiny Pidgeotto"] = 1188,
	["Shiny Pidgey"] = 1187,
	["Shiny Pikachu"] = 1196,
	["Shiny Piloswine"] = 1694,
	["Shiny Pineco"] = 1677,
	["Shiny Pinsir"] = 1283,
	["Shiny Piplup"] = 3273,
	["Shiny Plusle"] = 1800,
	["Shiny Politoed"] = 3224,
	["Shiny Poliwag"] = 1221,
	["Shiny Poliwhirl"] = 1222,
	["Shiny Poliwrath"] = 1223,
	["Shiny Ponyta"] = 1238,
	["Shiny Poochyena"] = 1752,
	["Shiny Porygon-Z"] = 3352,
	["Shiny Porygon"] = 1290,
	["Shiny Porygon2"] = 1706,
	["Shiny Primeape"] = 1615,
	["Shiny Prinplup"] = 3274,
	["Shiny Probopass"] = 3354,
	["Shiny Psyduck"] = 1616,
	["Shiny Pupitar"] = 3225,
	["Shiny Purugly"] = 3311,
	["Shiny Quagsire"] = 1668,
	["Shiny Quilava"] = 1629,
	["Shiny Qwilfish"] = 1684,
	["Shiny Raichu"] = 1197,
	["Shiny Raikou"] = 1146,
	["Shiny Ralts"] = 1771,
	["Shiny Rampardos"] = 3288,
	["Shiny Rapidash"] = 1239,
	["Shiny Raticate"] = 1191,
	["Shiny Rattata"] = 1190,
	["Shiny Rayquaza"] = 1869,
	["Shiny Regice"] = 1865,
	["Shiny Regigigas"] = 3364,
	["Shiny Regirock"] = 1864,
	["Shiny Registeel"] = 1866,
	["Shiny Relicanth"] = 1856,
	["Shiny Remoraid"] = 1696,
	["Shiny Rhydon"] = 1270,
	["Shiny Rhyhorn"] = 1269,
	["Shiny Rhyperior"] = 3342,
	["Shiny Riolu"] = 3326,
	["Shiny Roselia"] = 1804,
	["Shiny Roserade"] = 3286,
	["Shiny Rotom"] = 3357,
	["Shiny Sableye"] = 1791,
	["Shiny Salamence"] = 1860,
	["Shiny Sandshrew"] = 1198,
	["Shiny Sandslash"] = 1199,
	["Shiny Sceptile"] = 1745,
	["Shiny Scizor"] = 1685,
	["Shiny Scyther"] = 1279,
	["Shiny Seadra"] = 1273,
	["Shiny Seaking"] = 1275,
	["Shiny Sealeo"] = 1851,
	["Shiny Seedot"] = 1764,
	["Shiny Seel"] = 1245,
	["Shiny Sentret"] = 1634,
	["Shiny Seviper"] = 1825,
	["Shiny Sharpedo"] = 1808,
	["Shiny Shaymin"] = 3370,
	["Shiny Shedinja"] = 1782,
	["Shiny Shelgon"] = 1859,
	["Shiny Shellder"] = 1249,
	["Shiny Shellos"] = 3301,
	["Shiny Shieldon"] = 3289,
	["Shiny Shiftry"] = 1766,
	["Shiny Shinx"] = 3283,
	["Shiny Shroomish"] = 1775,
	["Shiny Shuckle"] = 1686,
	["Shiny Shuppet"] = 1841,
	["Shiny Silcoon"] = 1757,
	["Shiny Skarmory"] = 1700,
	["Shiny Skiploom"] = 1661,
	["Shiny Skitty"] = 1789,
	["Shiny Skorupi"] = 3330,
	["Shiny Skuntank"] = 3314,
	["Shiny Slaking"] = 1779,
	["Shiny Slakoth"] = 1777,
	["Shiny Slowbro"] = 1617,
	["Shiny Slowking"] = 1624,
	["Shiny Slowpoke"] = 1618,
	["Shiny Slugma"] = 1691,
	["Shiny Smeargle"] = 1708,
	["Shiny Smoochum"] = 1711,
	["Shiny Sneasel"] = 1688,
	["Shiny Snorlax"] = 1619,
	["Shiny Snorunt"] = 1848,
	["Shiny Snover"] = 3337,
	["Shiny Snubbull"] = 1682,
	["Shiny Solrock"] = 1827,
	["Shiny Spearow"] = 1192,
	["Shiny Spheal"] = 1850,
	["Shiny Spinarak"] = 1640,
	["Shiny Spinda"] = 1816,
	["Shiny Spiritomb"] = 3321,
	["Shiny Spoink"] = 1814,
	["Shiny Squirtle"] = 1178,
	["Shiny Stantler"] = 3230,
	["Shiny Staraptor"] = 3278,
	["Shiny Staravia"] = 3277,
	["Shiny Starly"] = 3276,
	["Shiny Starmie"] = 1277,
	["Shiny Staryu"] = 1276,
	["Shiny Steelix"] = 3231,
	["Shiny Stunky"] = 3313,
	["Shiny Sudowoodo"] = 1658,
	["Shiny Suicune"] = 1148,
	["Shiny Sunflora"] = 1665,
	["Shiny Sunkern"] = 1664,
	["Shiny Surskit"] = 1773,
	["Shiny Swablu"] = 1822,
	["Shiny Swalot"] = 1806,
	["Shiny Swampert"] = 3373,
	["Shiny Swellow"] = 1768,
	["Shiny Swinub"] = 1693,
	["Shiny Taillow"] = 1767,
	["Shiny Tangela"] = 1271,
	["Shiny Tangrowth"] = 3343,
	["Shiny Tauros"] = 1284,
	["Shiny Teddiursa"] = 1689,
	["Shiny Tentacool"] = 1233,
	["Shiny Tentacruel"] = 1234,
	["Shiny Togekiss"] = 3346,
	["Shiny Togepi"] = 1648,
	["Shiny Togetic"] = 1649,
	["Shiny Torchic"] = 1746,
	["Shiny Torkoal"] = 1813,
	["Shiny Torterra"] = 3269,
	["Shiny Totodile"] = 1631,
	["Shiny toxicroak"] = 3333,
	["Shiny Trapinch"] = 1817,
	["Shiny Treecko"] = 1743,
	["Shiny Tropius"] = 1845,
	["Shiny Turtwig"] = 3267,
	["Shiny Typhlosion"] = 1630,
	["Shiny Tyranitar"] = 1721,
	["Shiny Tyrogue"] = 1709,
	["Shiny Umbreon"] = 1670,
	["Shiny Unown"] = 1674,
	["Shiny Ursaring"] = 1690,
	["Shiny Uxie"] = 3358,
	["Shiny Vaporeon"] = 3232,
	["Shiny Venomoth"] = 1216,
	["Shiny Venonat"] = 1215,
	["Shiny Venusaur"] = 1174,
	["Shiny Vespiquen"] = 3295,
	["Shiny Vibrava"] = 1818,
	["Shiny Victreebel"] = 1232,
	["Shiny Vigoroth"] = 1778,
	["Shiny Vileplume"] = 1621,
	["Shiny Volbeat"] = 1802,
	["Shiny Voltorb"] = 1259,
	["Shiny Vulpix"] = 1206,
	["Shiny Wailmer"] = 1809,
	["Shiny Wailord"] = 1810,
	["Shiny Walrein"] = 1852,
	["Shiny Wartortle"] = 1179,
	["Shiny Weavile"] = 3339,
	["Shiny Weedle"] = 1184,
	["Shiny Weepinbell"] = 1231,
	["Shiny Weezing"] = 1268,
	["Shiny Whiscash"] = 1829,
	["Shiny Whismur"] = 1783,
	["Shiny Wigglytuff"] = 1622,
	["Shiny Wingull"] = 1769,
	["Shiny Wobbuffet"] = 1675,
	["Shiny Wooper"] = 1667,
	["Shiny Wormadam"] = 3292,
	["Shiny Wurmple"] = 1756,
	["Shiny Wynaut"] = 1541,
	["Shiny Xatu"] = 3233,
	["Shiny Yanma"] = 1666,
	["Shiny Yanmega"] = 3347,
	["Shiny Zangoose"] = 1824,
	["Shiny Zapdos"] = 1048,
	["Shiny Zigzagoon"] = 1754,
	["Shiny Zubat"] = 1208,
	["Shroomish"] = 1466,
	["Shuckle"] = 1116,
	["Shuppet"] = 1534,
	["Silcoon"] = 1447,
	["Skarmory"] = 1130,
	["Skiploom"] = 1091,
	["Skitty"] = 1481,
	["Skorupi"] = 3059,
	["Skuntank"] = 3043,
	["Slaking"] = 1470,
	["Slakoth"] = 1468,
	["Slowbro"] = 983,
	["Slowking"] = 1102,
	["Slowpoke"] = 982,
	["Slugma"] = 1121,
	["Smeargle"] = 3234,
	["Smoochum"] = 1141,
	["Sneasel"] = 1118,
	["Snorlax"] = 1046,
	["Snorunt"] = 1542,
	["Snover"] = 3067,
	["Snubbull"] = 1112,
	["Solrock"] = 1519,
	["Spearow"] = 924,
	["Spheal"] = 1544,
	["Spinarak"] = 1070,
	["Spinda"] = 1508,
	["Spiritomb"] = 3050,
	["Spoink"] = 1506,
	["Squirtle"] = 910,
	["Stantler"] = 3235,
	["Staraptor"] = 3006,
	["Staravia"] = 3005,
	["Starly"] = 3004,
	["Starmie"] = 1024,
	["Staryu"] = 1023,
	["Steelix"] = 1111,
	["Stunky"] = 3042,
	["Sudowoodo"] = 1088,
	["Suicune"] = 1148,
	["Sunflora"] = 1095,
	["Sunkern"] = 1094,
	["Surskit"] = 1464,
	["Swablu"] = 1514,
	["Swalot"] = 1498,
	["Swampert"] = 1441,
	["Swellow"] = 1458,
	["Swinub"] = 1123,
	["Taillow"] = 1457,
	["Tangela"] = 1017,
	["Tangrowth"] = 3073,
	["Tauros"] = 1031,
	["Teddiursa"] = 1119,
	["Tentacool"] = 975,
	["Tentacruel"] = 976,
	["Togekiss"] = 3076,
	["Togepi"] = 1078,
	["Togetic"] = 3238,
	["Torchic"] = 1436,
	["Torkoal"] = 1505,
	["Torterra"] = 2997,
	["Totodile"] = 1061,
	["toxicroak"] = 3062,
	["Trapinch"] = 1509,
	["Treecko"] = 1433,
	["Tropius"] = 1538,
	["Turtwig"] = 2995,
	["Typhlosion"] = 1060,
	["Tyranitar"] = 1151,
	["Tyrogue"] = 1139,
	["Umbreon"] = 1100,
	["Unown"] = 1104,
	["Ursaring"] = 3239,
	["Uxie"] = 3088,
	["Vaporeon"] = 1037,
	["Venomoth"] = 952,
	["Venonat"] = 951,
	["Venusaur"] = 906,
	["Vespiquen"] = 3024,
	["Vibrava"] = 1510,
	["Victreebel"] = 974,
	["Vigoroth"] = 1469,
	["Vileplume"] = 948,
	["Volbeat"] = 1494,
	["Voltorb"] = 1003,
	["Vulpix"] = 940,
	["Wailmer"] = 1501,
	["Wailord"] = 1502,
	["Walrein"] = 1546,
	["Wartortle"] = 911,
	["Weavile"] = 3069,
	["Weedle"] = 916,
	["Weepinbell"] = 973,
	["Weezing"] = 1013,
	["Whiscash"] = 1521,
	["Whismur"] = 1474,
	["Wigglytuff"] = 3242,
	["Wingull"] = 1459,
	["Wobbuffet"] = 1105,
	["Wooper"] = 1097,
	["Wormadam"] = 3021,
	["Wurmple"] = 1446,
	["Wynaut"] = 1541,
	["Xatu"] = 3243,
	["Yanma"] = 3247,
	["Yanmega"] = 3077,
	["Zangoose"] = 1516,
	["Zapdos"] = 1048,
	["Zigzagoon"] = 1444,
	["Zubat"] = 944,
}



function Player:onBrowseField(position)
	return true
end



function Player:onLook(thing, position, distance)
	local description = "You see " .. thing:getDescription(distance)
	if not thing:isItem() and isSummon(thing) then
		local master = thing:getMaster()
		if master:isPlayer() then
			local item = master:getUsingBall()
			local pokeName = item:getSpecialAttribute("pokeName")
			local pokeLevel = item:getSpecialAttribute("pokeLevel")
			local pokeBoost = item:getSpecialAttribute("pokeBoost") or 0
			--local pokeLove = item:getSpecialAttribute("pokeLove") or 0\
			if pokeName ~= nil and pokeLevel ~= nil then	
                local outfit = thing:getOutfit()
                description = string.format("%s\nOutfitID: %s.", description, outfit.lookType)
				description = string.format("%s\nIt belongs to %s. Level: %s. Boost: +%s. Health: %s. Attack: %s. Magic Attack: %s. Magic Defense: %s. Armor: %s. Speed: %s.", description, master:getName(), pokeLevel, pokeBoost, thing:getTotalHealth(), thing:getTotalMeleeAttack(), thing:getTotalMagicAttack(), thing:getTotalMagicDefense(), thing:getTotalDefense(), thing:getTotalSpeed())
			end
		end
	end
	if thing:isItem() and thing:isPokeball() then
		local pokeName = thing:getSpecialAttribute("pokeName")
		local pokeLevel = thing:getSpecialAttribute("pokeLevel")
		local pokeBoost = thing:getSpecialAttribute("pokeBoost") or 0
		--local pokeLove = thing:getSpecialAttribute("pokeLove") or 0
		local ownerName = thing:getSpecialAttribute("owner")
		local pokeHealth = tonumber(thing:getSpecialAttribute("pokeHealth")) or 0
		local healthStr = ""
		if ownerName then
			healthStr = "It belongs to " .. ownerName .. "."
		end
		if pokeHealth <= 0 then
			healthStr = "It is fainted."
		end
		if pokeName ~= nil and pokeLevel ~= nil and healthStr ~= nil then			
			description = string.format("%s\nIt contains a %s. Level: %s. Boost: +%s. %s", description, pokeName, pokeLevel, pokeBoost, healthStr)
		end
	end
	if thing:isPlayer() and thing ~= self then
		if thing:getAccountType() == ACCOUNT_TYPE_TUTOR then
			if thing:getSex() == PLAYERSEX_MALE then
				description = string.format("%s He is a Tutor.", description)
			else
				description = string.format("%s She is a Tutor.", description)
			end
		end
	end
	if thing:isPlayer() and thing == self then
		if thing:getAccountType() == ACCOUNT_TYPE_TUTOR then
			description = string.format("%s You are a Tutor.", description)
		end
	end
	if self:getGroup():getAccess() then
		if thing:isItem() then
			description  = string.format("%s\nItem ID: %d", description, thing:getId())
			
			local itemType = thing:getType()
			local clientId = itemType:getClientId()
            if clientId then
                description = string.format("%s\nClient ID: %d", description, clientId)
            end

			local actionId = thing:getActionId()
			if actionId ~= 0 then
				description = string.format("%s, Action ID: %d", description, actionId)
			end

			local uniqueId = thing:getAttribute(ITEM_ATTRIBUTE_UNIQUEID)
			if uniqueId > 0 and uniqueId < 65536 then
				description = string.format("%s, Unique ID: %d", description, uniqueId)
			end

			local itemType = thing:getType()
			local transformEquipId = itemType:getTransformEquipId()
			local transformDeEquipId = itemType:getTransformDeEquipId()
			if transformEquipId ~= 0 then
				description = string.format("%s\nTransforms to: %d (onEquip)", description, transformEquipId)
			elseif transformDeEquipId ~= 0 then
				description = string.format("%s\nTransforms to: %d (onDeEquip)", description, transformDeEquipId)
			end

			local decayId = itemType:getDecayId()
			if decayId ~= -1 then
				description = string.format("%s\nDecays to: %d", description, decayId)
			end
		elseif thing:isCreature() then
			local str = "%s\nHealth: %d / %d"
			if thing:getMaxMana() > 0 then
				str = string.format("%s, Mana: %d / %d", str, thing:getMana(), thing:getMaxMana())
			end
			description = string.format(str, description, thing:getHealth(), thing:getMaxHealth()) .. "."
		end

		if thing:isCreature() then
			if thing:isPlayer() then
				description = string.format("%s\nIP: %s.", description, Game.convertIpToString(thing:getIp()))
			end
		end
	end
			
		local houseId = getTileHouseInfo(position)
		if houseId and ItemType(thing.itemid):getName():find("door") then
			local house = House(houseId)
			if house then
				local house_owner
				local house_owner_guid = house:getOwnerGuid()
		
				if house_owner_guid ~= 0 then
					local query = string.format("SELECT `name` FROM `players` WHERE `id` = %d", house_owner_guid)
					local resultId = db.storeQuery(query)
					if resultId then
						house_owner = result.getDataString(resultId, "name")
						result.free(resultId)
					else
						house_owner = "Nobody"
					end
				else
					house_owner = "Nobody"
				end
		
				local house_name = house:getName()
				local house_town = getTownName(house:getTown():getId())
				local house_size = house:getTileCount()
				local house_price = house:getRent()
			
				local house_information = string.format("house_data|%s|%s|%s|%u|%u", house_name, house_owner, house_town, house_size, house_price)
				--print("Sending ExtendedOpcode: " .. house_information)
				return self:sendExtendedOpcode(199, house_information) and false
			end
		end
	
		if thing and thing:isItem() then
			local itemType = thing:getType()
			local clientId = itemType:getClientId()
			local itemName = itemType:getName()
			
			if not itemType:isCorpse() then
				if thing:isPokeball() then
					local pokemonInfo = getPokemonInfoFromPokeball(thing)
					if pokemonInfo then
						local infoMessage = string.format("pokemon_info|%s|%u|%u|%u", tostring(pokemonInfo.name), tonumber(pokemonInfo.level), tonumber(pokemonInfo.boost or 0), tonumber(pokemonInfo.outfitId))
						--print("Pokemon Info: ", pokemonInfo.name, pokemonInfo.level, pokemonInfo.boost, pokemonInfo.outfitId)
						return self:sendExtendedOpcode(200, infoMessage) and false
					end
				elseif itemType:isMovable() then
					local itemData = {
						item_info = clientId,
						item_name = itemName,
					}
				
					-- Check if the item is a container
					if thing:isContainer() then
						local contents = {}  -- Store content data here
						for k = 0, thing:getSize() - 1 do
							local item = thing:getItem(k)
							if item then
								local itemType = item:getType()
								table.insert(contents, {id = itemType:getClientId(), name = itemType:getName()})
							end
						end
						itemData.contents = contents  -- Add contents to the item data
					end
				
					local itemMessage = json.encode(itemData)
					--print("Item Info: ", clientId)
					--print("Item Name: ", itemName)
					return self:sendExtendedOpcode(201, itemMessage) and false
				end
			end
		end
		
	if self:getAccountType() >= ACCOUNT_TYPE_TUTOR then
		local position = thing:getPosition()
		description = string.format(
			"%s\nPosition: %d, %d, %d",
			description, position.x, position.y, position.z
		)
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function onExtendedOpcode(player, opcode, buffer)
    if opcode == 201 then
        local json_status, json_data =
            pcall(
            function()
                return json.decode(buffer)
            end
        )

        if not json_status then
            g_logger.error("[My Module] JSON error: " .. json_data)
            return
        end

        local clientId = json_data.item_info
		local itemName = json_data.item_name
       -- print("Item Info (received): ", clientId, itemName, itemCount)
    end
end

-- open it, np
function getPokemonInfoFromPokeball(pokeball)
  local pokemonName = pokeball:getSpecialAttribute("pokeName")
  local pokemonLevel = pokeball:getSpecialAttribute("pokeLevel")
  local pokemonBoost = pokeball:getSpecialAttribute("pokeBoost") or 0
  local pokemonOutfitId = pokemonOutfitIds[pokemonName]

  if pokemonName and pokemonLevel and pokemonBoost and pokemonOutfitId then
    return {
      name = pokemonName,
      level = pokemonLevel,
      boost = pokemonBoost,
      outfitId = pokemonOutfitId
    }
  end

  return nil
end








function Player:onLookInBattleList(creature, distance)
	local description = "You see " .. creature:getDescription(distance)
	if isSummon(creature) then
		local master = creature:getMaster()
--		local item = master:getSlotItem(CONST_SLOT_AMMO)
--		local pokeName = item:getSpecialAttribute("pokeName")
--		local pokeLevel = item:getSpecialAttribute("pokeLevel")
		local pokeName = master:getName()
		local pokeLevel = creature:getLevel()
		if pokeName ~= nil and pokeLevel ~= nil then			
			description = string.format("%s\nIt belongs to %s. Level: %s.", description, master:getName(), pokeLevel)
		end
	end
	if self:getGroup():getAccess() then
		local str = "%s\nHealth: %d / %d"
		if creature:getMaxMana() > 0 then
			str = string.format("%s, Mana: %d / %d", str, creature:getMana(), creature:getMaxMana())
		end
		description = string.format(str, description, creature:getHealth(), creature:getMaxHealth()) .. "."

		local position = creature:getPosition()
		description = string.format(
			"%s\nPosition: %d, %d, %d",
			description, position.x, position.y, position.z
		)

		if creature:isPlayer() then
			description = string.format("%s\nIP: %s", description, Game.convertIpToString(creature:getIp()))
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInTrade(partner, item, distance)
	local description = "You see " .. item:getDescription(distance)
	if item:isPokeball() then
		local pokeName = item:getSpecialAttribute("pokeName")
		local pokeLevel = item:getSpecialAttribute("pokeLevel")
		local pokeBoost = item:getSpecialAttribute("pokeBoost") or 0
		--local pokeLove = item:getSpecialAttribute("pokeLove") or 0
		local pokeHealth = tonumber(item:getSpecialAttribute("pokeHealth"))
		local healthStr = ""
		if pokeHealth <= 0 then
			healthStr = "It is fainted."
		end
		if pokeName ~= nil and pokeLevel ~= nil and healthStr ~= nil then			
			description = string.format("%s\nIt contains a %s. Level: %s. Boost: +%s. %s", description, pokeName, pokeLevel, pokeBoost, healthStr)
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInShop(itemType, count)
	return true
end

function Player:onMoveItem(item, count, fromPosition, toPosition, fromCylinder, toCylinder)
	if item:getId() == 2270 or item:getId() == 2263 or item:getId() == 8922 then self:sendCancelMessage("Sorry, not possible.") return false end
	if item:getId() == 27634 and toPosition.x ~= 65535 and self:getStorageValue(storageBike) > 0 then self:sendCancelMessage("Sorry, not possible.") return false end
	if item:getId() == 26749 then
		print("WARNING! Player " .. self:getName() .. " moving ancient stone!")
	end
	if fromPosition.x == 65535 and fromPosition.y == 10 or (toPosition.x == 65535 and toPosition.y == 10) and item:isPokeball() then 
		if self:getStorageValue(storageFly) == 1 then
			self:sendCancelMessage("Sorry, not possible while on fly.")
			return false
		end
		if self:getStorageValue(storageSurf) > 0 then
			self:sendCancelMessage("Sorry, not possible while on surf.")
			return false
		end
		if self:getStorageValue(storageRide) > 0 then
			self:sendCancelMessage("Sorry, not possible while on ride.")
			return false
		end
		local summon = self:getSummon()
		if summon and summon:isEvolving() then
			self:sendCancelMessage("Sorry, not possible. Your summon is evolving.")
			return false
		end
	end
	if fromPosition.x == 65535 and fromPosition.y == 10 and item:isPokeball() then
		local pokeName = item:getSpecialAttribute("pokeName")
		local monsterType = MonsterType(pokeName)
		local portraitId = monsterType:portraitId()
		if portraitId == 0 then return true end
		local putPortrait = self:removeItem(portraitId)
		if not putPortrait then
			print("WARNING! Problem on remove portrait player events " .. pokeName .. " player " .. self:getName())
		end	
	end

	if self:isDuelingWithNpc() and item:isPokeball() and toPosition.x == 65535 and fromPosition.x ~= 65535 then
		self:sendCancelMessage("Sorry, not possible while in duel.")
		return false
	end

--	if toPosition.x ~= 65535 or (toPosition.x == 65535 and toPosition.y ~= 64 and toPosition.y ~= 3 and toPosition.y ~= 10) then
		if item:isPokeball() then
			local isBallBeingUsed = item:getSpecialAttribute("isBeingUsed")
			if isBallBeingUsed and isBallBeingUsed == 1 then
				self:sendCancelMessage("Sorry, not possible while using Pokemon.")
				return false
			end
		elseif item:isContainer() then
			local balls = item:getPokeballs()
			for i = 1, #balls do
				local isBallBeingUsed = balls[i]:getSpecialAttribute("isBeingUsed")
				if isBallBeingUsed and isBallBeingUsed == 1 then
					self:sendCancelMessage("Sorry, not possible while using Pokemon.")
					return false
				end
			end
		end
--	end

	return true
end

function Player:onItemMoved(item, count, fromPosition, toPosition, fromCylinder, toCylinder)
	if item:isPokeball() or item:isContainer() then
		self:refreshPokemonBar({}, {})
	end
end

function Player:onMoveCreature(creature, fromPosition, toPosition)
	return true
end

function Player:onTurn(direction)
	if hasSummons(self) then
		local summon = self:getSummons()[1]
		local summonDirection = summon:getDirection()
		if summonDirection == direction then return true end
--		local msg = summon:getName() .. "! Turn to "
--		if direction == 0 then msg = msg .. "north." end
--		if direction == 1 then msg = msg .. "east." end
--		if direction == 2 then msg = msg .. "south." end
--		if direction == 3 then msg = msg .. "west." end
		summon:setDirection(direction)
		summon:setIdle(6000)
--		self:say(msg, TALKTYPE_SAY)
	end
	return true
end

function Player:onTradeRequest(target, item)
	if self:isDuelingWithNpc() and item:isPokeball() then
		self:sendCancelMessage("Sorry, not possible while in duel.")
		return false
	end
	if item:isPokeball() then
		if item:isBeingUsed() then
			self:sendCancelMessage("Sorry, not possible while using pokeball.")
			return false
		end
	end
	if item:isContainer() then
		local pokeballs = item:getPokeballs()
		for i = 1, #pokeballs do
			if pokeballs[i]:isBeingUsed() then
				self:sendCancelMessage("Sorry, not possible while using pokeball.")
				return false
			end
		end
	end
	return true
end

function Player:onTradeAccept(target, item, targetItem)
	self:refreshPokemonBar({}, {})
	target:refreshPokemonBar({}, {})
	return true
end

local soulCondition = Condition(CONDITION_SOUL, CONDITIONID_DEFAULT)
soulCondition:setTicks(4 * 60 * 1000)
soulCondition:setParameter(CONDITION_PARAM_SOULGAIN, 1)

local function useStamina(player)
	local staminaMinutes = player:getStamina()
	if staminaMinutes == 0 then
		return
	end

	local playerId = player:getId()
	local currentTime = os.time()
	if nextUseStaminaTime[playerId] == nil then
		return
	end
	local timePassed = currentTime - nextUseStaminaTime[playerId]
	if timePassed <= 0 then
		return
	end

	if timePassed > 60 then
		if staminaMinutes > 2 then
			staminaMinutes = staminaMinutes - 2
		else
			staminaMinutes = 0
		end
		nextUseStaminaTime[playerId] = currentTime + 120
	else
		staminaMinutes = staminaMinutes - 1
		nextUseStaminaTime[playerId] = currentTime + 60
	end
	player:setStamina(staminaMinutes)
end

function Player:onGainExperience(source, exp, rawExp)
	local multiplier = 3 -- how many times more exp than players a monster will get

	if not source then
		return exp
	end

	-- Soul regeneration
	local vocation = self:getVocation()
	if self:getSoul() < vocation:getMaxSoul() and exp >= self:getLevel() then
		soulCondition:setParameter(CONDITION_PARAM_SOULTICKS, vocation:getSoulGainTicks() * 1000)
		self:addCondition(soulCondition)
	end

	-- Apply experience stage multiplier
	exp = exp * Game.getExperienceStage(self:getLevel())

	-- Stamina modifier
	if configManager.getBoolean(configKeys.STAMINA_SYSTEM) then
		useStamina(self)

		local staminaMinutes = self:getStamina()
		if staminaMinutes > 2400 and self:isPremium() then
			exp = exp * 1.5
		elseif staminaMinutes <= 840 then
			exp = exp * 0.5
		end
	end

	-- Update questlog
	if exp + self:getExperience() >= getNeededExp(self:getLevel() + 1) then
		self:updateQuestLog()
	end

	-- Vocation buff
	if vocation:getName() == "Explorer" then
		exp = exp * explorerExperienceBuff
	end

	if hasSummons(self) then
		local creature = self:getSummon()
--		local item = self:getSlotItem(CONST_SLOT_AMMO)
		local item = self:getUsingBall()
		if item and item:isPokeball() then
			local level = item:getSpecialAttribute("pokeLevel") or 1
			if level >= summonMaxLevel then
				return exp
			end
			local givenExp = exp * multiplier
			if vocation:getName() == "Explorer" then
				givenExp = math.floor(givenExp / explorerExperienceBuff)
			end
			local summonPos = creature:getPosition()
			local pokeExp = item:getSpecialAttribute("pokeExperience") or 0
			local nextLevel = level + 1
			local newExp = pokeExp + givenExp
			item:setSpecialAttribute("pokeExperience", newExp)
			if givenExp > 0 then 
				summonPos:sendAnimatedNumber(MESSAGE_EXPERIENCE_OTHERS, "Your summon gained " .. givenExp .. " experience points.", givenExp, TEXTCOLOR_WHITE_EXP)
			end
			if newExp > getNeededExp(nextLevel)  then				
				item:setSpecialAttribute("pokeLevel", nextLevel)
				--local love = item:getSpecialAttribute("pokeLove") or 0
				local newMaxHealth = creature:getTotalHealth()
				creature:setMaxHealth(newMaxHealth)
				creature:changeSpeed(-creature:getSpeed() + creature:getTotalSpeed())			
				creature:setHealth(newMaxHealth)
				summonPos:sendMagicEffect(CONST_ME_HEARTS)
				
				--if MonsterType(source:getName()):isLegendary() then 
				--	love = love + 3
				--elseif level < source:getLevel() then
				--	love = love + 2					
				--else
				--	love = love + 1
				--end

				--item:setSpecialAttribute("pokeLove", love)
				doRemoveSummon(self:getId(), false, nil, false)
				item:setSpecialAttribute("isBeingUsed", 1)
				local cid = doReleaseSummon(self:getId(), summonPos, false, false)

				if not cid then
					print("WARNING! Creature " .. creature:getName() .. ", level " .. nextLevel .. " from player " .. self:getName() .. " with problems on change level.")
				end

				local summonName = creature:getName()
				local monsterType = MonsterType(summonName)
				local statusGain = statusGainFormula(0, nextLevel, 0, 0) - statusGainFormula(0, level, 0, 0)
				self:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Congratulations! Your pokemon evolved to level " .. nextLevel .. ".\nStatus bonus:\nHealth: " .. monsterType:getMaxHealth() * statusGain .. "\nAttack: " .. monsterType:getMeleeDamage() * statusGain .. "\nMagic Attack: " .. monsterType:getMoveMagicAttackBase() * statusGain .. "\nMagic Defense: " .. monsterType:getMoveMagicDefenseBase() * statusGain .. "\nDefense: " .. monsterType:getDefense() * statusGain .. "\nSpeed: " .. monsterType:getBaseSpeed() * statusGain)
				--self:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your pokemon gained " .. love .. " love points.")

				local dittoTime = item:getSpecialAttribute("dittoTime")
				if not dittoTime then
					local evolutionList = monsterType:getEvolutionList()				
					if #evolutionList >= 1 and not creature:isEvolving() then				
						for i = 1, #evolutionList do					
							local evolution = evolutionList[i]
							local evolutionName = evolution.name
							if evolutionName ~= "" then
								local evolutionLevel = evolution.level
								if nextLevel >= evolution.level and math.random(1, 100) <= evolution.chance then
									doEvolveSummon(cid, evolutionName)
								end
							end
						end
					end
				end
			else
				self:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your summon gained " .. givenExp .. " experience points. Needs " .. getNeededExp(nextLevel) - newExp .. " to level " .. nextLevel .. ".")
			end
		end
	end
	return exp
end

function Player:onLoseExperience(exp)
	return exp
end

function Player:onGainSkillTries(skill, tries)
	if APPLY_SKILL_MULTIPLIER == false then
		return tries
	end

	if skill == SKILL_MAGLEVEL then
		return tries * configManager.getNumber(configKeys.RATE_MAGIC)
	end
	return tries * configManager.getNumber(configKeys.RATE_SKILL)
end

