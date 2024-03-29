
clear all

cd "$pathCovidLongitudinal/countries/Switzerland"




***************************************************************************
* This is "do CovidLongitudinal Switzerland.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Switzerland <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Switzerland.do" files


do "do CovidLongitudinal Switzerland 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)


do "do CovidLongitudinal Switzerland 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


do "do CovidLongitudinal Switzerland 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal Switzerland 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Switzerland 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


/* Switzerland not included in UCLA
do "do CovidLongitudinal Switzerland 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


do "do CovidLongitudinal Switzerland 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **


do "do CovidLongitudinal Switzerland 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



