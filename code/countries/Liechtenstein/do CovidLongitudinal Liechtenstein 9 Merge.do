
clear all

cd "$pathCovidLongitudinal/countries/Liechtenstein"

capture log close 

log using "log CovidLongitudinal Liechtenstein 9 Merge.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Liechtenstein 9 Merge.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Merge calculations results for error measures by models
	* for each country ---->> Liechtenstein <<----                                                                 
***************************************************************************


* Merge calculations results for error measures by models, create graphs



** input data files: "`model' Liechtenstein error.dta"

** output data files: "ALL MODELS Liechtenstein error.dta" with all date
*                     "ALL MODELS Liechtenstein error - only models across error measures.dta", replace
*                     "ALL MODELS Liechtenstein error - only error measures across models.dta", replace

* output data dictionary files: "ALL MODELS Liechtenstein error data dictionary.csv"
*                               "ALL MODELS Liechtenstein error - only models across error measures data dictionary.csv"
*                               "ALL MODELS Liechtenstein error - only error measures across models data dictionary.csv"


** Graphs:
* "graph 03 Liechtenstein ALL MODELS C19 daily deaths error.pdf"
* "graph 04 Liechtenstein ALL MODELS C19 daily deaths absolute error.pdf"
* "graph 05 Liechtenstein ALL MODELS C19 daily deaths percent error.pdf"
* "graph 06 Liechtenstein ALL MODELS C19 daily deaths absolute percent error.pdf"

* "graph 07a1 Liechtenstein ALL MODELS C19 daily deaths average median error.pdf"
* "graph 07a2 Liechtenstein ALL MODELS C19 daily deaths average median error smoothed.pdf"
* "graph 08a1 Liechtenstein ALL MODELS C19 daily deaths average median absolute error.pdf"
* "graph 08a2 Liechtenstein ALL MODELS C19 daily deaths average median absolute error smoothed.pdf"
* "graph 09a1 Liechtenstein ALL MODELS C19 daily deaths average median percent error.pdf"
* "graph 09a2 Liechtenstein ALL MODELS C19 daily deaths average median percent error smoothed.pdf"
* "graph 10a1 Liechtenstein ALL MODELS C19 daily deaths average median absolute percent error.pdf"
* "graph 10a2 Liechtenstein ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf"

****** graph each same error measure across models:
* "graph 12a Liechtenstein ALL MODELS C19 daily deaths Average Mean Error.pdf"
* "graph 12b Liechtenstein ALL MODELS C19 daily deaths Average Absolute Error.pdf"
* "graph 12c Liechtenstein ALL MODELS C19 daily deaths Average Percent Error.pdf"
* "graph 12d Liechtenstein ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf"

****** graph all models across error measures:
* "graph 13a Liechtenstein ALL MODELS C19 daily deaths, models across error measures.pdf"

****** graph all error measures across models:
* "graph 13b Liechtenstein ALL MODELS C19 daily deaths, error measures across models.pdf"




grstyle init

grstyle color background white




use "DELP Liechtenstein error.dta", clear 
	
	merge m:m date using "LANL Liechtenstein error.dta"	
	
	drop _merge
	
qui compress









******
* graph 03 Daily deaths, Error // <<-- modify 1

twoway ///
(line DDErrorDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDErrorDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDErrorDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDErrorDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Liechtenstein, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "DELP" 8 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 03 Liechtenstein ALL MODELS C19 daily deaths error.pdf", replace










******
* graph 04 Daily deaths, AbsErr // <<-- modify 2

twoway ///
(line DDAbsErrDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDAbsErrDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDAbsErrDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDAbsErrDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Liechtenstein, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "DELP" 8 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 04 Liechtenstein ALL MODELS C19 daily deaths absolute error.pdf", replace









******
* graph 05 Daily deaths, Percent Error <<-- modify 3

twoway ///
(line DDPerErrDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDPerErrDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDPerErrDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDPerErrDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Liechtenstein, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "DELP" 8 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 05 Liechtenstein ALL MODELS C19 daily deaths percent error.pdf", replace












******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 4

twoway ///
(line DDAbPeErDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDAbPeErDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDAbPeErDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
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
(line DDAbPeErDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Liechtenstein, ALL MODELS, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "DELP" 8 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 06 Liechtenstein ALL MODELS C19 daily deaths absolute percent error.pdf", replace








***************************************************************
* graph 07a1 Daily deaths, average median error 

twoway ///
(line DDErrorDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Liechtenstein, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a1 Liechtenstein ALL MODELS C19 daily deaths average median error.pdf", replace 










***************************************************************
* graph 07a2 Daily deaths, average median error smoothed for better viewing

twoway ///
(line DDErrorDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Liechtenstein, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a2 Liechtenstein ALL MODELS C19 daily deaths average median error smoothed.pdf", replace











***************************************************************
* graph 08a1 Daily deaths, average median absolute AbsErr 

twoway ///
(line DDAbsErrDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Liechtenstein, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a1 Liechtenstein ALL MODELS C19 daily deaths average median absolute error.pdf", replace 










***************************************************************
* graph 08a2 Daily deaths, average median absolute error smoothed for better viewing

twoway ///
(line DDAbsErrDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Liechtenstein, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a2 Liechtenstein ALL MODELS C19 daily deaths average median absolute error smoothed.pdf", replace











***************************************************************
* graph 09a1 Daily deaths, average median percent error 

twoway ///
(line DDPerErrDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Liechtenstein, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a1 Liechtenstein ALL MODELS C19 daily deaths average median percent error.pdf", replace










***************************************************************
* graph 09a2 Daily deaths, average median percent error smoothed for better viewing

twoway ///
(line DDPerErrDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Liechtenstein, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a2 Liechtenstein ALL MODELS C19 daily deaths average median percent error smoothed.pdf", replace










***************************************************************
* graph 10a1 Daily deaths, average median absolute percent error 

twoway ///
(line DDAbPeErDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Liechtenstein, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a1 Liechtenstein ALL MODELS C19 daily deaths average median absolute percent error.pdf", replace 





***************************************************************
* graph 10a2 Daily deaths, average median absolute percent error smoothed for better viewing

twoway ///
(line DDAbPeErDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Liechtenstein, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a2 Liechtenstein ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf", replace








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

summ DDErrorLANL_Mean2, meanonly
local DDErrorLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorLANL_Mean2str
gen DDErrorLANL_Mean2str = `DDErrorLANL_Mean2str'
label var DDErrorLANL_Mean2str "DDErrorLANL Mean over calendar months of median error over updates string"




* graph 12a Daily deaths, Average of Mean Error over updates and calendar months

graph bar ///
(mean) DDErrorDELP_Mean2str /// 
(mean) DDErrorLANL_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Mean Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Mean Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Liechtenstein", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "LANL") size(small) row(1)) 

qui graph export "graph 12a Liechtenstein ALL MODELS C19 daily deaths Average Mean Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbsErr`model'_Mean2 for display

summ DDAbsErrDELP_Mean2, meanonly
local DDAbsErrDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrDELP_Mean2str
gen DDAbsErrDELP_Mean2str = `DDAbsErrDELP_Mean2str'
label var DDAbsErrDELP_Mean2str "DDAbsErrDELP Mean over calendar months of median error over updates string"

summ DDAbsErrLANL_Mean2, meanonly
local DDAbsErrLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrLANL_Mean2str
gen DDAbsErrLANL_Mean2str = `DDAbsErrLANL_Mean2str'
label var DDAbsErrLANL_Mean2str "DDAbsErrLANL Mean over calendar months of median error over updates string"




* graph 12b Daily deaths, Average of Absolute Error over updates and calendar months

graph bar ///
(mean) DDAbsErrDELP_Mean2str /// 
(mean) DDAbsErrLANL_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Liechtenstein", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "LANL") size(small) row(1)) 

qui graph export "graph 12b Liechtenstein ALL MODELS C19 daily deaths Average Absolute Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDPerErr`model'_Mean2 for display

summ DDPerErrDELP_Mean2, meanonly
local DDPerErrDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrDELP_Mean2str
gen DDPerErrDELP_Mean2str = `DDPerErrDELP_Mean2str'
label var DDPerErrDELP_Mean2str "DDPerErrDELP Mean over calendar months of median error over updates string"

summ DDPerErrLANL_Mean2, meanonly
local DDPerErrLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrLANL_Mean2str
gen DDPerErrLANL_Mean2str = `DDPerErrLANL_Mean2str'
label var DDPerErrLANL_Mean2str "DDPerErrLANL Mean over calendar months of median error over updates string"



* graph 12c Daily deaths, Average of Percent PerErr over updates and calendar months

graph bar ///
(mean) DDPerErrDELP_Mean2str /// 
(mean) DDPerErrLANL_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Liechtenstein", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "LANL") size(small) row(1)) 

qui graph export "graph 12c Liechtenstein ALL MODELS C19 daily deaths Average Percent Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbPeEr`model'_Mean2 for display

summ DDAbPeErDELP_Mean2, meanonly
local DDAbPeErDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErDELP_Mean2str
gen DDAbPeErDELP_Mean2str = `DDAbPeErDELP_Mean2str'
label var DDAbPeErDELP_Mean2str "DDAbPeErDELP Mean over calendar months of median error over updates string"

summ DDAbPeErLANL_Mean2, meanonly
local DDAbPeErLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErLANL_Mean2str
gen DDAbPeErLANL_Mean2str = `DDAbPeErLANL_Mean2str'
label var DDAbPeErLANL_Mean2str "DDAbPeErLANL Mean over calendar months of median error over updates string"



* graph 12d Daily deaths, Average of Absolute Percent Error over updates and calendar months

graph bar ///
(mean) DDAbPeErDELP_Mean2str /// 
(mean) DDAbPeErLANL_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Liechtenstein", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "LANL") size(small) row(1)) 

qui graph export "graph 12d Liechtenstein ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf", replace





qui compress

save "ALL MODELS Liechtenstein error.dta", replace





******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Liechtenstein error data dictionary.csv", replace 
	
restore









***********************************************
***********************************************

* graph all models across error measures


use "ALL MODELS Liechtenstein error.dta", clear

save "ALL MODELS Liechtenstein error - only models across error measures.dta", replace



keep *Mean2 


foreach var of varlist * {
	
	summ `var', meanonly
	
	qui replace `var' = r(mean)
}


keep in 1 


* get equal-length varnames before reshape // change Error to Errorr so that all Errorr, AbsErr, PerErr, and AbPeEr have same lenght (6 characters)
rename ///
(DDErrorDELP_Mean2 DDErrorLANL_Mean2) ///
(DDErrorrDELP_Mean2 DDErrorrLANL_Mean2) 




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

save "CovidLongitudinal Liechtenstein merge temp.dta", replace 


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
subtitle("Over updates and calendar months; forecast only; Liechtenstein", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "Error" 2 "Absolute error" 3 "Percent error" 4 "Absolute percent error" ) size(small) row(1)) 

qui graph export "graph 13a Liechtenstein ALL MODELS C19 daily deaths, models across error measures.pdf", replace


qui compress

save "ALL MODELS Liechtenstein error - only models across error measures.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Liechtenstein error - only models across error measures data dictionary.csv", replace 
	
restore






***********************************************
***********************************************

* graph all error measures across models


use "CovidLongitudinal Liechtenstein merge temp.dta", clear 


gen i = _n


* temp rename models from A1 to A7 and Error Measures to E1 to E4 for reshaping:

rename (DDErrorrDELP DDErrorrLANL) ///
       (DDA1E1 DDA2E1) 
label var DDA1E1 "Daily Deaths Error mean of medians over updates and calendar months DELP"
label var DDA2E1 "Daily Deaths Error mean of medians over updates and calendar months LANL"

	   
rename (DDAbsErrDELP DDAbsErrLANL) ///
       (DDA1E2 DDA2E2) 
label var DDA1E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months DELP"
label var DDA2E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months LANL"
	   
rename (DDPerErrDELP DDPerErrLANL) ///
       (DDA1E3 DDA2E3) 	   
label var DDA1E3 "Daily Deaths Percent Error mean of medians over updates and calendar months DELP"
label var DDA2E3 "Daily Deaths Percent Error mean of medians over updates and calendar months LANL"

rename (DDAbPeErDELP DDAbPeErLANL) ///
       (DDA1E4 DDA2E4) 
label var DDA1E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months DELP"
label var DDA2E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months LANL"

	   
reshape long DDA1 DDA2, i(i) j(E, string)

gen type = . 
label var type "Error measure type"
replace type = 1 if E == "E1"
replace type = 2 if E == "E2"
replace type = 3 if E == "E3"
replace type = 4 if E == "E4"


label define type 1 "Error" 2 "Absolute Error" 3 "Percent Error" 4 "Absolute % Error"
label values type type


qui compress


graph bar DDA1 DDA2, over(type) ///
bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average error measures") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths, average of error measures across models", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Liechtenstein", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "LANL") size(small) row(1)) 

qui graph export "graph 13b Liechtenstein ALL MODELS C19 daily deaths, error measures across models.pdf", replace





* reshape wide


drop type

reshape wide DDA1 DDA2, i(i) j(E, string)


rename (DDA1E1 DDA2E1) ///
       (DD_DELP_Errorr DD_LANL_Errorr)

label var DD_DELP_Errorr "Daily Deaths DELP Error mean of medians over updates and calendar months"
label var DD_LANL_Errorr "Daily Deaths LANL Error mean of medians over updates and calendar months"


rename (DDA1E2 DDA2E2) ///
       (DD_DELP_AbsErr DD_LANL_AbsErr)

label var DD_DELP_AbsErr "Daily Deaths DELP Absolute Error mean of medians over updates and calendar months"
label var DD_LANL_AbsErr "Daily Deaths LANL Absolute Error mean of medians over updates and calendar months"


rename (DDA1E3 DDA2E3) ///
       (DD_DELP_PerErr DD_LANL_PerErr)

label var DD_DELP_PerErr "Daily Deaths DELP Percent Error mean of medians over updates and calendar months"
label var DD_LANL_PerErr "Daily Deaths LANL Percent Error mean of medians over updates and calendar months"


rename (DDA1E4 DDA2E4) ///
(DD_DELP_AbPeEr DD_LANL_AbPeEr)

label var DD_DELP_AbPeEr "Daily Deaths DELP Absolute Percent Error mean of medians over updates and calendar months"
label var DD_LANL_AbPeEr "Daily Deaths LANL Absolute Percent Error mean of medians over updates and calendar months"



drop i

gen country = "Liechtenstein"

gen iso = "LIE"

order country iso

qui compress

save "ALL MODELS Liechtenstein error - only error measures across models.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Liechtenstein error - only error measures across models data dictionary.csv", replace 
	
restore







view "log CovidLongitudinal Liechtenstein 9 Merge.smcl"

log close

exit, clear
