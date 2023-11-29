
clear all

cd "$pathCovidLongitudinal/countries/Fiji"

capture log close 

log using "log CovidLongitudinal Fiji 1 Process.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Fiji 1 Process.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)
	* for each country ---->> Fiji <<----                                                                 
***************************************************************************



**** "do CovidLongitudinal Fiji 1 Process.do"
**** Get Daily deaths forecast only: DayDeaMeFo`model'update where `model' is DELP, IHME, IMPE, LANL, UCLA, YYGU


** input data files: "$pathCovidLongitudinal/download/`model'/`model' countries long.dta"
**                   "$pathCovidLongitudinal/download/JOHN"
**                   "$pathCovidLongitudinal/download/`model'"

** output data files: "`model' Fiji.dta"
**                   "ALL MODLES Fiji.dta"

** output data dictionary files: "Fiji ALL MODELS update dates data dictionary.csv"
**                               "`model' Fiji data dictionary.csv"
**                               "ALL MODLES Fiji data dictionary.csv"

** graphs:
** "graph 02 Fiji `model' C19 daily deaths all updates.pdf"
** "graph 02 Fiji ALL MODELS C19 daily deaths all updates.pdf"




************************************************************************

* get update dates on which country available in each model


local list IHME IMPE LANL

foreach model of local list {

	use "$pathCovidLongitudinal/download/`model'/`model' countries long.dta", clear 
	
	di in red "`model'" " Fiji absent update_date_block"
	
	qui keep if loc_grand_name == "Fiji"
	
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
	
	save "Fiji `model' update dates.dta", replace

}
*






use "Fiji IHME update dates.dta", clear 

local list IHME IMPE LANL

foreach model of local list {
	
	append using "Fiji `model' update dates.dta"
	
	duplicates drop
	
}
*

save "Fiji ALL MODELS update dates.dta", replace
	
export excel using "Fiji ALL MODELS update dates.xlsx", replace firstrow(variables) 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "Fiji ALL MODELS update dates data dictionary.csv", replace 
	
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

keep if loc_grand_name == "Fiji"

keep date DayDeaMeSmJOHNFJI

label var date "calendar date"

qui compress

cd "$pathCovidLongitudinal/countries/Fiji"

save "JOHN Fiji.dta", replace 




* graph Fiji JOHN daily deaths

twoway ///
(line DayDeaMeSmJOHNFJI date, sort lwidth(thick) lcolor(cyan)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Fiji, JOHN", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Fiji JOHN C19 daily deaths reported.pdf", replace








**************************************************************************

* DELP

* Fiji not included in DELP










**************************************************************************

* IHME 


local list ///
20220218 ///
20220321 ///
20220408 ///
20220506 ///
20220610 ///
20220719 ///
20220912 ///
20221024 ///
20221118 ///
20221216


foreach update of local list {

	cd "$pathCovidLongitudinal/download/IHME"
	
	di in red "This is IHME update " `update'

	use "IHME all countries `update'.dta", clear
	
	rename location_name country
	
	keep if country == "Fiji" 
	
	duplicates drop
	
	capture drop counter one_or_two
	
	rename country loc_grand_name
	
	label var loc_grand_name "country"

	capture label var DayDeaMeRaIHME`update' "Daily deaths mean raw IHME" 

	label var DayDeaMeSmIHME`update' "Daily deaths mean smoothed IHME" 
	
	label var date "calendar date"
	

	
	* gen daily deaths // done in /code/downloads/IHME/do CovidLongitudinal IHME.do
	
	
	
	* smooth // done in /code/downloads/IHME/do CovidLongitudinal IHME.do
	
		

	
	
	* gen Daily deaths smooth forecast only
			
	clonevar DayDeaMeFoIHME`update' = DayDeaMeSmIHME`update' 
	
	label var DayDeaMeFoIHME`update' "Daily deaths mean smooth forecast only IHME"
	
	gen update_date`update' = date("`update'", "YMD")
	
	gen epoch`update' = update_date`update'
	
	replace DayDeaMeFoIHME`update' = . if date < update_date`update' 


	
	/* local epoch`update' = epoch`update' // for xline(`epoch202YNNDD',
	
	di %td `epoch`update''
	
	local wanted : di %td `epoch`update'' // for denoted with red line: `wanted'"
	
	
	* graph Fiji IHME daily deaths epoch each update 
	
	twoway ///
	(line DayDeaMeFoIHME`update' date, sort lwidth(thin) lcolor(black)) /// 
	if date >= td(01Jan2020) & loc_grand_name != "" ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.2fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, Fiji, IHME, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	xline(`epoch`update'', lwidth(thin) lcolor(red)) ///
	subtitle("forecast  start date is denoted with red line: `wanted'") ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	*/
	
	cd "$pathCovidLongitudinal/countries/Fiji"
	
	/* qui graph export "graph 00 Fiji IHME daily deaths epoch `update'.pdf", replace */
	
	capture drop location_id population_2022 population_2021 population_2020
	
	label var update_date`update' "update date"

	label var epoch`update' "epoch IHME"
	
	capture label var location_id "location id IHME"
	
	capture label var deaths_data_type "deaths data type IHME"
	
	merge m:1 date using "calendar.dta"
	
	drop _merge
	
	qui compress
	
	save "IHME `update' Fiji.dta", replace emptyok	
	


}
*












* merge updates

cd "$pathCovidLongitudinal/countries/Fiji"

foreach update of local list {

	merge m:m date using "IHME `update' Fiji.dta"
	
	drop _merge

}
*	

qui compress

save "IHME Fiji.dta", replace




* add JOHN

merge m:1 date using "JOHN Fiji.dta"

drop _merge

qui compress

save "IHME Fiji.dta", replace



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "IHME Fiji data dictionary.csv", replace 
	
restore



/* foreach update of local list {
	
	* graph Fiji IHME daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNFJI date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoIHME`update' date, sort lwidth(thin) lcolor(black)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, IHME, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("Fiji, forecast only") legend(position(6) order(1 "JOHN" 2 "IHME forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 Fiji IHME daily deaths update `update'.pdf", replace	

}
*/



* graph Fiji IHME daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNFJI date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Fiji, IHME, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "IHME forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Fiji IHME C19 daily deaths all updates.pdf", replace












**************************************************************************

* IMPE

local list ///
20200808 ///
20200810 ///
20200811 ///
20200813 ///
20200814 ///
20200817 ///
20200823 ///
20200825 ///
20200827 ///
20200831 ///
20200902 ///
20200906 ///
20200908 ///
20200912 ///
20200915 ///
20200919 ///
20200923 ///
20200925 ///
20201003 ///
20201006 ///
20201012 ///
20201019 ///
20201025 ///
20201028 ///
20201101 ///
20201110 ///
20201114 ///
20201118 ///
20201123 ///
20201129 ///
20201204 ///
20201212 ///
20201220 ///
20201226 ///
20210104 ///
20210110 ///
20210112 ///
20210118 ///
20210124 ///
20210130 ///
20210203 ///
20210210 ///
20210217 ///
20210226 ///
20210305 ///
20210312 ///
20210319 ///
20210329 ///
20210406 ///
20210417 ///
20210424 ///
20210510 ///
20210516 ///
20210522 ///
20210527 ///
20210604 ///
20210611 ///
20210618 ///
20210626 ///
20210702 ///
20210709 ///
20210719 ///
20210806 ///
20210819 ///
20210825 ///
20210909 ///
20210924 ///
20211006 ///
20211021 ///
20211027 ///
20211103 ///
20211115 ///
20211121 ///
20211129 ///
20211205 ///
20211213 ///
20211226 ///
20220102 ///
20220120 ///
20220131 ///
20220315 ///
20220530 ///
20220620 ///
20220703 ///
20220712 ///
20220728 ///
20220808 ///
20220901 ///
20221225


foreach update of local list {

	cd "$pathCovidLongitudinal/download/IMPE"
	
	di in red "This is IMPE update " `update'

	use "IMPE `update'.dta", clear
		
	keep if loc_grand_name == "Fiji"

	duplicates drop
		
	
	
	
	* gen daily deaths // done in /code/downloads/IMPE/do CovidLongitudinal IMPE.do
	
	
	
	
	* smooth
		
	sort date
			
	qui tsset date, daily   
			
	qui tssmooth ma DayDeaMeRaIMPE`update'_window = DayDeaMeRaIMPE`update' if DayDeaMeRaIMPE`update' >= 0, window(3 1 3) 

	qui tssmooth ma DayDeaMeSmIMPE`update' = DayDeaMeRaIMPE`update'_window, weights( 1 2 3 <4> 3 2 1) replace

	drop *_window
	
	label var DayDeaMeSmIMPE`update' "Daily deaths mean smooth IMPE" 
	
	
	
	
	* gen Daily deaths smooth forecast only
			
	clonevar DayDeaMeFoIMPE`update' = DayDeaMeSmIMPE`update' 
	
	label var DayDeaMeFoIMPE`update' "Daily deaths smooth mean forecast only IMPE"
		
	gen update_date`update' = date("`update'", "YMD")
				
	qui replace DayDeaMeFoIMPE`update' = . if date < update_date`update' 
	
	
	
	capture drop fit_type death_calibrated v1
	
	label var loc_grand_name "country"
	
	label var date "calendar date"
	
	label var DayDeaMeRaIMPE`update' "Daily deaths mean raw IMPE"
	
	label var DayDeaMeSmIMPE`update' "Daily deaths mean smooth IMPE"
	
	label var DayDeaMeFoIMPE`update' "Daily deaths mean smooth forecast only IMPE"
	
	label var update_date`update' "update date"
	
	
	
	
	
	qui compress	
	
	cd "$pathCovidLongitudinal/countries/Fiji"
	
	save "IMPE `update' Fiji.dta", replace emptyok
	
	
	*

	
}
*




* merge updates

cd "$pathCovidLongitudinal/countries/Fiji"

foreach update of local list {

	merge m:m date using "IMPE `update' Fiji.dta"
	
	drop _merge

}
*	


capture drop fit_type death_calibrated v1 // IMPE extra vars 

qui compress

save "IMPE Fiji.dta", replace




* add JOHN

merge m:1 date using "JOHN Fiji.dta"

drop _merge

	drop if date < td(01jan2020)

	drop if date > td(01jan2023) 

qui compress

save "IMPE Fiji.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "IMPE Fiji data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph Fiji IMPE daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNFJI date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoIMPE`update' date, sort lwidth(thin) lcolor(magenta)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, IMPE, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("Fiji, forecast only") legend(position(6) order(1 "JOHN" 2 "IMPE forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 Fiji IMPE daily deaths update `update'.pdf", replace	

}
*/




* graph Fiji IMPE daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNFJI date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Fiji, IMPE, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "IMPE forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Fiji IMPE C19 daily deaths all updates.pdf", replace















**************************************************************************

* LANL

local list ///
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
	
	keep if loc_grand_name == "Fiji" 

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
	
	cd "$pathCovidLongitudinal/countries/Fiji"
	
	save "LANL `update' Fiji.dta", replace 
	

}
*





* merge updates

cd "$pathCovidLongitudinal/countries/Fiji"

foreach update of local list {

	merge m:m date using "LANL `update' Fiji.dta"
	
	drop _merge

}
*	

qui compress

save "LANL Fiji.dta", replace




* add JOHN

merge m:1 date using "JOHN Fiji.dta"

drop _merge

qui compress

save "LANL Fiji.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "LANL Fiji data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph Fiji LANL daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNFJI date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoLANL`update' date, sort lwidth(thin) lcolor(brown)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, LANL, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("Fiji, forecast only") legend(position(6) order(1 "JOHN" 2 "LANL forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 Fiji LANL daily deaths update `update'.pdf", replace	

}
*/




* graph Fiji LANL daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNFJI date, sort lwidth(thick) lcolor(cyan)) /// 
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
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Fiji, LANL, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "LANL forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Fiji LANL C19 daily deaths all updates.pdf", replace













**************************************************************************

* UCLA
* Fiji not included in UCLA



**************************************************************************

* YYGU
* Fiji not included in YYGU








*************************************************************

* merge models

local list IHME IMPE LANL

use "IHME Fiji.dta", clear

foreach model of local list {

	merge m:m date loc_grand_name using "`model' Fiji.dta", force
	
	drop _merge
	
	isid date loc_grand_name, missok
	
}
*

qui compress

save "ALL MODLES Fiji.dta", replace



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODLES Fiji data dictionary.csv", replace 
	
restore

	

	


* graph Fiji ALL MODELS daily deaths all updates

twoway ///
(line DayDeaMeFoIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeSmJOHNFJI date, sort lwidth(thick) lcolor(cyan)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Fiji, all models, all updates, forecast only", size(medium) color(black)) ///
legend(position(6) order(113 "JOHN" 94 "IHME" 1 "IMPE" 61 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Fiji ALL MODELS C19 daily deaths all updates.pdf", replace

	






cd "$pathCovidLongitudinal/countries/Fiji"


view "log CovidLongitudinal Fiji 1 Process.smcl"

log close

exit, clear
