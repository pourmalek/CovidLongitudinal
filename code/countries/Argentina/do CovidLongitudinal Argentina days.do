
clear all

cd "$pathCovidLongitudinal/countries/Argentina"

capture log close 

log using "log CovidLongitudinal Argentina days.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Argentina days.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Assess the number of forecast days into future by models
	* for each country ---->> Argentina <<----                                                                 
***************************************************************************


* Assess the number of forecast days into future by models, create graphs



** input data files: "Argentina `model' days.dta" 

** output data files: "Argentina days.dta"





* gen calendar file

clear

di td(01jan2020) // 21915

di td(01jan2023) // 23011

di td(01jan2023) - td(01jan2020) + 1 // 1097



set obs 1097

gen date = .

replace date = 21915 in 1

replace date = date[_n-1] + 1 in 2/l

replace date = date[_n-1] + 1 in 2/732

format date %tdDDMonCCYY

codebook date

save "calendar.dta", replace 


*

grstyle init

grstyle color background white


ssc install fillmissing





* DELP 

use "Argentina DELP days.dta", clear

fillmissing loc_grand_name

keep loc_grand_name *_days

keep in 1

gen i = _n

foreach var in DayDeaMeFoDELP20200417_days-DayDeaMeFoDELP20220915_days {
	
	renvars `var', trim(22)

}
*


reshape long DayDeaMeFoDELP, i(i) j(j)

drop i

rename j DELP_update
label var DELP_update "DELP update date"

rename DayDeaMeFoDELP DELP_days
label var DELP_days "DELP forecast days"

gen DELP_update_num = _n
label var DELP_update_num "DELP update number"


* gen calendar date 

clonevar this = DELP_update

tostring this, replace

gen date = date(this, "YMD")

drop this

format date %tdDDMonCCYY
codebook date


merge 1:1 date using "calendar.dta"

drop _merge

order date

sort date


save "Argentina DELP days long.dta", replace



* graph forecast days

twoway (connected DELP_days DELP_update_num, sort) ///
, xtitle(Update number) xlabel(, grid) xlabel(, grid) ///
ytitle(Forecast days) title("C19 daily deaths, Argentina, DELP model, forecast days, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

graph export "graph 201 C19 daily deaths, Argentina, DELP model, forecast days, all updates.pdf", replace


summ DELP_days

tabstat DELP_days, ///
columns(statistics) statistics(mean sd median iqr min max r n) varwidth(16) 


histogram DELP_days ///
, xtitle(Forecast days) ///
title("C19 daily deaths, Argentina, DELP model, forecast days, all updates", size(medium) color(black)) 

graph export "graph 201 b C19 daily deaths, Argentina, DELP model, forecast days, all updates histogram.pdf", replace






* IHME 

use "Argentina IHME days.dta", clear

fillmissing loc_grand_name

keep loc_grand_name *_days

keep in 1

gen i = _n

foreach var in DayDeaMeFoIHME20200512_days-DayDeaMeFoIHME20221216_days {
	
	renvars `var', trim(22)

}
*


reshape long DayDeaMeFoIHME, i(i) j(j)

drop i


rename j IHME_update
label var IHME_update "IHME update date"

rename DayDeaMeFoIHME IHME_days
label var IHME_days "IHME forecast days"

gen IHME_update_num = _n
label var IHME_update_num "IHME update number"

* gen calendar date 

clonevar this = IHME_update

tostring this, replace

gen date = date(this, "YMD")

drop this

format date %tdDDMonCCYY
codebook date


merge 1:1 date using "calendar.dta"

drop _merge

order date

sort date

save "Argentina IHME days long.dta", replace



* graph forecast days

twoway (connected IHME_days IHME_update_num, sort) ///
, xtitle(Update number) xlabel(, grid) xlabel(, grid) ///
ytitle(Forecast days) title("C19 daily deaths, Argentina, IHME model, forecast days, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

graph export "graph 202 C19 daily deaths, Argentina, IHME model, forecast days, all updates.pdf", replace


* Exclude the last three updates for IHME Argentina from descriptives of Forecast days 
* because they extended beyond 23-01-01


summ IHME_days if IHME_update_num < 85

tabstat IHME_days if IHME_update_num < 85, ///
columns(statistics) statistics(mean sd median iqr min max r n) varwidth(16) 


histogram IHME_days if IHME_update_num < 85 ///
, xtitle(Forecast days) ///
title("C19 daily deaths, Argentina, IHME model, forecast days, all updates", size(medium) color(black)) 

graph export "graph 202 b C19 daily deaths, Argentina, IHME model, forecast days, all updates histogram.pdf", replace





* IMPE 

use "Argentina IMPE days.dta", clear

fillmissing loc_grand_name

keep loc_grand_name *_days

keep in 1

gen i = _n

foreach var in DayDeaMeFoIMPE20200428_days-DayDeaMeFoIMPE20221225_days {
	
	renvars `var', trim(22)

}
*


reshape long DayDeaMeFoIMPE, i(i) j(j)

drop i


rename j IMPE_update
label var IMPE_update "IMPE update date"

rename DayDeaMeFoIMPE IMPE_days
label var IMPE_days "IMPE forecast days"

gen IMPE_update_num = _n
label var IMPE_update_num "IMPE update number"

* gen calendar date 

clonevar this = IMPE_update

tostring this, replace

gen date = date(this, "YMD")

drop this

format date %tdDDMonCCYY
codebook date


merge 1:1 date using "calendar.dta"

drop _merge

order date

sort date


save "Argentina IMPE days long.dta", replace



* graph forecast days

twoway (connected IMPE_days IMPE_update_num, sort) ///
, xtitle(Update number) xlabel(, grid) xlabel(, grid) ///
ytitle(Forecast days) title("C19 daily deaths, Argentina, IMPE model, forecast days, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

graph export "graph 203 C19 daily deaths, Argentina, IMPE model, forecast days, all updates.pdf", replace




* Exclude the last update for IMPE Argentina from descriptives of Forecast days 
* because that update extended beyond 23-01-01

summ IMPE_days if IMPE_update_num < 148

tabstat IMPE_days if IMPE_update_num < 148, ///
columns(statistics) statistics(mean sd median iqr min max r n) varwidth(16) 


histogram IMPE_days if IMPE_update_num < 148 ///
, xtitle(Forecast days) ///
title("C19 daily deaths, Argentina, IMPE model, forecast days, all updates", size(medium) color(black)) 

graph export "graph 203 b C19 daily deaths, Argentina, IMPE model, forecast days, all updates histogram.pdf", replace





* LANL 

use "Argentina LANL days.dta", clear

fillmissing loc_grand_name

keep loc_grand_name *_days

keep in 1

gen i = _n

foreach var in DayDeaMeFoLANL20200426_days-DayDeaMeFoLANL20210926_days {
	
	renvars `var', trim(22)

}
*


reshape long DayDeaMeFoLANL, i(i) j(j)

drop i

rename j LANL_update
label var LANL_update "LANL update date"

rename DayDeaMeFoLANL LANL_days
label var LANL_days "LANL forecast days"

gen LANL_update_num = _n
label var LANL_update_num "LANL update number"

* gen calendar date 

clonevar this = LANL_update

tostring this, replace

gen date = date(this, "YMD")

drop this

format date %tdDDMonCCYY
codebook date


merge 1:1 date using "calendar.dta"

drop _merge

order date

sort date

save "Argentina LANL days long.dta", replace



* graph forecast days

twoway (connected LANL_days LANL_update_num, sort) ///
, xtitle(Update number) xlabel(, grid) xlabel(, grid) ///
ytitle(Forecast days) title("C19 daily deaths, Argentina, LANL model, forecast days, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

graph export "graph 204 C19 daily deaths, Argentina, LANL model, forecast days, all updates.pdf", replace




summ LANL_days

tabstat LANL_days, ///
columns(statistics) statistics(mean sd median iqr min max r n) varwidth(16) 


histogram LANL_days ///
, xtitle(Forecast days) ///
title("C19 daily deaths, Argentina, LANL model, forecast days, all updates", size(medium) color(black)) 

graph export "graph 204 b C19 daily deaths, Argentina, LANL model, forecast days, all updates histogram.pdf", replace






* UCLA 

use "Argentina UCLA days.dta", clear

fillmissing loc_grand_name

keep loc_grand_name *_days

keep in 1

gen i = _n

foreach var in DayDeaMeFoUCLA20210103_days-DayDeaMeFoUCLA20211220_days  {
	
	renvars `var', trim(22)

}
*


reshape long DayDeaMeFoUCLA, i(i) j(j)

drop i

rename j UCLA_update
label var UCLA_update "UCLA update date"

rename DayDeaMeFoUCLA UCLA_days
label var UCLA_days "UCLA forecast days"

gen UCLA_update_num = _n
label var UCLA_update_num "UCLA update number"

* gen calendar date 

clonevar this = UCLA_update

tostring this, replace

gen date = date(this, "YMD")

drop this

format date %tdDDMonCCYY
codebook date


merge 1:1 date using "calendar.dta"

drop _merge

order date

sort date

save "Argentina UCLA days long.dta", replace



* graph forecast days

twoway (connected UCLA_days UCLA_update_num, sort) ///
, xtitle(Update number) xlabel(, grid) xlabel(, grid) ///
ytitle(Forecast days) title("C19 daily deaths, Argentina, UCLA model, forecast days, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

graph export "graph 205 C19 daily deaths, Argentina, UCLA model, forecast days, all updates.pdf", replace




summ UCLA_days

tabstat UCLA_days, ///
columns(statistics) statistics(mean sd median iqr min max r n) varwidth(16) 


histogram UCLA_days ///
, xtitle(Forecast days) ///
title("C19 daily deaths, Argentina, UCLA model, forecast days, all updates", size(medium) color(black)) 

graph export "graph 205 b C19 daily deaths, Argentina, UCLA model, forecast days, all updates histogram.pdf", replace





* YYGU 

use "Argentina YYGU days.dta", clear

fillmissing loc_grand_name

keep loc_grand_name *_days

keep in 1

gen i = _n

foreach var in DayDeaMeFoYYGU20200512_days-DayDeaMeFoYYGU20201005_days  {
	
	renvars `var', trim(22)

}
*


reshape long DayDeaMeFoYYGU, i(i) j(j)

drop i

rename j YYGU_update
label var YYGU_update "YYGU update date"

rename DayDeaMeFoYYGU YYGU_days
label var YYGU_days "YYGU forecast days"

gen YYGU_update_num = _n
label var YYGU_update_num "YYGU update number"

* gen calendar date 

clonevar this = YYGU_update

tostring this, replace

gen date = date(this, "YMD")

drop this

format date %tdDDMonCCYY
codebook date


merge 1:1 date using "calendar.dta"

drop _merge

order date

sort date


save "Argentina YYGU days long.dta", replace



* graph forecast days

twoway (connected YYGU_days YYGU_update_num, sort) ///
, xtitle(Update number) xlabel(, grid) xlabel(, grid) ///
ytitle(Forecast days) title("C19 daily deaths, Argentina, YYGU model, forecast days, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

graph export "graph 206 C19 daily deaths, Argentina, YYGU model, forecast days, all updates.pdf", replace



summ YYGU_days

tabstat YYGU_days, ///
columns(statistics) statistics(mean sd median iqr min max r n) varwidth(16) 


histogram YYGU_days ///
, xtitle(Forecast days) ///
title("C19 daily deaths, Argentina, YYGU model, forecast days, all updates", size(medium) color(black)) 

graph export "graph 206 b C19 daily deaths, Argentina, YYGU model, forecast days, all updates histogram.pdf", replace





use "Argentina DELP days long.dta", clear 

merge 1:1 date using "Argentina IHME days long.dta"

drop _merge

merge 1:1 date using "Argentina IMPE days long.dta"

drop _merge

merge 1:1 date using "Argentina LANL days long.dta"

drop _merge

merge 1:1 date using "Argentina UCLA days long.dta"

drop _merge

merge 1:1 date using "Argentina YYGU days long.dta"

drop _merge

save "Argentina days long.dta", replace




* graph forecast days

twoway (connected DELP_days date, sort mcolor(red) lcolor(red)) ///
(connected IHME_days date, sort mcolor(black) lcolor(black)) ///
(connected IMPE_days date, sort mcolor(magenta) lcolor(magenta)) ///
(connected LANL_days date, sort mcolor(brown) lcolor(brown)) ///
(connected UCLA_days date, sort mcolor(blue) lcolor(blue)) ///
(connected YYGU_days date, sort mcolor(black) lcolor(black)) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) xlabel(, angle(forty_five)) ///
ytitle(Forecast days) title("C19 daily deaths, Argentina, all models, forecast days, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

graph export "graph 210 C19 daily deaths, Argentina, all models, forecast days, all updates.pdf", replace



 


view "log CovidLongitudinal Argentina days.smcl"

log close

exit, clear
