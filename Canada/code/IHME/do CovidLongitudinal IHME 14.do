
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 14.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 14.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* weeks time bin

* compile the data created by IHME 6.do to IHME 13.do, for 8 locations: National and 7 provinces
* graphs provinces together

* input data files: "CovidLongitudinal IHME 3 _LOCATION_.dta", where LOCATION is National and 7 provinces
* output data files: "CovidLongitudinal IHME 4.dta"





use "CovidLongitudinal IHME 3 National", clear

qui merge m:m provincestate date using "CovidLongitudinal IHME 3 Alberta.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3 British Columbia.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3 Manitoba.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3 Nova Scotia.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3 Ontario.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3 Quebec.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3 Saskatchewan.dta"

drop _merge



qui compress 

save "CovidLongitudinal IHME 4", replace 





* graphs

***********************************************


* 11 1 1 Daily deaths, provinces together, mean over updates of median absolute % error by epi weeks

twoway ///
(line DDAbPeErA02XXX_Mean1 date, sort lwidth(vthick) lcolor(gray)) /// 1 "CAN" 
(line DDAbPeErA02XAB_Mean1 date, sort lwidth(medium) lcolor(cyan)) /// 2 "AB" cyan
(line DDAbPeErA02XBC_Mean1 date, sort lwidth(medium) lcolor(blue)) /// 3 "BC" blue
(line DDAbPeErA02XMB_Mean1 date, sort lwidth(medium) lcolor(lime)) /// 4 "MB" lime
(line DDAbPeErA02XNS_Mean1 date, sort lwidth(medium) lcolor(magenta)) /// 5 "NS" magenta
(line DDAbPeErA02XON_Mean1 date, sort lwidth(medium) lcolor(red)) /// 6 "ON" red
(line DDAbPeErA02XQC_Mean1 date, sort lwidth(medium) lcolor(black)) /// 7 "QC" black
(line DDAbPeErA02XSK_Mean1 date, sort lwidth(medium) lcolor(brown)) /// 8 "SK" orange
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by epi weeks", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("$country, provinces together, IHME, Forecast only", size(small)) /// 
legend(order(1 "CAN" 2 "AB" 3 "BC" 4 "MB" 5 "NS" 6 "ON" 7 "QC" 8 "SK") rows(3) size(small))  

qui graph export "graph 11 1 1 C19 daily deaths, $country, provinces together, IHME, absolute % Error Mean1.pdf", replace









* 11 1 2 Daily deaths, provinces together, mean over updates of median absolute % error by epi weeks

twoway ///
(line DDAbPeErA02XAB_Mean1 date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DDAbPeErA02XBC_Mean1 date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DDAbPeErA02XMB_Mean1 date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DDAbPeErA02XNS_Mean1 date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DDAbPeErA02XQC_Mean1 date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DDAbPeErA02XSK_Mean1 date, sort lwidth(medium) lcolor(brown)) /// 6 "SK" orange
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by epi weeks", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("$country, provinces together, IHME, Forecast only, without extremes CAN ON", size(small)) /// 
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NS" 5 "QC" 6 "SK") rows(2) size(small))  

qui graph export "graph 11 1 2 C19 daily deaths, $country, provinces together, IHME, absolute % Error Mean1.pdf", replace






* 11 1 3 Daily deaths, provinces together, mean over updates of median absolute % error by epi weeks

twoway ///
(line DDAbPeErA02XAB_Mean1 date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DDAbPeErA02XBC_Mean1 date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DDAbPeErA02XMB_Mean1 date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DDAbPeErA02XNS_Mean1 date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DDAbPeErA02XSK_Mean1 date, sort lwidth(medium) lcolor(brown)) /// 5 "SK" orange
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by epi weeks", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("$country, provinces together, IHME, Forecast only, without extremes CAN ON QC", size(small)) /// 
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NS" 5 "SK") rows(1) size(small))  

qui graph export "graph 11 1 3 C19 daily deaths, $country, provinces together, IHME, absolute % Error Mean1.pdf", replace







***********************************************

capture drop *2r

gen DDAbPeErA02XXX_Mean2r = round(DDAbPeErA02XXX_Mean2,0.1)
gen DDAbPeErA02XAB_Mean2r = round(DDAbPeErA02XAB_Mean2,0.1)
gen DDAbPeErA02XBC_Mean2r = round(DDAbPeErA02XBC_Mean2,0.1)
gen DDAbPeErA02XMB_Mean2r = round(DDAbPeErA02XMB_Mean2,0.1)
gen DDAbPeErA02XNS_Mean2r = round(DDAbPeErA02XNS_Mean2,0.1)
gen DDAbPeErA02XON_Mean2r = round(DDAbPeErA02XON_Mean2,0.1)
gen DDAbPeErA02XQC_Mean2r = round(DDAbPeErA02XQC_Mean2,0.1)
gen DDAbPeErA02XSK_Mean2r = round(DDAbPeErA02XSK_Mean2,0.1)

* 12 1 1 Daily deaths, provinces together, Avergae of MAPE over updates and epi weeks

graph bar ///
(mean) DDAbPeErA02XXX_Mean2r /// 1 "CAN" gray
(mean) DDAbPeErA02XAB_Mean2r /// 2 "AB" cyan
(mean) DDAbPeErA02XBC_Mean2r /// 3 "BC" blue
(mean) DDAbPeErA02XMB_Mean2r /// 4 "MB" lime
(mean) DDAbPeErA02XNS_Mean2r /// 5 "NS" magenta
(mean) DDAbPeErA02XON_Mean2r /// 6 "ON" red
(mean) DDAbPeErA02XQC_Mean2r /// 7 "QC" black
(mean) DDAbPeErA02XSK_Mean2r /// 8 "SK" orange
, bar(1, fcolor(gray) lcolor(gray)) ///
bar(2, fcolor(cyan) lcolor(cyan)) ///
bar(3, fcolor(blue) lcolor(blue)) ///
bar(4, fcolor(lime) lcolor(lime)) ///
bar(5, fcolor(magenta) lcolor(magenta)) ///
bar(6, fcolor(red) lcolor(red)) ///
bar(7, fcolor(black) lcolor(black)) ///
bar(8, fcolor(orange) lcolor(orange)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and epi weeks", size(medsmall)) ///
subtitle("$country, provinces, IHME, Forecast only. MAPE: Median Absolute % Error", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "CAN" 2 "AB" 3 "BC" 4 "MB" 5 "NS" 6 "ON" 7 "QC" 8 "SK") rows(2) size(small))

qui graph export "graph 12 1 1 C19 daily deaths, $country, provinces together, IHME, Average MAPE.pdf", replace







* 12 1 2 Daily deaths, provinces together, Avergae of MAPE over updates and epi weeks

graph bar ///
(mean) DDAbPeErA02XAB_Mean2r /// 1 "AB" cyan
(mean) DDAbPeErA02XBC_Mean2r /// 2 "BC" blue
(mean) DDAbPeErA02XMB_Mean2r /// 3 "MB" lime
(mean) DDAbPeErA02XNS_Mean2r /// 4 "NS" magenta
(mean) DDAbPeErA02XON_Mean2r /// 5 "ON" red
(mean) DDAbPeErA02XQC_Mean2r /// 6 "QC" black
(mean) DDAbPeErA02XSK_Mean2r /// 7 "SK" orange
, bar(1, fcolor(cyan) lcolor(cyan)) ///
bar(2, fcolor(blue) lcolor(blue)) ///
bar(3, fcolor(lime) lcolor(lime)) ///
bar(4, fcolor(magenta) lcolor(magenta)) ///
bar(5, fcolor(red) lcolor(red)) ///
bar(6, fcolor(black) lcolor(black)) ///
bar(7, fcolor(orange) lcolor(orange)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and epi weeks", size(medsmall)) ///
subtitle("$country, provinces, IHME, Forecast only. MAPE: Median Absolute % Error" ///
"without extremes CAN", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NS" 5 "ON" 6 "QC" 7 "SK") rows(2) size(small))

qui graph export "graph 12 1 2 C19 daily deaths, $country, provinces together, IHME, Average MAPE.pdf", replace









**********************

view "log CovidLongitudinal IHME 14.smcl"

log close

exit, clear
