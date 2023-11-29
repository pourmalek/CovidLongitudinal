
clear all

cd "$pathCovidLongitudinal/countries/Laos"




***************************************************************************
* This is "do CovidLongitudinal Laos.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Laos <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Laos.do" files


do "do CovidLongitudinal Laos 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)


/* Laos not included in DELP
do "do CovidLongitudinal Laos 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Laos not included in IHME
do "do CovidLongitudinal Laos 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Laos 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


/* Laos not included in LANL
do "do CovidLongitudinal Laos 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


/* Laos not included in UCLA
do "do CovidLongitudinal Laos 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Laos not included in YYGU
do "do CovidLongitudinal Laos 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Laos 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



