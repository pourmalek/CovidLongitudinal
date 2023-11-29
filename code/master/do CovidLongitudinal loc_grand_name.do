
clear all

cd "$pathCovidLongitudinal"

cd master

capture log close 

log using "log CovidLongitudinal loc_grand_name.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal loc_grand_name.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek 
***************************************************************************


* create location grand name and id // loc_grand_name and loc_grand_id
	
* input file(s): loc_grand_name.xlsx
* output file(s): loc_grand_name.dta

* output data dictionary file(s): "loc_grand_name data dictionary.csv"





import excel using "loc_grand_name.xlsx", clear firstrow


label define country ///
1 "Afghanistan" ///
2 "Albania" ///
3 "Algeria" ///
4 "Andorra" ///
5 "Angola" ///
6 "Antigua and Barbuda" ///
7 "Argentina" ///
8 "Armenia" ///
9 "Australia" ///
10 "Austria" ///
11 "Azerbaijan" ///
12 "Bahamas" ///
13 "Bahrain" ///
14 "Bangladesh" ///
15 "Barbados" ///
16 "Belarus" ///
17 "Belgium" ///
18 "Belize" ///
19 "Benin" ///
20 "Bhutan" ///
21 "Bolivia" ///
22 "Bosnia and Herzegovina" ///
23 "Botswana" ///
24 "Brazil" ///
25 "Brunei" ///
26 "Bulgaria" ///
27 "Burkina Faso" ///
28 "Burundi" ///
29 "Cambodia" ///
30 "Cameroon" ///
31 "Canada" ///
32 "Cape Verde" ///
33 "Central African Republic" ///
34 "Chad" ///
35 "Chile" ///
36 "China" ///
37 "Colombia" ///
38 "Comoros" ///
39 "Congo" ///
40 "Congo DR" ///
41 "Costa Rica" ///
42 "Cote d'Ivoire" ///
43 "Croatia" ///
44 "Cuba" ///
45 "Cyprus" ///
46 "Czechia" ///
47 "Denmark" ///
48 "Djibouti" ///
49 "Dominican Republic" ///
50 "Ecuador" ///
51 "Egypt" ///
52 "El Salvador" ///
53 "Equatorial Guinea" ///
54 "Eritrea" ///
55 "Estonia" ///
56 "Eswatini" ///
57 "Ethiopia" ///
58 "Fiji" ///
59 "Finland" ///
60 "France" ///
61 "Gabon" ///
62 "Gambia" ///
63 "Georgia" ///
64 "Germany" ///
65 "Ghana" ///
66 "Greece" ///
67 "Grenada" ///
68 "Guatemala" ///
69 "Guinea" ///
70 "Guinea Bissau" ///
71 "Guyana" ///
72 "Haiti" ///
73 "Honduras" ///
74 "Hungary" ///
75 "Iceland" ///
76 "India" ///
77 "Indonesia" ///
78 "Iran" ///
79 "Iraq" ///
80 "Ireland" ///
81 "Israel" ///
82 "Italy" ///
83 "Jamaica" ///
84 "Japan" ///
85 "Jordan" ///
86 "Kazakhstan" ///
87 "Kenya" ///
88 "Kiribati" ///
89 "Korea North" ///
90 "Korea South" ///
91 "Kosovo" ///
92 "Kuwait" ///
93 "Kyrgyzstan" ///
94 "Laos" ///
95 "Latvia" ///
96 "Lebanon" ///
97 "Lesotho" ///
98 "Liberia" ///
99 "Libya" ///
100 "Liechtenstein" ///
101 "Lithuania" ///
102 "Luxembourg" ///
103 "Madagascar" ///
104 "Malawi" ///
105 "Malaysia" ///
106 "Maldives" ///
107 "Mali" ///
108 "Malta" ///
109 "Mauritania" ///
110 "Mauritius" ///
111 "Mexico" ///
112 "Micronesia" ///
113 "Moldova" ///
114 "Monaco" ///
115 "Mongolia" ///
116 "Montenegro" ///
117 "Morocco" ///
118 "Mozambique" ///
119 "Myanmar" ///
120 "Namibia" ///
121 "Nepal" ///
122 "Netherlands" ///
123 "New Zealand" ///
124 "Nicaragua" ///
125 "Niger" ///
126 "Nigeria" ///
127 "North Macedonia" ///
128 "Norway" ///
129 "Oman" ///
130 "Pakistan" ///
131 "Palestine" ///
132 "Panama" ///
133 "Papua New Guinea" ///
134 "Paraguay" ///
135 "Peru" ///
136 "Philippines" ///
137 "Poland" ///
138 "Portugal" ///
139 "Qatar" ///
140 "Romania" ///
141 "Russia" ///
142 "Rwanda" ///
143 "Saint Lucia" ///
144 "Saint Vincent and the Grenadines" ///
145 "Samoa" ///
146 "San Marino" ///
147 "Sao Tome and Principe" ///
148 "Saudi Arabia" ///
149 "Senegal" ///
150 "Serbia" ///
151 "Seychelles" ///
152 "Sierra Leone" ///
153 "Singapore" ///
154 "Slovakia" ///
155 "Slovenia" ///
156 "Solomon Islands" ///
157 "Somalia" ///
158 "South Africa" ///
159 "South Sudan" ///
160 "Spain" ///
161 "Sri Lanka" ///
162 "Sudan" ///
163 "Suriname" ///
164 "Sweden" ///
165 "Switzerland" ///
166 "Syria" ///
167 "Tajikistan" ///
168 "Taiwan" ///
169 "Tanzania" ///
170 "Thailand" ///
171 "Timor Leste" ///
172 "Togo" ///
173 "Tonga" ///
174 "Trinidad and Tobago" ///
175 "Tunisia" ///
176 "Turkey" ///
177 "Uganda" ///
178 "Ukraine" ///
179 "United Arab Emirates" ///
180 "United Kingdom" ///
181 "United States of America" ///
182 "Uruguay" ///
183 "Uzbekistan" ///
184 "Vanuatu" ///
185 "Venezuela" ///
186 "Viet Nam" ///
187 "Yemen" ///
188 "Zambia" ///
189 "Zimbabwe"


gen loc_grand_name_numlabel = loc_grand_id

label values loc_grand_name_numlabel country

tab loc_grand_id



* gen loc_grand_name_snail and replace all spaces with indeline

gen loc_grand_name_snail = loc_grand_name

replace loc_grand_name_snail = subinstr(loc_grand_name_snail, " ", "_", .)




label var loc_grand_order "country order"

label var loc_grand_name "country name"

label var loc_grand_id "country id number"

label var loc_grand_iso "country iso3 code"

label var loc_grand_name_numlabel "country name number label"

label var loc_grand_name_snail "country name snail"


label var DELP "country names used in DELP COVID-19 epidemic model"
label var IHME "country names used in IHME COVID-19 epidemic model"
label var IMPE "country names used in IMPE COVID-19 epidemic model"
label var LANL "country names used in LANL COVID-19 epidemic model"
label var UCLA "country names used in UCLA COVID-19 epidemic model"
label var YYGU "country names used in YYGU COVID-19 epidemic model"
label var JOHN "country names used in JOHNs Hopkins COVID-19 epidemic data"


label var UNFPA2020 "country names used in UNFPA 2020 population estimates"
label var population2020 "UNFPA 2020 population estimates"
label var UNFPA2021 "country names used in UNFPA 2021 population estimates"
label var population2021 "UNFPA 2021 population estimates"
label var UNFPA2022 "country names used in UNFPA 2022 population estimates"
label var population2022 "UNFPA 2022 population estimates"
label var region "WHO region"




******

* make lists for transforming country names to loc_grand_name

local list DELP IHME IMPE LANL UCLA YYGU JOHN

foreach model of local list {

list loc_grand_name `model' if loc_grand_name != `model' & `model' != "", noo clean

}
*


codebook loc_grand_name if loc_grand_id != .

tab mapping if loc_grand_id == .

list loc_grand_name mapping if loc_grand_id == .


codebook DELP IHME IMPE LANL UCLA YYGU JOHN


label var modelmix "Presence 1 or absence 0 of country in models DELP IHME IMPE LANL UCLA YYGU" 

tab modelmix, sort


label var modelsnumber "Number of models country present in"

tab modelsnumber


label var mapping "mapping plan"

tab mapping


label var mappingcolor "mapping color code"

tab mappingcolor


label var mappingcolormeaning "mapping plan meaning"

tab mappingcolormeaning

drop X Y



qui compress

save "loc_grand_name.dta", replace


******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "loc_grand_name data dictionary.csv", replace 
	
restore




view "log CovidLongitudinal loc_grand_name.smcl"

exit, clear
