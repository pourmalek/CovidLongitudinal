
clear all

cd "$pathCovidLongitudinal/countries/Saint Lucia"

capture log close 

log using "log CovidLongitudinal Saint Lucia 1 Process.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Saint Lucia 1 Process.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, UCLA, YYGU)
	* for each country ---->> Saint Lucia <<----                                                                 
***************************************************************************



**** "do CovidLongitudinal Saint Lucia 1 Process.do"
**** Get Daily deaths forecast only: DayDeaMeFo`model'update where `model' is DELP, IHME, IMPE, LANL, UCLA, YYGU


** input data files: "$pathCovidLongitudinal/download/`model'/`model' countries long.dta"
**                   "$pathCovidLongitudinal/download/JOHN"
**                   "$pathCovidLongitudinal/download/`model'"

** output data files: "`model' Saint Lucia.dta"
**                   "ALL MODLES Saint Lucia.dta"

** output data dictionary files: "Saint Lucia ALL MODELS update dates data dictionary.csv"
**                               "`model' Saint Lucia data dictionary.csv"
**                               "ALL MODLES Saint Lucia data dictionary.csv"

** graphs:
** "graph 02 Saint Lucia `model' C19 daily deaths all updates.pdf"
** "graph 02 Saint Lucia ALL MODELS C19 daily deaths all updates.pdf"




************************************************************************

* get update dates on which country available in each model


local list IMPE LANL

foreach model of local list {

	use "$pathCovidLongitudinal/download/`model'/`model' countries long.dta", clear 
	
	di in red "`model'" " Saint Lucia absent update_date_block"
	
	qui keep if loc_grand_name == "Saint Lucia"
	
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
	
	save "Saint Lucia `model' update dates.dta", replace

}
*






use "Saint Lucia IMPE update dates.dta", clear 

local list IMPE LANL

foreach model of local list {
	
	append using "Saint Lucia `model' update dates.dta"
	
	duplicates drop
	
}
*

save "Saint Lucia ALL MODELS update dates.dta", replace
	
export excel using "Saint Lucia ALL MODELS update dates.xlsx", replace firstrow(variables) 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "Saint Lucia ALL MODELS update dates data dictionary.csv", replace 
	
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

keep if loc_grand_name == "Saint Lucia"

keep date DayDeaMeSmJOHNLCA

label var date "calendar date"

qui compress

cd "$pathCovidLongitudinal/countries/Saint Lucia"

save "JOHN Saint Lucia.dta", replace 




* graph Saint Lucia JOHN daily deaths

twoway ///
(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Saint Lucia, JOHN", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Saint Lucia JOHN C19 daily deaths reported.pdf", replace








**************************************************************************

* DELP

* Saint Lucia not included in DELP










**************************************************************************

* IHME 

* Saint Lucia not included in IHME








**************************************************************************

* IMPE

local list ///
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
		
	keep if loc_grand_name == "Saint Lucia"

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
	
	cd "$pathCovidLongitudinal/countries/Saint Lucia"
	
	save "IMPE `update' Saint Lucia.dta", replace emptyok
	
	
	*

	
}
*




* merge updates

cd "$pathCovidLongitudinal/countries/Saint Lucia"

foreach update of local list {

	merge m:m date using "IMPE `update' Saint Lucia.dta"
	
	drop _merge

}
*	


capture drop fit_type death_calibrated v1 // IMPE extra vars 

qui compress

save "IMPE Saint Lucia.dta", replace




* add JOHN

merge m:1 date using "JOHN Saint Lucia.dta"

drop _merge

	drop if date < td(01jan2020)

	drop if date > td(01jan2023) 

qui compress

save "IMPE Saint Lucia.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "IMPE Saint Lucia data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph Saint Lucia IMPE daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoIMPE`update' date, sort lwidth(thin) lcolor(magenta)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, IMPE, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("Saint Lucia, forecast only") legend(position(6) order(1 "JOHN" 2 "IMPE forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 Saint Lucia IMPE daily deaths update `update'.pdf", replace	

}
*/




* graph Saint Lucia IMPE daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 
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
ytitle(Daily deaths) title("C19 daily deaths, Saint Lucia, IMPE, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "IMPE forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Saint Lucia IMPE C19 daily deaths all updates.pdf", replace















**************************************************************************

* LANL

local list ///
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
	
	keep if loc_grand_name == "Saint Lucia" 

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
	
	cd "$pathCovidLongitudinal/countries/Saint Lucia"
	
	save "LANL `update' Saint Lucia.dta", replace 
	

}
*





* merge updates

cd "$pathCovidLongitudinal/countries/Saint Lucia"

foreach update of local list {

	merge m:m date using "LANL `update' Saint Lucia.dta"
	
	drop _merge

}
*	

qui compress

save "LANL Saint Lucia.dta", replace




* add JOHN

merge m:1 date using "JOHN Saint Lucia.dta"

drop _merge

qui compress

save "LANL Saint Lucia.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "LANL Saint Lucia data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph Saint Lucia LANL daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoLANL`update' date, sort lwidth(thin) lcolor(brown)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, LANL, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("Saint Lucia, forecast only") legend(position(6) order(1 "JOHN" 2 "LANL forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 Saint Lucia LANL daily deaths update `update'.pdf", replace	

}
*/




* graph Saint Lucia LANL daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 
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
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Saint Lucia, LANL, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "LANL forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Saint Lucia LANL C19 daily deaths all updates.pdf", replace












**************************************************************************

* UCLA
* Saint Lucia not included in UCLA



**************************************************************************

* YYGU
* Saint Lucia not included in YYGU








*************************************************************

* merge models

local list IMPE LANL

use "IMPE Saint Lucia.dta", clear

foreach model of local list {

	merge m:m date loc_grand_name using "`model' Saint Lucia.dta", force
	
	drop _merge
	
	isid date loc_grand_name, missok
	
}
*

qui compress

save "ALL MODLES Saint Lucia.dta", replace



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODLES Saint Lucia data dictionary.csv", replace 
	
restore

	

	


* graph Saint Lucia ALL MODELS daily deaths all updates

twoway ///
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
(line DayDeaMeFoLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
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
(line DayDeaMeFoIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Saint Lucia, all models, all updates, forecast only", size(medium) color(black)) ///
legend(position(6) order(115 "JOHN" 1 "IMPE" 21 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Saint Lucia ALL MODELS C19 daily deaths all updates.pdf", replace

	






cd "$pathCovidLongitudinal/countries/Saint Lucia"


view "log CovidLongitudinal Saint Lucia 1 Process.smcl"

log close

exit, clear
