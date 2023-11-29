
clear all

cd "$pathCovidLongitudinal/countries/"

***************************************************************************
* This is "do CovidLongitudinal countries 3.do"

* Project: Longitudinal assessment of COVID-19 models - batch 3

* Objective: Process estimates for countries  
                                                              
***************************************************************************



**** "do CovidLongitudinal countries 3.do"
**** Process estimates for countries - by running the do file of reach country - do CovidLongitudinal `country'.do


** input data files: estimates files by models and JOHN

** main output data files: main file = "ALL MODELS `country' error - only error measures across models.dta"







************************************************************************

* get error for each country - batch 3


local list `" "Israel" "Italy" "Jamaica" "Japan" "Jordan" "Kazakhstan" "Kenya" "Kiribati" "Korea North" "Korea South" "Kosovo" "Kuwait" "Kyrgyzstan" "Laos" "Latvia" "Lebanon" "Lesotho" "Liberia" "Libya" "Liechtenstein" "Lithuania" "Luxembourg" "Madagascar" "Malawi" "Malaysia" "Maldives" "Mali" "Malta" "Mauritania" "Mauritius" "Mexico" "Micronesia" "Moldova" "Monaco" "Mongolia" "Montenegro" "Morocco" "Mozambique" "Myanmar" "Namibia" "'

foreach country of local list {
	
	di "`country'"
	
	cd "$pathCovidLongitudinal/countries/`country'"
		
	do "do CovidLongitudinal `country'.do"
	
	window manage close viewer _all
	
}
*



cd "$pathCovidLongitudinal/countries/"


