
clear all

cd "$pathCovidLongitudinal/countries/Eswatini"

capture log close 

log using "log CovidLongitudinal Eswatini 9 Merge.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Eswatini 9 Merge.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Merge calculations results for error measures by models
	* for each country ---->> Eswatini <<----                                                                 
***************************************************************************


* Merge calculations results for error measures by models, create graphs



** input data files: "`model' Eswatini error.dta"

** output data files: "ALL MODELS Eswatini error.dta" with all date
*                     "ALL MODELS Eswatini error - only models across error measures.dta", replace
*                     "ALL MODELS Eswatini error - only error measures across models.dta", replace

* output data dictionary files: "ALL MODELS Eswatini error data dictionary.csv"
*                               "ALL MODELS Eswatini error - only models across error measures data dictionary.csv"
*                               "ALL MODELS Eswatini error - only error measures across models data dictionary.csv"


** Graphs:
* "graph 03 Eswatini ALL MODELS C19 daily deaths error.pdf"
* "graph 04 Eswatini ALL MODELS C19 daily deaths absolute error.pdf"
* "graph 05 Eswatini ALL MODELS C19 daily deaths percent error.pdf"
* "graph 06 Eswatini ALL MODELS C19 daily deaths absolute percent error.pdf"

* "graph 07a1 Eswatini ALL MODELS C19 daily deaths average median error.pdf"
* "graph 07a2 Eswatini ALL MODELS C19 daily deaths average median error smoothed.pdf"
* "graph 08a1 Eswatini ALL MODELS C19 daily deaths average median absolute error.pdf"
* "graph 08a2 Eswatini ALL MODELS C19 daily deaths average median absolute error smoothed.pdf"
* "graph 09a1 Eswatini ALL MODELS C19 daily deaths average median percent error.pdf"
* "graph 09a2 Eswatini ALL MODELS C19 daily deaths average median percent error smoothed.pdf"
* "graph 10a1 Eswatini ALL MODELS C19 daily deaths average median absolute percent error.pdf"
* "graph 10a2 Eswatini ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf"

****** graph each same error measure across models:
* "graph 12a Eswatini ALL MODELS C19 daily deaths Average Mean Error.pdf"
* "graph 12b Eswatini ALL MODELS C19 daily deaths Average Absolute Error.pdf"
* "graph 12c Eswatini ALL MODELS C19 daily deaths Average Percent Error.pdf"
* "graph 12d Eswatini ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf"

****** graph all models across error measures:
* "graph 13a Eswatini ALL MODELS C19 daily deaths, models across error measures.pdf"

****** graph all error measures across models:
* "graph 13b Eswatini ALL MODELS C19 daily deaths, error measures across models.pdf"




grstyle init

grstyle color background white




use "IHME Eswatini error.dta", clear 
	
	merge m:m date using "IMPE Eswatini error.dta"
	
	drop _merge
	
	merge m:m date using "LANL Eswatini error.dta"	
	
	drop _merge
	
qui compress









******
* graph 03 Daily deaths, Error // <<-- modify 1

twoway ///
(line DDErrorIMPE20200428 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200429 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200430 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200501 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200502 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200503 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200504 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200505 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200506 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200507 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200508 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200509 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200511 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200512 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200513 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200514 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200515 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200517 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200519 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200520 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200521 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200523 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200524 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200525 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200526 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200528 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200529 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200531 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200602 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200609 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200621 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200628 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Eswatini, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(45 "IHME" 1 "IMPE" 55 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 03 Eswatini ALL MODELS C19 daily deaths error.pdf", replace










******
* graph 04 Daily deaths, AbsErr // <<-- modify 2

twoway ///
(line DDAbsErrIMPE20200428 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200429 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200430 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200501 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200502 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200503 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200504 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200505 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200506 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200507 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200508 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200509 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200511 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200512 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200513 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200514 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200515 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200517 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200519 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200520 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200521 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200523 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200524 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200525 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200526 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200528 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200529 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200531 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200602 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200609 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200621 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200628 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Eswatini, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(45 "IHME" 1 "IMPE" 55 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 04 Eswatini ALL MODELS C19 daily deaths absolute error.pdf", replace









******
* graph 05 Daily deaths, Percent Error <<-- modify 3

twoway ///
(line DDPerErrIMPE20200428 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200429 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200430 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200501 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200502 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200503 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200504 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200505 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200506 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200507 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200508 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200509 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200511 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200512 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200513 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200514 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200515 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200517 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200519 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200520 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200521 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200523 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200524 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200525 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200526 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200528 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200529 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200531 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200602 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200609 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200621 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200628 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Eswatini, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(45 "IHME" 1 "IMPE" 55 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 05 Eswatini ALL MODELS C19 daily deaths percent error.pdf", replace












******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 4

twoway ///
(line DDAbPeErIMPE20200428 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200429 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200430 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200501 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200502 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200503 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200504 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200505 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200506 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200507 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200508 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200509 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200511 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200512 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200513 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200514 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200515 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200517 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200519 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200520 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200521 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200523 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200524 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200525 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200526 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200528 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200529 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200531 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200602 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200609 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200621 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200628 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Eswatini, ALL MODELS, all updates, forecast only", size(small)) ///
legend(position(6) order(45 "IHME" 1 "IMPE" 55 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 06 Eswatini ALL MODELS C19 daily deaths absolute percent error.pdf", replace








***************************************************************
* graph 07a1 Daily deaths, average median error 

twoway ///
(line DDErrorIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDErrorIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDErrorLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Eswatini, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a1 Eswatini ALL MODELS C19 daily deaths average median error.pdf", replace 










***************************************************************
* graph 07a2 Daily deaths, average median error smoothed for better viewing

twoway ///
(line DDErrorIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDErrorIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDErrorLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Eswatini, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a2 Eswatini ALL MODELS C19 daily deaths average median error smoothed.pdf", replace











***************************************************************
* graph 08a1 Daily deaths, average median absolute AbsErr 

twoway ///
(line DDAbsErrIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbsErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbsErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Eswatini, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a1 Eswatini ALL MODELS C19 daily deaths average median absolute error.pdf", replace 










***************************************************************
* graph 08a2 Daily deaths, average median absolute error smoothed for better viewing

twoway ///
(line DDAbsErrIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbsErrIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbsErrLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Eswatini, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a2 Eswatini ALL MODELS C19 daily deaths average median absolute error smoothed.pdf", replace











***************************************************************
* graph 09a1 Daily deaths, average median percent error 

twoway ///
(line DDPerErrIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDPerErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Eswatini, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a1 Eswatini ALL MODELS C19 daily deaths average median percent error.pdf", replace










***************************************************************
* graph 09a2 Daily deaths, average median percent error smoothed for better viewing

twoway ///
(line DDPerErrIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDPerErrLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Eswatini, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a2 Eswatini ALL MODELS C19 daily deaths average median percent error smoothed.pdf", replace










***************************************************************
* graph 10a1 Daily deaths, average median absolute percent error 

twoway ///
(line DDAbPeErIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbPeErIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbPeErLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Eswatini, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a1 Eswatini ALL MODELS C19 daily deaths average median absolute percent error.pdf", replace 





***************************************************************
* graph 10a2 Daily deaths, average median absolute percent error smoothed for better viewing

twoway ///
(line DDAbPeErIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbPeErIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbPeErLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Eswatini, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a2 Eswatini ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf", replace








***********************************************
***********************************************

* graph each same error measure across models






***********************************************

* gen string "%10.0f" copy of DDError`model'_Mean2 for display

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




* graph 12a Daily deaths, Average of Mean Error over updates and calendar months

graph bar ///
(mean) DDErrorIHME_Mean2str /// 
(mean) DDErrorIMPE_Mean2str /// 
(mean) DDErrorLANL_Mean2str /// 
, bar(1, fcolor(black) lcolor(black)) ///
bar(2, fcolor(magenta) lcolor(magenta)) ///
bar(3, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Mean Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Mean Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Eswatini", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") size(small) row(1)) 

qui graph export "graph 12a Eswatini ALL MODELS C19 daily deaths Average Mean Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbsErr`model'_Mean2 for display

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




* graph 12b Daily deaths, Average of Absolute Error over updates and calendar months

graph bar ///
(mean) DDAbsErrIHME_Mean2str /// 
(mean) DDAbsErrIMPE_Mean2str /// 
(mean) DDAbsErrLANL_Mean2str /// 
, bar(1, fcolor(black) lcolor(black)) ///
bar(2, fcolor(magenta) lcolor(magenta)) ///
bar(3, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Eswatini", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") size(small) row(1)) 

qui graph export "graph 12b Eswatini ALL MODELS C19 daily deaths Average Absolute Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDPerErr`model'_Mean2 for display

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




* graph 12c Daily deaths, Average of Percent PerErr over updates and calendar months

graph bar ///
(mean) DDPerErrIHME_Mean2str /// 
(mean) DDPerErrIMPE_Mean2str /// 
(mean) DDPerErrLANL_Mean2str /// 
, bar(1, fcolor(black) lcolor(black)) ///
bar(2, fcolor(magenta) lcolor(magenta)) ///
bar(3, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Eswatini", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") size(small) row(1)) 

qui graph export "graph 12c Eswatini ALL MODELS C19 daily deaths Average Percent Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbPeEr`model'_Mean2 for display

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




* graph 12d Daily deaths, Average of Absolute Percent Error over updates and calendar months

graph bar ///
(mean) DDAbPeErIHME_Mean2str /// 
(mean) DDAbPeErIMPE_Mean2str /// 
(mean) DDAbPeErLANL_Mean2str /// 
, bar(1, fcolor(black) lcolor(black)) ///
bar(2, fcolor(magenta) lcolor(magenta)) ///
bar(3, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Eswatini", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") size(small) row(1)) 

qui graph export "graph 12d Eswatini ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf", replace





qui compress

save "ALL MODELS Eswatini error.dta", replace





******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Eswatini error data dictionary.csv", replace 
	
restore









***********************************************
***********************************************

* graph all models across error measures


use "ALL MODELS Eswatini error.dta", clear

save "ALL MODELS Eswatini error - only models across error measures.dta", replace



keep *Mean2 


foreach var of varlist * {
	
	summ `var', meanonly
	
	qui replace `var' = r(mean)
}


keep in 1 


* get equal-length varnames before reshape // change Error to Errorr so that all Errorr, AbsErr, PerErr, and AbPeEr have same lenght (6 characters)
rename ///
(DDErrorIHME_Mean2 DDErrorIMPE_Mean2 DDErrorLANL_Mean2) ///
(DDErrorrIHME_Mean2 DDErrorrIMPE_Mean2 DDErrorrLANL_Mean2) 




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

save "CovidLongitudinal Eswatini merge temp.dta", replace 


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
subtitle("Over updates and calendar months; forecast only; Eswatini", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "Error" 2 "Absolute error" 3 "Percent error" 4 "Absolute percent error" ) size(small) row(1)) 

qui graph export "graph 13a Eswatini ALL MODELS C19 daily deaths, models across error measures.pdf", replace


qui compress

save "ALL MODELS Eswatini error - only models across error measures.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Eswatini error - only models across error measures data dictionary.csv", replace 
	
restore






***********************************************
***********************************************

* graph all error measures across models


use "CovidLongitudinal Eswatini merge temp.dta", clear 


gen i = _n


* temp rename models from A1 to A7 and Error Measures to E1 to E4 for reshaping:

rename (DDErrorrIHME DDErrorrIMPE DDErrorrLANL) ///
       (DDA1E1 DDA2E1 DDA3E1) 
label var DDA1E1 "Daily Deaths Error mean of medians over updates and calendar months IHME"
label var DDA2E1 "Daily Deaths Error mean of medians over updates and calendar months IMPE"
label var DDA3E1 "Daily Deaths Error mean of medians over updates and calendar months LANL"

	   
rename (DDAbsErrIHME DDAbsErrIMPE DDAbsErrLANL) ///
       (DDA1E2 DDA2E2 DDA3E2) 
label var DDA1E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months IHME"
label var DDA2E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months IMPE"
label var DDA3E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months LANL"
	   
rename (DDPerErrIHME DDPerErrIMPE DDPerErrLANL) ///
       (DDA1E3 DDA2E3 DDA3E3) 	   
label var DDA1E3 "Daily Deaths Percent Error mean of medians over updates and calendar months IHME"
label var DDA2E3 "Daily Deaths Percent Error mean of medians over updates and calendar months IMPE"
label var DDA3E3 "Daily Deaths Percent Error mean of medians over updates and calendar months LANL"

rename (DDAbPeErIHME DDAbPeErIMPE DDAbPeErLANL) ///
       (DDA1E4 DDA2E4 DDA3E4) 
label var DDA1E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months IHME"
label var DDA2E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months IMPE"
label var DDA3E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months LANL"

	   
reshape long DDA1 DDA2 DDA3, i(i) j(E, string)

gen type = . 
label var type "Error measure type"
replace type = 1 if E == "E1"
replace type = 2 if E == "E2"
replace type = 3 if E == "E3"
replace type = 4 if E == "E4"


label define type 1 "Error" 2 "Absolute Error" 3 "Percent Error" 4 "Absolute % Error"
label values type type


qui compress


graph bar DDA1 DDA2 DDA3, over(type) ///
bar(1, fcolor(black) lcolor(black)) ///
bar(2, fcolor(magenta) lcolor(magenta)) ///
bar(3, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average error measures") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths, average of error measures across models", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Eswatini", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") size(small) row(1)) 

qui graph export "graph 13b Eswatini ALL MODELS C19 daily deaths, error measures across models.pdf", replace





* reshape wide


drop type

reshape wide DDA1 DDA2 DDA3, i(i) j(E, string)


rename (DDA1E1 DDA2E1 DDA3E1) ///
       (DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr)

label var DD_IHME_Errorr "Daily Deaths IHME Error mean of medians over updates and calendar months"
label var DD_IMPE_Errorr "Daily Deaths IMPE Error mean of medians over updates and calendar months"
label var DD_LANL_Errorr "Daily Deaths LANL Error mean of medians over updates and calendar months"


rename (DDA1E2 DDA2E2 DDA3E2) ///
       (DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr)

label var DD_IHME_AbsErr "Daily Deaths IHME Absolute Error mean of medians over updates and calendar months"
label var DD_IMPE_AbsErr "Daily Deaths IMPE Absolute Error mean of medians over updates and calendar months"
label var DD_LANL_AbsErr "Daily Deaths LANL Absolute Error mean of medians over updates and calendar months"


rename (DDA1E3 DDA2E3 DDA3E3) ///
       (DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr)

label var DD_IHME_PerErr "Daily Deaths IHME Percent Error mean of medians over updates and calendar months"
label var DD_IMPE_PerErr "Daily Deaths IMPE Percent Error mean of medians over updates and calendar months"
label var DD_LANL_PerErr "Daily Deaths LANL Percent Error mean of medians over updates and calendar months"


rename (DDA1E4 DDA2E4 DDA3E4) ///
(DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr)

label var DD_IHME_AbPeEr "Daily Deaths IHME Absolute Percent Error mean of medians over updates and calendar months"
label var DD_IMPE_AbPeEr "Daily Deaths IMPE Absolute Percent Error mean of medians over updates and calendar months"
label var DD_LANL_AbPeEr "Daily Deaths LANL Absolute Percent Error mean of medians over updates and calendar months"



drop i

gen country = "Eswatini"

gen iso = "SWZ"

order country iso

qui compress

save "ALL MODELS Eswatini error - only error measures across models.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Eswatini error - only error measures across models data dictionary.csv", replace 
	
restore







view "log CovidLongitudinal Eswatini 9 Merge.smcl"

log close

exit, clear
