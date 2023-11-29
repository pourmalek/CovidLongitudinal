
clear all

cd "$pathCovidLongitudinal/countries/"

***************************************************************************
* This is "do CovidLongitudinal countries 2.do"

* Project: Longitudinal assessment of COVID-19 models - batch 2

* Objective: Process estimates for countries  
                                                              
***************************************************************************



**** "do CovidLongitudinal countries 2.do"
**** Process estimates for countries - by running the do file of reach country - do CovidLongitudinal `country'.do


** input data files: estimates files by models and JOHN

** main output data files: main file = "ALL MODELS `country' error - only error measures across models.dta"







************************************************************************

* get error for each country - batch 2


local list `" "Costa Rica" "Cote d'Ivoire" "Croatia" "Cuba" "Cyprus" "Czechia" "Denmark" "Djibouti" "Dominican Republic" "Ecuador" "Egypt" "El Salvador" "Equatorial Guinea" "Eritrea" "Estonia" "Eswatini" "Ethiopia" "Fiji" "Finland" "France" "Gabon" "Gambia" "Georgia" "Germany" "Ghana" "Greece" "Grenada" "Guatemala" "Guinea" "Guinea Bissau" "Guyana" "Haiti" "Honduras" "Hungary" "Iceland" "India" "Indonesia" "Iran" "Iraq" "Ireland" "'

foreach country of local list {
	
	di "`country'"
	
	cd "$pathCovidLongitudinal/countries/`country'"
		
	do "do CovidLongitudinal `country'.do"
	
	window manage close viewer _all
	
}
*



cd "$pathCovidLongitudinal/countries/"


