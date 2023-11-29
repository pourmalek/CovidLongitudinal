
clear all

cd "$pathCovidLongitudinal/countries/Cyprus"




***************************************************************************
* This is "do CovidLongitudinal Cyprus.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Cyprus <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Cyprus.do" files


do "do CovidLongitudinal Cyprus 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)


do "do CovidLongitudinal Cyprus 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


do "do CovidLongitudinal Cyprus 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal Cyprus 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Cyprus 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


/* Cyprus not included in UCLA
do "do CovidLongitudinal Cyprus 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


do "do CovidLongitudinal Cyprus 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **


do "do CovidLongitudinal Cyprus 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



