
clear all

cd "$pathCovidLongitudinal/countries/Liechtenstein"

capture log close 

log using "log CovidLongitudinal Liechtenstein 1 Process.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Liechtenstein 1 Process.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)
	* for each country ---->> Liechtenstein <<----                                                                 
***************************************************************************



**** "do CovidLongitudinal Liechtenstein 1 Process.do"
**** Get Daily deaths forecast only: DayDeaMeFo`model'update where `model' is DELP, IHME, IMPE, LANL, UCLA, YYGU


** input data files: "$pathCovidLongitudinal/download/`model'/`model' countries long.dta"
**                   "$pathCovidLongitudinal/download/JOHN"
**                   "$pathCovidLongitudinal/download/`model'"

** output data files: "`model' Liechtenstein.dta"
**                   "ALL MODLES Liechtenstein.dta"

** output data dictionary files: "Liechtenstein ALL MODELS update dates data dictionary.csv"
**                               "`model' Liechtenstein data dictionary.csv"
**                               "ALL MODLES Liechtenstein data dictionary.csv"

** graphs:
** "graph 02 Liechtenstein `model' C19 daily deaths all updates.pdf"
** "graph 02 Liechtenstein ALL MODELS C19 daily deaths all updates.pdf"




************************************************************************

* get update dates on which country available in each model


local list DELP LANL

foreach model of local list {

	use "$pathCovidLongitudinal/download/`model'/`model' countries long.dta", clear 
	
	di in red "`model'" " Liechtenstein absent update_date_block"
	
	qui keep if loc_grand_name == "Liechtenstein"
	
	keep if absent == 0
	
	gen model = "`model'"
	
	order model
	
	di "`model'"
	
	di in red `r(N)'
	
	keep model loc_grand_name absent update_date_block
	
	order model loc_grand_name absent update_date_block
	
	tostring update_date_block, gen(update_date_block_string)
	
	gen slash = " ///"
	
	gen update_date_block_slash = update_date_block_string + slash
	
	drop slash
	
	label var model "epidemic model being studied"
	
	label var loc_grand_name "country"
	
	label var absent "this country is absent in this model update"
	
	label var update_date_block "update date block"
	
	label var update_date_block_string "update date block string"
	
	label var update_date_block_slash "update date block slash"

	qui compress
	
	save "Liechtenstein `model' update dates.dta", replace

}
*






use "Liechtenstein DELP update dates.dta", clear 

local list DELP LANL

foreach model of local list {
	
	append using "Liechtenstein `model' update dates.dta"
	
	duplicates drop
	
}
*

save "Liechtenstein ALL MODELS update dates.dta", replace
	
export excel using "Liechtenstein ALL MODELS update dates.xlsx", replace firstrow(variables) 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "Liechtenstein ALL MODELS update dates data dictionary.csv", replace 
	
restore







*********************
grstyle init

grstyle color background white







*********************
* gen calendar file

clear

di td(01jan2020) // 21915

di td(01jan2024) // 23376

di td(01jan2024) - td(01jan2020) + 1 // 732



set obs 1462

gen date = .

replace date = 21915 in 1

replace date = date[_n-1] + 1 in 2/l

replace date = date[_n-1] + 1 in 2/1462

format date %tdDDMonCCYY

codebook date

save "calendar.dta", replace







**************************************************************************

* JOHN

cd "$pathCovidLongitudinal/download/JOHN"

use "CovidLongitudinal JOHN.dta", clear 

keep if loc_grand_name == "Liechtenstein"

keep date DayDeaMeSmJOHNLIE

label var date "calendar date"

qui compress

cd "$pathCovidLongitudinal/countries/Liechtenstein"

save "JOHN Liechtenstein.dta", replace 




* graph Liechtenstein JOHN daily deaths

twoway ///
(line DayDeaMeSmJOHNLIE date, sort lwidth(thick) lcolor(cyan)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Liechtenstein, JOHN", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Liechtenstein JOHN C19 daily deaths reported.pdf", replace








**************************************************************************

* DELP

local list ///
20200912 ///
20200926 ///
20201008 ///
20201022 ///
20201105 ///
20201119 ///
20201203 ///
20201217 ///
20201231 ///
20210114 ///
20210128 ///
20210211 ///
20210225 ///
20210311 ///
20210325 ///
20210408 ///
20210422 ///
20210506 ///
20210520 ///
20210603 ///
20210610 ///
20210617 ///
20210624 ///
20210701 ///
20210708 ///
20210715 ///
20210722 ///
20210729 ///
20210805 ///
20210812 ///
20210819 ///
20210826 ///
20210902 ///
20210909 ///
20210916 ///
20210923 ///
20210930 ///
20211007 ///
20211014 ///
20211021 ///
20211028 ///
20211104 ///
20211111 ///
20211118 ///
20211125 ///
20211202 ///
20211209 ///
20211216 ///
20211223 ///
20211230 ///
20220106 ///
20220113 ///
20220114 ///
20220115 ///
20220116 ///
20220117 ///
20220118 ///
20220119 ///
20220120 ///
20220121 ///
20220122 ///
20220123 ///
20220124 ///
20220125 ///
20220126 ///
20220127 ///
20220128 ///
20220129 ///
20220130 ///
20220131 ///
20220201 ///
20220202 ///
20220203 ///
20220204 ///
20220205 ///
20220206 ///
20220207 ///
20220208 ///
20220209 ///
20220210 ///
20220211 ///
20220212 ///
20220213 ///
20220214 ///
20220215 ///
20220216 ///
20220217 ///
20220218 ///
20220219 ///
20220220 ///
20220221 ///
20220222 ///
20220223 ///
20220224 ///
20220225 ///
20220226 ///
20220227 ///
20220228 ///
20220301 ///
20220302 ///
20220303 ///
20220304 ///
20220305 ///
20220306 ///
20220307 ///
20220308 ///
20220309 ///
20220310 ///
20220311 ///
20220312 ///
20220313 ///
20220314 ///
20220315 ///
20220316 ///
20220317 ///
20220318 ///
20220319 ///
20220320 ///
20220321 ///
20220322 ///
20220323 ///
20220324 ///
20220325 ///
20220326 ///
20220327 ///
20220328 ///
20220329 ///
20220330 ///
20220331 ///
20220401 ///
20220402 ///
20220403 ///
20220404 ///
20220405 ///
20220406 ///
20220407 ///
20220408 ///
20220409 ///
20220410 ///
20220411 ///
20220412 ///
20220413 ///
20220414 ///
20220415 ///
20220416 ///
20220417 ///
20220418 ///
20220419 ///
20220420 ///
20220421 ///
20220422 ///
20220423 ///
20220424 ///
20220425 ///
20220426 ///
20220427 ///
20220428 ///
20220429 ///
20220430 ///
20220501 ///
20220502 ///
20220503 ///
20220504 ///
20220505 ///
20220506 ///
20220507 ///
20220508 ///
20220509 ///
20220510 ///
20220511 ///
20220512 ///
20220513 ///
20220514 ///
20220515 ///
20220516 ///
20220517 ///
20220518 ///
20220519 ///
20220520 ///
20220521 ///
20220522 ///
20220523 ///
20220524 ///
20220525 ///
20220526 ///
20220527 ///
20220528 ///
20220529 ///
20220530 ///
20220531 ///
20220601 ///
20220602 ///
20220603 ///
20220604 ///
20220605 ///
20220606 ///
20220607 ///
20220608 ///
20220609 ///
20220610 ///
20220611 ///
20220612 ///
20220613 ///
20220614 ///
20220615 ///
20220616 ///
20220617 ///
20220618 ///
20220619 ///
20220620 ///
20220621 ///
20220622 ///
20220623 ///
20220624 ///
20220625 ///
20220626 ///
20220627 ///
20220628 ///
20220629 ///
20220630 ///
20220701 ///
20220702 ///
20220703 ///
20220704 ///
20220705 ///
20220706 ///
20220707 ///
20220708 ///
20220709 ///
20220710 ///
20220711 ///
20220712 ///
20220713 ///
20220714 ///
20220715 ///
20220716 ///
20220717 ///
20220718 ///
20220719 ///
20220720 ///
20220721 ///
20220722 ///
20220723 ///
20220724 ///
20220725 ///
20220726 ///
20220727 ///
20220728 ///
20220729 ///
20220730 ///
20220731 ///
20220801 ///
20220802 ///
20220803 ///
20220804 ///
20220805 ///
20220806 ///
20220807 ///
20220808 ///
20220809 ///
20220810 ///
20220811 ///
20220812 ///
20220813 ///
20220814 ///
20220815 ///
20220816 ///
20220817 ///
20220818 ///
20220819 ///
20220820 ///
20220821 ///
20220822 ///
20220823 ///
20220824 ///
20220825 ///
20220826 ///
20220827 ///
20220828 ///
20220829 ///
20220830 ///
20220831 ///
20220901 ///
20220902 ///
20220903 ///
20220904 ///
20220905 ///
20220906 ///
20220907 ///
20220908 ///
20220909 ///
20220910 ///
20220911 ///
20220912 ///
20220913 ///
20220914 ///
20220915


foreach update of local list {
	 	
	cd "$pathCovidLongitudinal/download/DELP"
	
	di in red "This is DELP update " `update'

	use "CovidLongitudinal DELP `update'.dta", clear
	
	keep if loc_grand_name == "Liechtenstein" 

	duplicates drop		
	
	
	
	* gen daily deaths
		
	gen DayDeaMeRaDELP`update' =  TotDeaMeRaDELP`update'[_n] - TotDeaMeRaDELP`update'[_n-1] 
	
	label var DayDeaMeRaDELP`update' "Daily deaths mean raw DELP"
	
	drop TotDeaMeRaDELP`update' 
	
	
	
	
	* smooth
	
	sort loc_grand_name date
	
	qui tsset date, daily   
			
	qui tssmooth ma DayDeaMeRaDELP`update'_window = DayDeaMeRaDELP`update' if DayDeaMeRaDELP`update' >= 0, window(3 1 3) 

	qui tssmooth ma DayDeaMeSmDELP`update' = DayDeaMeRaDELP`update'_window, weights( 1 2 3 <4> 3 2 1) replace

	drop *_window
	
	label var DayDeaMeSmDELP`update' "Daily deaths mean smooth DELP" 
	
	
	
	* gen Daily deaths smooth forecast only 
			
	clonevar DayDeaMeFoDELP`update' = DayDeaMeSmDELP`update' 
	
	label var DayDeaMeFoDELP`update' "Daily deaths mean smooth forecast only DELP"
				
	replace DayDeaMeFoDELP`update' = . if date < update_date`update' 

	
	
	
	cd "$pathCovidLongitudinal/countries/Liechtenstein"
	
	
	merge m:1 date using "calendar.dta"
	
	drop _merge
	
	qui compress
	
	save "DELP `update' Liechtenstein.dta", replace 

}
*




* merge updates

cd "$pathCovidLongitudinal/countries/Liechtenstein"

foreach update of local list {

	merge m:m date using "DELP `update' Liechtenstein.dta"
	
	drop _merge

}
*	

qui compress

save "DELP Liechtenstein.dta", replace




* add JOHN

merge m:m date using "JOHN Liechtenstein.dta"

drop _merge

qui compress

save "DELP Liechtenstein.dta", replace



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "DELP Liechtenstein data dictionary.csv", replace 
	
restore



/* foreach update of local list {
	
	* graph Liechtenstein DELP daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNLIE date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoDELP`update' date, sort lwidth(thin) lcolor(red)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, DELP, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("Liechtenstein, forecast only") legend(position(6) order(1 "JOHN" 2 "DELP forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 Liechtenstein DELP daily deaths update `update'.pdf", replace	

}
*/




* graph Liechtenstein DELP daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNLIE date, sort lwidth(thick) lcolor(cyan)) ///
(line DayDeaMeFoDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Liechtenstein, DELP, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "DELP forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Liechtenstein DELP C19 daily deaths all updates.pdf", replace














**************************************************************************

* IHME 

* Liechtenstein not included in IHME





**************************************************************************

* IMPE

* Liechtenstein not included in IMPE







**************************************************************************

* LANL

local list ///
20201213 ///
20201216 ///
20201220 ///
20201223 ///
20210103 ///
20210105 ///
20210110 ///
20210113 ///
20210117 ///
20210120 ///
20210124 ///
20210127 ///
20210131 ///
20210203 ///
20210207 ///
20210210 ///
20210214 ///
20210217 ///
20210221 ///
20210224 ///
20210228 ///
20210303 ///
20210307 ///
20210310 ///
20210314 ///
20210321 ///
20210324 ///
20210328 ///
20210331 ///
20210404 ///
20210407 ///
20210411 ///
20210414 ///
20210418 ///
20210421 ///
20210425 ///
20210428 ///
20210502 ///
20210505 ///
20210509 ///
20210512 ///
20210516 ///
20210519 ///
20210523 ///
20210526 ///
20210602 ///
20210606 ///
20210613 ///
20210620 ///
20210627 ///
20210704 ///
20210711 ///
20210718 ///
20210725 ///
20210801 ///
20210808 ///
20210815 ///
20210822 ///
20210829 ///
20210905 ///
20210912 ///
20210919 ///
20210926



foreach update of local list {

	cd "$pathCovidLongitudinal/download/LANL"
	
	di in red "This is LANL update " `update'

	use "CovidLongitudinal LANL `update'.dta", clear
	
	keep if loc_grand_name == "Liechtenstein" 

	duplicates drop
		
	
	
	
	* gen daily deaths // done in /code/downloads/LANL/do CovidLongitudinal LANL.do
	
	
	
	* smooth
		
	sort loc_grand_name date
			
	qui tsset date, daily   
			        
	qui tssmooth ma DayDeaMeRaLANL`update'_window = DayDeaMeRaLANL`update' if DayDeaMeRaLANL`update' >= 0, window(3 1 3) 

	qui tssmooth ma DayDeaMeSmLANL`update' = DayDeaMeRaLANL`update'_window, weights( 1 2 3 <4> 3 2 1) replace

	drop *_window
	
	label var DayDeaMeSmLANL`update' "Daily deaths mean smooth LANL" 
	
	
	
	
	* gen Daily deaths smooth forecast only 
				
	clonevar DayDeaMeFoLANL`update' = DayDeaMeSmLANL`update' 
	
	label var DayDeaMeFoLANL`update' "Daily deaths mean smooth forecast only LANL"
	
	gen update_date`update' = date("`update'", "YMD")
			
	replace DayDeaMeFoLANL`update' = . if date < update_date`update' 
	
	
	
	label var date "calendar date"
	
	label var DayDeaMeRaLANL`update' "Daily deaths mean raw LANL"
	
	label var loc_grand_name "country"
	
	label var date "calendar date"
	
	label var update_date`update' "update date"
	
	qui compress	
	
	cd "$pathCovidLongitudinal/countries/Liechtenstein"
	
	save "LANL `update' Liechtenstein.dta", replace 
	

}
*





* merge updates

cd "$pathCovidLongitudinal/countries/Liechtenstein"

foreach update of local list {

	merge m:m date using "LANL `update' Liechtenstein.dta"
	
	drop _merge

}
*	

qui compress

save "LANL Liechtenstein.dta", replace




* add JOHN

merge m:1 date using "JOHN Liechtenstein.dta"

drop _merge

qui compress

save "LANL Liechtenstein.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "LANL Liechtenstein data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph Liechtenstein LANL daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNLIE date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoLANL`update' date, sort lwidth(thin) lcolor(brown)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, LANL, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("Liechtenstein, forecast only") legend(position(6) order(1 "JOHN" 2 "LANL forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 Liechtenstein LANL daily deaths update `update'.pdf", replace	

}
*/




* graph Liechtenstein LANL daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNLIE date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Liechtenstein, LANL, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "LANL forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Liechtenstein LANL C19 daily deaths all updates.pdf", replace













**************************************************************************

* UCLA
* Liechtenstein not included in UCLA



**************************************************************************

* YYGU
* Liechtenstein not included in YYGU








*************************************************************

* merge models

local list LANL

use "DELP Liechtenstein.dta", clear

foreach model of local list {

	merge m:m date loc_grand_name using "`model' Liechtenstein.dta", force
	
	drop _merge
	
	isid date loc_grand_name, missok
	
}
*

qui compress

save "ALL MODLES Liechtenstein.dta", replace



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODLES Liechtenstein data dictionary.csv", replace 
	
restore

	

	


* graph Liechtenstein ALL MODELS daily deaths all updates

twoway ///
(line DayDeaMeFoDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNLIE date, sort lwidth(thick) lcolor(cyan)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Liechtenstein, all models, all updates, forecast only", size(medium) color(black)) ///
legend(position(6) order(361 "JOHN" 1 "DELP" 8 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Liechtenstein ALL MODELS C19 daily deaths all updates.pdf", replace

	






cd "$pathCovidLongitudinal/countries/Liechtenstein"


view "log CovidLongitudinal Liechtenstein 1 Process.smcl"

log close

exit, clear
