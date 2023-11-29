
clear all

cd "$pathCovidLongitudinal/countries/North Macedonia"




***************************************************************************
* This is "do CovidLongitudinal North Macedonia.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> North Macedonia <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal North Macedonia.do" files


do "do CovidLongitudinal North Macedonia 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)


do "do CovidLongitudinal North Macedonia 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


do "do CovidLongitudinal North Macedonia 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal North Macedonia 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal North Macedonia 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


/* North Macedonia not included in UCLA
do "do CovidLongitudinal North Macedonia 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* North Macedonia not included in YYGU
do "do CovidLongitudinal North Macedonia 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal North Macedonia 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



