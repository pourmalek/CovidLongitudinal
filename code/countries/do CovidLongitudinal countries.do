
clear all

cd "$pathCovidLongitudinal/countries/"

***************************************************************************
* This is "do CovidLongitudinal countries.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process estimates for countries  
                                                              
***************************************************************************



**** "do CovidLongitudinal countries.do"
**** Process estimates for countries - by running the do file of reach country - do CovidLongitudinal `country'.do


** input data files: estimates files by models and JOHN

** main output data files: main file = "ALL MODELS `country' error - only error measures across models.dta"


* run "do CovidLongitudinal countries n.do", where n = 1 to 5, to run the code in batches of 40 countries, for firefighting purposes. 

* ist of all 189 countries include in this study is aved in "1 list of 189 countries.txt" and "1 list of 189 countries.xlsx" in this same directory root.


************************************************************************

do "do CovidLongitudinal countries 1.do"

// exit , clear STATA

do "do CovidLongitudinal countries 2.do"

do "do CovidLongitudinal countries 3.do"

do "do CovidLongitudinal countries 4.do"

do "do CovidLongitudinal countries 5.do"




cd "$pathCovidLongitudinal/countries/"


