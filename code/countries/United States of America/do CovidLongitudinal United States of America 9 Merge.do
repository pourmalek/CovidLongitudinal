
clear all

cd "$pathCovidLongitudinal/countries/United States of America"

capture log close 

log using "log CovidLongitudinal United States of America 9 Merge.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal United States of America 9 Merge.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Merge calculations results for error measures by models
	* for each country ---->> United States of America <<----                                                                 
***************************************************************************


* Merge calculations results for error measures by models, create graphs



** input data files: "`model' United States of America error.dta"

** output data files: "ALL MODELS United States of America error.dta" with all date
*                     "ALL MODELS United States of America error - only models across error measures.dta", replace
*                     "ALL MODELS United States of America error - only error measures across models.dta", replace

* output data dictionary files: "ALL MODELS United States of America error data dictionary.csv"
*                               "ALL MODELS United States of America error - only models across error measures data dictionary.csv"
*                               "ALL MODELS United States of America error - only error measures across models data dictionary.csv"


** Graphs:
* "graph 03 United States of America ALL MODELS C19 daily deaths error.pdf"
* "graph 04 United States of America ALL MODELS C19 daily deaths absolute error.pdf"
* "graph 05 United States of America ALL MODELS C19 daily deaths percent error.pdf"
* "graph 06 United States of America ALL MODELS C19 daily deaths absolute percent error.pdf"

* "graph 07a1 United States of America ALL MODELS C19 daily deaths average median error.pdf"
* "graph 07a2 United States of America ALL MODELS C19 daily deaths average median error smoothed.pdf"
* "graph 08a1 United States of America ALL MODELS C19 daily deaths average median absolute error.pdf"
* "graph 08a2 United States of America ALL MODELS C19 daily deaths average median absolute error smoothed.pdf"
* "graph 09a1 United States of America ALL MODELS C19 daily deaths average median percent error.pdf"
* "graph 09a2 United States of America ALL MODELS C19 daily deaths average median percent error smoothed.pdf"
* "graph 10a1 United States of America ALL MODELS C19 daily deaths average median absolute percent error.pdf"
* "graph 10a2 United States of America ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf"

****** graph each same error measure across models:
* "graph 12a United States of America ALL MODELS C19 daily deaths Average Mean Error.pdf"
* "graph 12b United States of America ALL MODELS C19 daily deaths Average Absolute Error.pdf"
* "graph 12c United States of America ALL MODELS C19 daily deaths Average Percent Error.pdf"
* "graph 12d United States of America ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf"

****** graph all models across error measures:
* "graph 13a United States of America ALL MODELS C19 daily deaths, models across error measures.pdf"

****** graph all error measures across models:
* "graph 13b United States of America ALL MODELS C19 daily deaths, error measures across models.pdf"




grstyle init

grstyle color background white




use "DELP United States of America error.dta", clear 

	merge m:m date using "IHME United States of America error.dta"

	drop _merge
	
	merge m:m date using "IMPE United States of America error.dta"
	
	drop _merge
	
	merge m:m date using "LANL United States of America error.dta"	
	
	drop _merge
	
	merge m:m date using "UCLA United States of America error.dta", force
	
	drop _merge
	
	merge m:m date using "YYGU United States of America error.dta", force	
	
	drop _merge
	

qui compress









******
* graph 03 Daily deaths, Error // <<-- modify 1

twoway ///
(line DDErrorIHME20200325 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20200326 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20200327 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20200329 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20200330 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20200331 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20200401 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200401 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200402 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200403 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200404 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200405 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200405 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200406 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200407 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200407 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200408 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200408 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200409 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200410 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200410 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200411 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200412 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200413 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200413 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200414 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200415 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200416 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20200417 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200417 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200418 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200419 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200420 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200421 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200421 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200422 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200422 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200423 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorYYGU20200424 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200425 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200426 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200426 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200427 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200427 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200428 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200428 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200429 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20200429 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200429 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200430 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorYYGU20200501 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200502 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200503 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200503 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200504 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200504 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200505 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200506 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200506 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200507 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200508 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorYYGU20200509 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200510 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20200510 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200510 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200511 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200512 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200512 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200513 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200513 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200514 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200515 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200516 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20200517 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200517 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200518 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200519 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200520 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20200520 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200520 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200521 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200522 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200523 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20200524 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200524 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200525 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200525 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200526 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200526 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200527 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200527 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200528 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200529 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200529 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200530 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20200531 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200531 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200601 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200602 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200603 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200603 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200604 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200605 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200605 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200606 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20200607 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200607 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200608 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200608 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200609 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200610 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20200610 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200610 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200611 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200612 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200613 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200614 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200615 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200615 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200616 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200617 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200617 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200618 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200619 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200620 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20200621 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200621 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200622 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200623 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200623 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200624 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200625 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200626 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200627 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20200628 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200628 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200629 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200630 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200701 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200701 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200702 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200703 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200704 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200705 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200705 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200706 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200707 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200708 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200708 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200709 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200710 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200711 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200712 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200713 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200714 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200715 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200716 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200717 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200718 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200719 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200720 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200721 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200722 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorYYGU20200723 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200724 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200725 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200726 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200727 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200728 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200729 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200730 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200731 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorYYGU20200801 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200802 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200803 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200804 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200805 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200806 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200807 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200808 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200809 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200810 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200811 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200812 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200813 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200814 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorYYGU20200815 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200816 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200817 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200818 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200819 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200820 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200821 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200822 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200823 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200824 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200825 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200826 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200827 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200828 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorYYGU20200829 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200830 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200831 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200901 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200902 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200903 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200904 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200905 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200906 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200907 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200908 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200909 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200910 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200911 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200912 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200913 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200914 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200915 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200916 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200917 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200918 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200919 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200920 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200921 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200922 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200923 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20200924 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20200925 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorYYGU20200926 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200927 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200928 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20200929 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20200930 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorYYGU20201001 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorYYGU20201002 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorYYGU20201003 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorYYGU20201004 date, sort lwidth(thin) lcolor(gold)) ///
(line DDErrorIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210103 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210110 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorUCLA20210206 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210228 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210307 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210315 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorIHME20210317 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210325 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210328 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210401 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210404 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210409 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210416 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210423 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210506 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210514 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210521 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210528 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210606 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210614 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210621 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210627 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorUCLA20210630 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210706 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210712 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorUCLA20210719 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210726 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210802 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210809 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210816 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210823 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210830 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210906 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210913 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210920 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorUCLA20210927 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorUCLA20211004 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorUCLA20211011 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorUCLA20211018 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorUCLA20211025 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorUCLA20211101 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorUCLA20211108 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorUCLA20211115 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorUCLA20211122 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorUCLA20211129 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorUCLA20211206 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorUCLA20211213 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorUCLA20211220 date, sort lwidth(thin) lcolor(blue)) ///
(line DDErrorIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220114 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("United States of America, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(29 "DELP" 1 "IHME" 105 "IMPE" 43 "LANL" 392 "UCLA" 8 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 03 United States of America ALL MODELS C19 daily deaths error.pdf", replace










******
* graph 04 Daily deaths, AbsErr // <<-- modify 2

twoway ///
(line DDAbsErrIHME20200325 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20200326 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20200327 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20200329 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20200330 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20200331 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20200401 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200401 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200402 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200403 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200404 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200405 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200405 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200406 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200407 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200407 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200408 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200408 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200409 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200410 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200410 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200411 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200412 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200413 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200413 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200414 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200415 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200416 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20200417 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200417 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200418 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200419 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200420 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200421 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200421 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200422 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200422 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200423 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrYYGU20200424 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200425 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200426 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200426 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200427 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200427 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200428 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200428 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200429 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20200429 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200429 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200430 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrYYGU20200501 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200502 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200503 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200503 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200504 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200504 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200505 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200506 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200506 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200507 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200508 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrYYGU20200509 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200510 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20200510 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200510 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200511 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200512 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200512 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200513 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200513 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200514 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200515 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200516 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20200517 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200517 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200518 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200519 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200520 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20200520 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200520 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200521 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200522 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200523 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20200524 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200524 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200525 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200525 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200526 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200526 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200527 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200527 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200528 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200529 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200529 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200530 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20200531 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200531 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200601 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200602 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200603 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200603 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200604 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200605 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200605 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200606 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20200607 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200607 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200608 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200608 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200609 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20200610 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200610 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200611 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200612 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200613 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200614 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200615 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200615 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200616 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200617 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200617 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200618 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200619 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200620 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20200621 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200621 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200622 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200623 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200623 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200624 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200625 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200626 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200627 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20200628 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200628 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200629 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200630 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200701 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200701 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200702 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200703 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200704 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200705 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200705 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200706 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200707 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200708 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200708 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200709 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200710 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200711 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200712 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200713 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200714 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200715 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200716 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200717 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200718 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200719 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200720 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200721 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200722 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrYYGU20200723 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200724 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200725 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200726 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200727 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200728 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200729 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200730 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200731 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrYYGU20200801 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200802 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200803 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200804 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200805 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200806 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200807 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200808 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200809 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200810 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200811 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200812 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200813 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200814 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrYYGU20200815 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200816 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200817 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200818 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200819 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200820 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200821 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200822 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200823 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200824 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200825 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200826 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200827 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200828 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrYYGU20200829 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200830 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200831 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200901 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200902 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200903 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200904 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200905 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200906 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200907 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200908 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200909 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200910 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200911 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200912 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200913 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200914 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200915 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200916 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200917 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200918 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200919 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200920 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200921 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200922 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200923 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20200924 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20200925 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrYYGU20200926 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200927 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200928 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20200929 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20200930 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrYYGU20201001 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrYYGU20201002 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrYYGU20201003 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrYYGU20201004 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbsErrIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210103 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210110 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrUCLA20210206 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210228 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210307 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210315 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrIHME20210317 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210325 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210328 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210401 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210404 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210409 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210416 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210423 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210506 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210514 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210521 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210528 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210606 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210614 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210621 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210627 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrUCLA20210630 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210706 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210712 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrUCLA20210719 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210726 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210802 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210809 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210816 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210823 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210830 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210906 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210913 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210920 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrUCLA20210927 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrUCLA20211004 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrUCLA20211011 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrUCLA20211018 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrUCLA20211025 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrUCLA20211101 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrUCLA20211108 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrUCLA20211115 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrUCLA20211122 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrUCLA20211129 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrUCLA20211206 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrUCLA20211213 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrUCLA20211220 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbsErrIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220114 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("United States of America, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(29 "DELP" 1 "IHME" 105 "IMPE" 43 "LANL" 392 "UCLA" 8 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 04 United States of America ALL MODELS C19 daily deaths absolute error.pdf", replace









******
* graph 05 Daily deaths, Percent Error <<-- modify 3

twoway ///
(line DDPerErrIHME20200325 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20200326 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20200327 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20200329 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20200330 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20200331 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20200401 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200401 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200402 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200403 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200404 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200405 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200405 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200406 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200407 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200407 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200408 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200408 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200409 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200410 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200410 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200411 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200412 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200413 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200413 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200414 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200415 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200416 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20200417 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200417 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200418 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200419 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200420 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200421 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200421 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200422 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200422 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200423 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrYYGU20200424 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200425 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200426 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200426 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200427 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200427 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200428 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200428 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200429 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20200429 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200429 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200430 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrYYGU20200501 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200502 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200503 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200503 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200504 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200504 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200505 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200506 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200506 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200507 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200508 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrYYGU20200509 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200510 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20200510 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200510 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200511 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200512 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200512 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200513 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200513 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200514 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200515 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200516 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20200517 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200517 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200518 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200519 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200520 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20200520 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200520 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200521 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200522 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200523 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20200524 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200524 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200525 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200525 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200526 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200526 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200527 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200527 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200528 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200529 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200529 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200530 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20200531 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200531 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200601 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200602 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200603 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200603 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200604 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200605 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200605 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200606 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20200607 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200607 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200608 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200608 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200609 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200610 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20200610 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200610 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200611 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200612 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200613 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200614 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200615 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200615 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200616 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200617 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200617 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200618 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200619 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200620 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20200621 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200621 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200622 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200623 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200623 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200624 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200625 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200626 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200627 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20200628 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200628 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200629 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200630 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200701 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200701 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200702 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200703 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200704 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200705 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200705 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200706 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200707 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200708 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200708 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200709 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200710 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200711 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200712 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200713 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200714 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200715 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200716 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200717 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200718 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200719 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200720 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200721 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200722 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrYYGU20200723 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200724 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200725 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200726 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200727 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200728 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200729 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200730 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200731 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrYYGU20200801 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200802 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200803 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200804 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200805 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200806 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200807 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200808 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200809 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200810 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200811 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200812 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200813 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200814 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrYYGU20200815 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200816 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200817 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200818 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200819 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200820 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200821 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200822 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200823 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200824 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200825 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200826 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200827 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200828 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrYYGU20200829 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200830 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200831 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200901 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200902 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200903 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200904 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200905 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200906 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200907 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200908 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200909 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200910 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200911 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200912 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200913 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200914 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200915 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200916 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200917 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200918 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200919 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200920 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200921 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200922 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200923 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20200924 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20200925 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrYYGU20200926 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200927 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200928 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20200929 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20200930 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrYYGU20201001 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrYYGU20201002 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrYYGU20201003 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrYYGU20201004 date, sort lwidth(thin) lcolor(gold)) ///
(line DDPerErrIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210103 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210110 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrUCLA20210206 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210228 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210307 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210315 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrIHME20210317 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210325 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210328 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210401 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210404 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210409 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210416 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210423 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210506 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210514 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210521 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210528 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210606 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210614 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210621 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210627 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrUCLA20210630 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210706 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210712 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrUCLA20210719 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210726 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210802 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210809 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210816 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210823 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210830 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210906 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210913 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210920 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrUCLA20210927 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrUCLA20211004 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrUCLA20211011 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrUCLA20211018 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrUCLA20211025 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrUCLA20211101 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrUCLA20211108 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrUCLA20211115 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrUCLA20211122 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrUCLA20211129 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrUCLA20211206 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrUCLA20211213 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrUCLA20211220 date, sort lwidth(thin) lcolor(blue)) ///
(line DDPerErrIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220114 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("United States of America, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(29 "DELP" 1 "IHME" 105 "IMPE" 43 "LANL" 392 "UCLA" 8 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 05 United States of America ALL MODELS C19 daily deaths percent error.pdf", replace












******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 4

twoway ///
(line DDAbPeErIHME20200325 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20200326 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20200327 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20200329 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20200330 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20200331 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20200401 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200401 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200402 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200403 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200404 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200405 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200405 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200406 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200407 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200407 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200408 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200408 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200409 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200410 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200410 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200411 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200412 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200413 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200413 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200414 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200415 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200416 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20200417 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200417 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200418 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200419 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200420 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200421 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200421 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200422 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200422 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200423 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErYYGU20200424 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200425 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200426 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200426 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200427 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200427 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200428 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200428 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200429 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20200429 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200429 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200430 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErYYGU20200501 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200502 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200503 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200503 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200504 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200504 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200505 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200506 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200506 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200507 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200508 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErYYGU20200509 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200510 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20200510 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200510 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200511 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200512 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200512 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200513 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200513 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200514 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200515 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200516 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20200517 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200517 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200518 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200519 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200520 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20200520 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200520 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200521 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200522 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200523 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20200524 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200524 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200525 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200525 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200526 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200526 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200527 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200527 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200528 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200529 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200529 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200530 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20200531 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200531 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200601 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200602 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200603 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200603 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200604 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200605 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200605 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200606 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20200607 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200607 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200608 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200608 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200609 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20200610 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200610 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200611 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200612 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200613 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200614 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200615 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200615 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200616 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200617 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200617 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200618 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200619 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200620 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20200621 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200621 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200622 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200623 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200623 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200624 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200625 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200626 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200627 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20200628 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200628 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200629 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200630 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200701 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200701 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200702 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200703 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200704 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200705 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200705 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200706 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200707 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200708 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200708 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200709 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200710 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200711 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200712 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200713 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200714 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200715 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200716 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200717 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200718 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200719 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200720 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200721 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200722 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErYYGU20200723 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200724 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200725 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200726 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200727 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200728 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200729 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200730 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200731 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErYYGU20200801 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200802 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200803 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200804 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200805 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200806 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200807 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200808 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200809 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200810 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200811 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200812 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200813 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200814 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErYYGU20200815 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200816 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200817 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200818 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200819 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200820 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200821 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200822 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200823 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200824 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200825 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200826 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200827 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200828 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErYYGU20200829 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200830 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200831 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200901 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200902 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200903 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200904 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200905 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200906 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200907 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200908 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200909 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200910 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200911 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200912 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200913 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200914 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200915 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200916 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200917 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200918 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200919 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200920 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200921 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200922 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200923 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20200924 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20200925 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErYYGU20200926 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200927 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200928 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20200929 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20200930 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErYYGU20201001 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErYYGU20201002 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErYYGU20201003 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErYYGU20201004 date, sort lwidth(thin) lcolor(gold)) ///
(line DDAbPeErIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210103 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210110 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErUCLA20210206 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210228 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210307 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210315 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErIHME20210317 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210325 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210328 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210401 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210404 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210409 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210416 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210423 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210506 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210514 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210521 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210528 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210606 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210614 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210621 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210627 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErUCLA20210630 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210706 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210712 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErUCLA20210719 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210726 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210802 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210809 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210816 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210823 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210830 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210906 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210913 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210920 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErUCLA20210927 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErUCLA20211004 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErUCLA20211011 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErUCLA20211018 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErUCLA20211025 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErUCLA20211101 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErUCLA20211108 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErUCLA20211115 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErUCLA20211122 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErUCLA20211129 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErUCLA20211206 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErUCLA20211213 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErUCLA20211220 date, sort lwidth(thin) lcolor(blue)) ///
(line DDAbPeErIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220114 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("United States of America, ALL MODELS, all updates, forecast only", size(small)) ///
legend(position(6) order(29 "DELP" 1 "IHME" 105 "IMPE" 43 "LANL" 392 "UCLA" 8 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 06 United States of America ALL MODELS C19 daily deaths absolute percent error.pdf", replace








***************************************************************
* graph 07a1 Daily deaths, average median error 

twoway ///
(line DDErrorDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDErrorIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDErrorLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDErrorUCLA_Mean1 date, sort lcolor(blue) lwidth(medium)) /// 
(line DDErrorYYGU_Mean1 date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("United States of America, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a1 United States of America ALL MODELS C19 daily deaths average median error.pdf", replace 










***************************************************************
* graph 07a2 Daily deaths, average median error smoothed for better viewing

twoway ///
(line DDErrorDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDErrorIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDErrorLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDErrorUCLA_Mean1_sm date, sort lcolor(blue) lwidth(medium)) /// 
(line DDErrorYYGU_Mean1_sm date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("United States of America, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a2 United States of America ALL MODELS C19 daily deaths average median error smoothed.pdf", replace











***************************************************************
* graph 08a1 Daily deaths, average median absolute AbsErr 

twoway ///
(line DDAbsErrDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbsErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbsErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbsErrUCLA_Mean1 date, sort lcolor(blue) lwidth(medium)) /// 
(line DDAbsErrYYGU_Mean1 date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("United States of America, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a1 United States of America ALL MODELS C19 daily deaths average median absolute error.pdf", replace 










***************************************************************
* graph 08a2 Daily deaths, average median absolute error smoothed for better viewing

twoway ///
(line DDAbsErrDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbsErrIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbsErrLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbsErrUCLA_Mean1_sm date, sort lcolor(blue) lwidth(medium)) /// 
(line DDAbsErrYYGU_Mean1_sm date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("United States of America, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a2 United States of America ALL MODELS C19 daily deaths average median absolute error smoothed.pdf", replace











***************************************************************
* graph 09a1 Daily deaths, average median percent error 

twoway ///
(line DDPerErrDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDPerErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDPerErrUCLA_Mean1 date, sort lcolor(blue) lwidth(medium)) /// 
(line DDPerErrYYGU_Mean1 date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("United States of America, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a1 United States of America ALL MODELS C19 daily deaths average median percent error.pdf", replace










***************************************************************
* graph 09a2 Daily deaths, average median percent error smoothed for better viewing

twoway ///
(line DDPerErrDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDPerErrLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDPerErrUCLA_Mean1_sm date, sort lcolor(blue) lwidth(medium)) /// 
(line DDPerErrYYGU_Mean1_sm date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("United States of America, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a2 United States of America ALL MODELS C19 daily deaths average median percent error smoothed.pdf", replace










***************************************************************
* graph 10a1 Daily deaths, average median absolute percent error 

twoway ///
(line DDAbPeErDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbPeErIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbPeErLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbPeErUCLA_Mean1 date, sort lcolor(blue) lwidth(medium)) /// 
(line DDAbPeErYYGU_Mean1 date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("United States of America, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a1 United States of America ALL MODELS C19 daily deaths average median absolute percent error.pdf", replace 





***************************************************************
* graph 10a2 Daily deaths, average median absolute percent error smoothed for better viewing

twoway ///
(line DDAbPeErDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbPeErIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbPeErLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbPeErUCLA_Mean1_sm date, sort lcolor(blue) lwidth(medium)) /// 
(line DDAbPeErYYGU_Mean1_sm date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("United States of America, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a2 United States of America ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf", replace








***********************************************
***********************************************

* graph each same error measure across models






***********************************************

* gen string "%10.0f" copy of DDError`model'_Mean2 for display

summ DDErrorDELP_Mean2, meanonly
local DDErrorDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorDELP_Mean2str
gen DDErrorDELP_Mean2str = `DDErrorDELP_Mean2str'
label var DDErrorDELP_Mean2str "DDErrorDELP Mean over calendar months of median error over updates string"

summ DDErrorIHME_Mean2, meanonly
local DDErrorIHME_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorIHME_Mean2str
gen DDErrorIHME_Mean2str = `DDErrorIHME_Mean2str'
label var DDErrorIHME_Mean2str "DDErrorIHME Mean over calendar months of median error over updates string"

summ DDErrorIMPE_Mean2, meanonly
local DDErrorIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorIMPE_Mean2str
gen DDErrorIMPE_Mean2str = `DDErrorIMPE_Mean2str'
label var DDErrorIMPE_Mean2str "DDErrorIMPE Mean over calendar months of median error over updates string"

summ DDErrorLANL_Mean2, meanonly
local DDErrorLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorLANL_Mean2str
gen DDErrorLANL_Mean2str = `DDErrorLANL_Mean2str'
label var DDErrorLANL_Mean2str "DDErrorLANL Mean over calendar months of median error over updates string"

summ DDErrorUCLA_Mean2, meanonly
local DDErrorUCLA_Mean2str = string(r(mean),"%8.1f")
capture drop DDErrorUCLA_Mean2str
gen DDErrorUCLA_Mean2str = `DDErrorUCLA_Mean2str'
label var DDErrorUCLA_Mean2str "DDErrorUCLA Mean over calendar months of median error over updates string"

summ DDErrorYYGU_Mean2, meanonly
local DDErrorYYGU_Mean2str = string(r(mean),"%8.1f")
capture drop DDErrorYYGU_Mean2str
gen DDErrorYYGU_Mean2str = `DDErrorYYGU_Mean2str'
label var DDErrorYYGU_Mean2str "DDErrorYYGU Mean over calendar months of median error over updates string"



* graph 12a Daily deaths, Average of Mean Error over updates and calendar months

graph bar ///
(mean) DDErrorDELP_Mean2str /// 
(mean) DDErrorIHME_Mean2str /// 
(mean) DDErrorIMPE_Mean2str /// 
(mean) DDErrorLANL_Mean2str /// 
(mean) DDErrorUCLA_Mean2str /// 
(mean) DDErrorYYGU_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(blue) lcolor(blue)) ///
bar(6, fcolor(gold) lcolor(gold)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Mean Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Mean Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; United States of America", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") size(small) row(2)) 

qui graph export "graph 12a United States of America ALL MODELS C19 daily deaths Average Mean Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbsErr`model'_Mean2 for display

summ DDAbsErrDELP_Mean2, meanonly
local DDAbsErrDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrDELP_Mean2str
gen DDAbsErrDELP_Mean2str = `DDAbsErrDELP_Mean2str'
label var DDAbsErrDELP_Mean2str "DDAbsErrDELP Mean over calendar months of median error over updates string"

summ DDAbsErrIHME_Mean2, meanonly
local DDAbsErrIHME_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrIHME_Mean2str
gen DDAbsErrIHME_Mean2str = `DDAbsErrIHME_Mean2str'
label var DDAbsErrIHME_Mean2str "DDAbsErrIHME Mean over calendar months of median error over updates string"

summ DDAbsErrIMPE_Mean2, meanonly
local DDAbsErrIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrIMPE_Mean2str
gen DDAbsErrIMPE_Mean2str = `DDAbsErrIMPE_Mean2str'
label var DDAbsErrIMPE_Mean2str "DDAbsErrIMPE Mean over calendar months of median error over updates string"

summ DDAbsErrLANL_Mean2, meanonly
local DDAbsErrLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrLANL_Mean2str
gen DDAbsErrLANL_Mean2str = `DDAbsErrLANL_Mean2str'
label var DDAbsErrLANL_Mean2str "DDAbsErrLANL Mean over calendar months of median error over updates string"

summ DDAbsErrUCLA_Mean2, meanonly
local DDAbsErrUCLA_Mean2str = string(r(mean),"%8.1f")
capture drop DDAbsErrUCLA_Mean2str
gen DDAbsErrUCLA_Mean2str = `DDAbsErrUCLA_Mean2str'
label var DDAbsErrUCLA_Mean2str "DDAbsErrUCLA Mean over calendar months of median error over updates string"

summ DDAbsErrYYGU_Mean2, meanonly
local DDAbsErrYYGU_Mean2str = string(r(mean),"%8.1f")
capture drop DDAbsErrYYGU_Mean2str
gen DDAbsErrYYGU_Mean2str = `DDAbsErrYYGU_Mean2str'
label var DDAbsErrYYGU_Mean2str "DDAbsErrYYGU Mean over calendar months of median error over updates string"



* graph 12b Daily deaths, Average of Absolute Error over updates and calendar months

graph bar ///
(mean) DDAbsErrDELP_Mean2str /// 
(mean) DDAbsErrIHME_Mean2str /// 
(mean) DDAbsErrIMPE_Mean2str /// 
(mean) DDAbsErrLANL_Mean2str /// 
(mean) DDAbsErrUCLA_Mean2str /// 
(mean) DDAbsErrYYGU_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(blue) lcolor(blue)) ///
bar(6, fcolor(gold) lcolor(gold)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; United States of America", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") size(small) row(2)) 

qui graph export "graph 12b United States of America ALL MODELS C19 daily deaths Average Absolute Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDPerErr`model'_Mean2 for display

summ DDPerErrDELP_Mean2, meanonly
local DDPerErrDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrDELP_Mean2str
gen DDPerErrDELP_Mean2str = `DDPerErrDELP_Mean2str'
label var DDPerErrDELP_Mean2str "DDPerErrDELP Mean over calendar months of median error over updates string"

summ DDPerErrIHME_Mean2, meanonly
local DDPerErrIHME_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrIHME_Mean2str
gen DDPerErrIHME_Mean2str = `DDPerErrIHME_Mean2str'
label var DDPerErrIHME_Mean2str "DDPerErrIHME Mean over calendar months of median error over updates string"

summ DDPerErrIMPE_Mean2, meanonly
local DDPerErrIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrIMPE_Mean2str
gen DDPerErrIMPE_Mean2str = `DDPerErrIMPE_Mean2str'
label var DDPerErrIMPE_Mean2str "DDPerErrIMPE Mean over calendar months of median error over updates string"

summ DDPerErrLANL_Mean2, meanonly
local DDPerErrLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrLANL_Mean2str
gen DDPerErrLANL_Mean2str = `DDPerErrLANL_Mean2str'
label var DDPerErrLANL_Mean2str "DDPerErrLANL Mean over calendar months of median error over updates string"

summ DDPerErrUCLA_Mean2, meanonly
local DDPerErrUCLA_Mean2str = string(r(mean),"%8.1f")
capture drop DDPerErrUCLA_Mean2str
gen DDPerErrUCLA_Mean2str = `DDPerErrUCLA_Mean2str'
label var DDPerErrUCLA_Mean2str "DDPerErrUCLA Mean over calendar months of median error over updates string"

summ DDPerErrYYGU_Mean2, meanonly
local DDPerErrYYGU_Mean2str = string(r(mean),"%8.1f")
capture drop DDPerErrYYGU_Mean2str
gen DDPerErrYYGU_Mean2str = `DDPerErrYYGU_Mean2str'
label var DDPerErrYYGU_Mean2str "DDPerErrYYGU Mean over calendar months of median error over updates string"


* graph 12c Daily deaths, Average of Percent PerErr over updates and calendar months

graph bar ///
(mean) DDPerErrDELP_Mean2str /// 
(mean) DDPerErrIHME_Mean2str /// 
(mean) DDPerErrIMPE_Mean2str /// 
(mean) DDPerErrLANL_Mean2str /// 
(mean) DDPerErrUCLA_Mean2str /// 
(mean) DDPerErrYYGU_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(blue) lcolor(blue)) ///
bar(6, fcolor(gold) lcolor(gold)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; United States of America", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") size(small) row(2)) 

qui graph export "graph 12c United States of America ALL MODELS C19 daily deaths Average Percent Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbPeEr`model'_Mean2 for display

summ DDAbPeErDELP_Mean2, meanonly
local DDAbPeErDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErDELP_Mean2str
gen DDAbPeErDELP_Mean2str = `DDAbPeErDELP_Mean2str'
label var DDAbPeErDELP_Mean2str "DDAbPeErDELP Mean over calendar months of median error over updates string"

summ DDAbPeErIHME_Mean2, meanonly
local DDAbPeErIHME_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErIHME_Mean2str
gen DDAbPeErIHME_Mean2str = `DDAbPeErIHME_Mean2str'
label var DDAbPeErIHME_Mean2str "DDAbPeErIHME Mean over calendar months of median error over updates string"

summ DDAbPeErIMPE_Mean2, meanonly
local DDAbPeErIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErIMPE_Mean2str
gen DDAbPeErIMPE_Mean2str = `DDAbPeErIMPE_Mean2str'
label var DDAbPeErIMPE_Mean2str "DDAbPeErIMPE Mean over calendar months of median error over updates string"

summ DDAbPeErLANL_Mean2, meanonly
local DDAbPeErLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErLANL_Mean2str
gen DDAbPeErLANL_Mean2str = `DDAbPeErLANL_Mean2str'
label var DDAbPeErLANL_Mean2str "DDAbPeErLANL Mean over calendar months of median error over updates string"

summ DDAbPeErUCLA_Mean2, meanonly
local DDAbPeErUCLA_Mean2str = string(r(mean),"%8.1f")
capture drop DDAbPeErUCLA_Mean2str
gen DDAbPeErUCLA_Mean2str = `DDAbPeErUCLA_Mean2str'
label var DDAbPeErUCLA_Mean2str "DDAbPeErUCLA Mean over calendar months of median error over updates string"

summ DDAbPeErYYGU_Mean2, meanonly
local DDAbPeErYYGU_Mean2str = string(r(mean),"%8.1f")
capture drop DDAbPeErYYGU_Mean2str
gen DDAbPeErYYGU_Mean2str = `DDAbPeErYYGU_Mean2str'
label var DDAbPeErYYGU_Mean2str "DDAbPeErYYGU Mean over calendar months of median error over updates string"


* graph 12d Daily deaths, Average of Absolute Percent Error over updates and calendar months

graph bar ///
(mean) DDAbPeErDELP_Mean2str /// 
(mean) DDAbPeErIHME_Mean2str /// 
(mean) DDAbPeErIMPE_Mean2str /// 
(mean) DDAbPeErLANL_Mean2str /// 
(mean) DDAbPeErUCLA_Mean2str /// 
(mean) DDAbPeErYYGU_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(blue) lcolor(blue)) ///
bar(6, fcolor(gold) lcolor(gold)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; United States of America", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") size(small) row(2)) 

qui graph export "graph 12d United States of America ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf", replace





qui compress

save "ALL MODELS United States of America error.dta", replace





******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS United States of America error data dictionary.csv", replace 
	
restore









***********************************************
***********************************************

* graph all models across error measures


use "ALL MODELS United States of America error.dta", clear

save "ALL MODELS United States of America error - only models across error measures.dta", replace



keep *Mean2 


foreach var of varlist * {
	
	summ `var', meanonly
	
	qui replace `var' = r(mean)
}


keep in 1 


* get equal-length varnames before reshape // change Error to Errorr so that all Errorr, AbsErr, PerErr, and AbPeEr have same lenght (6 characters)
rename ///
(DDErrorDELP_Mean2 DDErrorIHME_Mean2 DDErrorIMPE_Mean2 DDErrorLANL_Mean2 DDErrorUCLA_Mean2 DDErrorYYGU_Mean2) ///
(DDErrorrDELP_Mean2 DDErrorrIHME_Mean2 DDErrorrIMPE_Mean2 DDErrorrLANL_Mean2 DDErrorrUCLA_Mean2 DDErrorrYYGU_Mean2) 




* get renvars



/*

* After 
net from  http://www.stata-journal.com/software/sj5-4
Stata might return the following:

host not found
http://www.stata-journal.com/software/sj5-4/ either
  1)  is not a valid URL, or
  2)  could not be contacted, or
  3)  is not a Stata download site (has no stata.toc file).

current site is still http://fmwww.bc.edu/repec/bocode/g/

* Bad internet connetion is the issue. Try again / later. 


*/

net from  http://www.stata-journal.com/software/sj5-4

net describe dm88_1

net install dm88_1

*


renvars *, postdrop(6)

save "CovidLongitudinal United States of America merge temp.dta", replace 


gen i = _n

reshape long DDErrorr DDAbsErr DDPerErr DDAbPeEr, i(i) j(A, string)

rename A model

drop i



label var model "epidemic model being studied"
label var DDErrorr "Daily deaths Error mean of medians over updates and calendar months"
label var DDAbsErr "Daily deaths Absolute Error mean of medians over updates and calendar months"
label var DDPerErr "Daily deaths Percent Error mean of medians over updates and calendar months"
label var DDAbPeEr "Daily deaths Absolute Percent Error mean of medians over updates and calendar months"


graph bar DDErrorr DDAbsErr DDPerErr DDAbPeEr, over(model) ///
bar(1, fcolor(stone) lcolor(stone)) ///
bar(2, fcolor(sand) lcolor(sand)) ///
bar(3, fcolor(ltblue) lcolor(ltblue)) ///
bar(4, fcolor(ebblue) lcolor(ebblue)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average error measures") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths, models across average error measures", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; United States of America", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "Error" 2 "Absolute error" 3 "Percent error" 4 "Absolute percent error" ) size(small) row(1)) 

qui graph export "graph 13a United States of America ALL MODELS C19 daily deaths, models across error measures.pdf", replace


qui compress

save "ALL MODELS United States of America error - only models across error measures.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS United States of America error - only models across error measures data dictionary.csv", replace 
	
restore






***********************************************
***********************************************

* graph all error measures across models


use "CovidLongitudinal United States of America merge temp.dta", clear 


gen i = _n


* temp rename models from A1 to A6 and Error Measures to E1 to E4 for reshaping:

rename (DDErrorrDELP DDErrorrIHME DDErrorrIMPE DDErrorrLANL DDErrorrUCLA DDErrorrYYGU) ///
       (DDA1E1 DDA2E1 DDA3E1 DDA4E1 DDA5E1 DDA6E1) 
label var DDA1E1 "Daily Deaths Error mean of medians over updates and calendar months DELP"
label var DDA2E1 "Daily Deaths Error mean of medians over updates and calendar months IHME"
label var DDA3E1 "Daily Deaths Error mean of medians over updates and calendar months IMPE"
label var DDA4E1 "Daily Deaths Error mean of medians over updates and calendar months LANL"
label var DDA5E1 "Daily Deaths Error mean of medians over updates and calendar months UCLA"
label var DDA6E1 "Daily Deaths Error mean of medians over updates and calendar months YYGU"

	   
rename (DDAbsErrDELP DDAbsErrIHME DDAbsErrIMPE DDAbsErrLANL DDAbsErrUCLA DDAbsErrYYGU) ///
       (DDA1E2 DDA2E2 DDA3E2 DDA4E2 DDA5E2 DDA6E2) 
label var DDA1E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months DELP"
label var DDA2E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months IHME"
label var DDA3E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months IMPE"
label var DDA4E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months LANL"
label var DDA5E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months UCLA"
label var DDA6E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months YYGU"	   
	   
rename (DDPerErrDELP DDPerErrIHME DDPerErrIMPE DDPerErrLANL DDPerErrUCLA DDPerErrYYGU) ///
       (DDA1E3 DDA2E3 DDA3E3 DDA4E3 DDA5E3 DDA6E3) 	   
label var DDA1E3 "Daily Deaths Percent Error mean of medians over updates and calendar months DELP"
label var DDA2E3 "Daily Deaths Percent Error mean of medians over updates and calendar months IHME"
label var DDA3E3 "Daily Deaths Percent Error mean of medians over updates and calendar months IMPE"
label var DDA4E3 "Daily Deaths Percent Error mean of medians over updates and calendar months LANL"
label var DDA5E3 "Daily Deaths Percent Error mean of medians over updates and calendar months UCLA"
label var DDA6E3 "Daily Deaths Percent Error mean of medians over updates and calendar months YYGU"

rename (DDAbPeErDELP DDAbPeErIHME DDAbPeErIMPE DDAbPeErLANL DDAbPeErUCLA DDAbPeErYYGU) ///
       (DDA1E4 DDA2E4 DDA3E4 DDA4E4 DDA5E4 DDA6E4) 
label var DDA1E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months DELP"
label var DDA2E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months IHME"
label var DDA3E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months IMPE"
label var DDA4E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months LANL"
label var DDA5E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months UCLA"
label var DDA6E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months YYGU"

	   
reshape long DDA1 DDA2 DDA3 DDA4 DDA5 DDA6, i(i) j(E, string)

gen type = . 
label var type "Error measure type"
replace type = 1 if E == "E1"
replace type = 2 if E == "E2"
replace type = 3 if E == "E3"
replace type = 4 if E == "E4"


label define type 1 "Error" 2 "Absolute Error" 3 "Percent Error" 4 "Absolute % Error"
label values type type


qui compress


graph bar DDA1 DDA2 DDA3 DDA4 DDA5 DDA6, over(type) ///
bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(blue) lcolor(blue)) ///
bar(6, fcolor(gold) lcolor(gold)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average error measures") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths, average of error measures across models", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; United States of America", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") size(small) row(2)) 

qui graph export "graph 13b United States of America ALL MODELS C19 daily deaths, error measures across models.pdf", replace





* reshape wide


drop type

reshape wide DDA1 DDA2 DDA3 DDA4 DDA5 DDA6, i(i) j(E, string)


rename (DDA1E1 DDA2E1 DDA3E1 DDA4E1 DDA5E1 DDA6E1) ///
       (DD_DELP_Errorr DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr DD_UCLA_Errorr DD_YYGU_Errorr)

label var DD_DELP_Errorr "Daily Deaths DELP Error mean of medians over updates and calendar months"
label var DD_IHME_Errorr "Daily Deaths IHME Error mean of medians over updates and calendar months"
label var DD_IMPE_Errorr "Daily Deaths IMPE Error mean of medians over updates and calendar months"
label var DD_LANL_Errorr "Daily Deaths LANL Error mean of medians over updates and calendar months"
label var DD_UCLA_Errorr "Daily Deaths UCLA Error mean of medians over updates and calendar months"
label var DD_YYGU_Errorr "Daily Deaths YYGU Error mean of medians over updates and calendar months"


rename (DDA1E2 DDA2E2 DDA3E2 DDA4E2 DDA5E2 DDA6E2) ///
       (DD_DELP_AbsErr DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr DD_UCLA_AbsErr DD_YYGU_AbsErr)

label var DD_DELP_AbsErr "Daily Deaths DELP Absolute Error mean of medians over updates and calendar months"
label var DD_IHME_AbsErr "Daily Deaths IHME Absolute Error mean of medians over updates and calendar months"
label var DD_IMPE_AbsErr "Daily Deaths IMPE Absolute Error mean of medians over updates and calendar months"
label var DD_LANL_AbsErr "Daily Deaths LANL Absolute Error mean of medians over updates and calendar months"
label var DD_UCLA_AbsErr "Daily Deaths UCLA Absolute Error mean of medians over updates and calendar months"
label var DD_YYGU_AbsErr "Daily Deaths YYGU Absolute Error mean of medians over updates and calendar months"


rename (DDA1E3 DDA2E3 DDA3E3 DDA4E3 DDA5E3 DDA6E3) ///
       (DD_DELP_PerErr DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr DD_UCLA_PerErr DD_YYGU_PerErr)

label var DD_DELP_PerErr "Daily Deaths DELP Percent Error mean of medians over updates and calendar months"
label var DD_IHME_PerErr "Daily Deaths IHME Percent Error mean of medians over updates and calendar months"
label var DD_IMPE_PerErr "Daily Deaths IMPE Percent Error mean of medians over updates and calendar months"
label var DD_LANL_PerErr "Daily Deaths LANL Percent Error mean of medians over updates and calendar months"
label var DD_UCLA_PerErr "Daily Deaths UCLA Percent Error mean of medians over updates and calendar months"
label var DD_YYGU_PerErr "Daily Deaths YYGU Percent Error mean of medians over updates and calendar months"


rename (DDA1E4 DDA2E4 DDA3E4 DDA4E4 DDA5E4 DDA6E4) ///
(DD_DELP_AbPeEr DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr DD_UCLA_AbPeEr DD_YYGU_AbPeEr)

label var DD_DELP_AbPeEr "Daily Deaths DELP Absolute Percent Error mean of medians over updates and calendar months"
label var DD_IHME_AbPeEr "Daily Deaths IHME Absolute Percent Error mean of medians over updates and calendar months"
label var DD_IMPE_AbPeEr "Daily Deaths IMPE Absolute Percent Error mean of medians over updates and calendar months"
label var DD_LANL_AbPeEr "Daily Deaths LANL Absolute Percent Error mean of medians over updates and calendar months"
label var DD_UCLA_AbPeEr "Daily Deaths UCLA Absolute Percent Error mean of medians over updates and calendar months"
label var DD_YYGU_AbPeEr "Daily Deaths YYGU Absolute Percent Error mean of medians over updates and calendar months"



drop i

gen country = "United States of America"

gen iso = "USA"

order country iso

qui compress

save "ALL MODELS United States of America error - only error measures across models.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS United States of America error - only error measures across models data dictionary.csv", replace 
	
restore







view "log CovidLongitudinal United States of America 9 Merge.smcl"

log close

exit, clear
