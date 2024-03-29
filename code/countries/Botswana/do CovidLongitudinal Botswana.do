
clear all

cd "$pathCovidLongitudinal/countries/Botswana"




***************************************************************************
* This is "do CovidLongitudinal Botswana.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Botswana <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Botswana.do" files


do "do CovidLongitudinal Botswana 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)


do "do CovidLongitudinal Botswana 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


do "do CovidLongitudinal Botswana 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal Botswana 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Botswana 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


/* Botswana not included in UCLA
do "do CovidLongitudinal Botswana 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Botswana not included in YYGU
do "do CovidLongitudinal Botswana 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Botswana 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



