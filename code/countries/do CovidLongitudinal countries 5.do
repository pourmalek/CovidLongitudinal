
clear all

cd "$pathCovidLongitudinal/countries/"

***************************************************************************
* This is "do CovidLongitudinal countries 5.do"

* Project: Longitudinal assessment of COVID-19 models - batch 5

* Objective: Process estimates for countries  
                                                              
***************************************************************************



**** "do CovidLongitudinal countries 5.do"
**** Process estimates for countries - by running the do file of reach country - do CovidLongitudinal `country'.do


** input data files: estimates files by models and JOHN

** main output data files: main file = "ALL MODELS `country' error - only error measures across models.dta"







************************************************************************

* get error for each country - batch 5


local list `" "Sri Lanka" "Sudan" "Suriname" "Sweden" "Switzerland" "Syria" "Taiwan" "Tajikistan" "Tanzania" "Thailand" "Timor Leste" "Togo" "Tonga" "Trinidad and Tobago" "Tunisia" "Turkey" "Uganda" "Ukraine" "United Arab Emirates" "United Kingdom" "United States of America" "Uruguay" "Uzbekistan" "Vanuatu" "Venezuela" "Viet Nam" "Yemen" "Zambia" "Zimbabwe" "'

foreach country of local list {
	
	di "`country'"
	
	cd "$pathCovidLongitudinal/countries/`country'"
		
	do "do CovidLongitudinal `country'.do"
	
	window manage close viewer _all
	
}
*



cd "$pathCovidLongitudinal/countries/"


