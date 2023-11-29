
clear all

cd "$pathCovidLongitudinal/countries/"

***************************************************************************
* This is "do CovidLongitudinal countries 4.do"

* Project: Longitudinal assessment of COVID-19 models - batch 4

* Objective: Process estimates for countries  
                                                              
***************************************************************************



**** "do CovidLongitudinal countries 4.do"
**** Process estimates for countries - by running the do file of reach country - do CovidLongitudinal `country'.do


** input data files: estimates files by models and JOHN

** main output data files: main file = "ALL MODELS `country' error - only error measures across models.dta"







************************************************************************

* get error for each country - batch 4


local list `" "Nepal" "Netherlands" "New Zealand" "Nicaragua" "Niger" "Nigeria" "North Macedonia" "Norway" "Oman" "Pakistan" "Palestine" "Panama" "Papua New Guinea" "Paraguay" "Peru" "Philippines" "Poland" "Portugal" "Qatar" "Romania" "Russia" "Rwanda" "Saint Lucia" "Saint Vincent and the Grenadines" "Samoa" "San Marino" "Sao Tome and Principe" "Saudi Arabia" "Senegal" "Serbia" "Seychelles" "Sierra Leone" "Singapore" "Slovakia" "Slovenia" "Solomon Islands" "Somalia" "South Africa" "South Sudan" "Spain" "'

foreach country of local list {
	
	di "`country'"
	
	cd "$pathCovidLongitudinal/countries/`country'"
		
	do "do CovidLongitudinal `country'.do"
	
	window manage close viewer _all
	
}
*



cd "$pathCovidLongitudinal/countries/"


