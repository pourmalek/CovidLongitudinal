
clear all

cd "$pathCovidLongitudinal/countries/Grenada"

capture log close 

log using "log CovidLongitudinal Grenada 5 LANL.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Grenada 5 LANL.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Run calculations for error measures
	* for each country ---->> Grenada <<----                                                                 
***************************************************************************


** model = LANL ** <<-- modify 1
* lcolor brown

* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together


* input data files: "LANL Grenada.dta"
* output data files: "LANL Grenada error.dta" (with error measures saved)

* output data dictionary files: "LANL Grenada error data dictionary.csv"


* graph 03 Error
* graph 04 Absolute Error
* graph 05 Percent Error
* graph 06 Absolute Percent Error

* graph 07 mean over updates of median error by calendar months
* graph 08 Daily deaths, mean over updates of median absolute error by calendar months
* graph 09 Daily deaths, mean over updates of median % error by calendar months
* graph 10 Daily deaths, mean over updates of median absolute % error by calendar months

* graph 11 Daily deaths, Average MAPE over updates and calendar months




** graphs:
* "graph 03 Grenada LANL C19 daily deaths error.pdf"
* "graph 04 Grenada LANL C19 daily deaths absolute error.pdf"
* "graph 05 Grenada LANL C19 daily deaths percent error.pdf"
* "graph 06 Grenada LANL C19 daily deaths absolute percent error.pdf"

* "graph 07 Grenada LANL C19 daily deaths average median error.pdf"
* "graph 08 Grenada LANL C19 daily deaths average median absolute error.pdf"
* "graph 09 Grenada LANL C19 daily deaths average median percent error.pdf"
* "graph 10 Grenada LANL C19 daily deaths average median absolute percent error.pdf"

* "graph 11 Grenada LANL C19 daily deaths Average MAPE over updates and calendar months


*********************

/*


CALCULATIONS:

Error = minus (Reference minus Model) 

Absolute error = | minus (Reference minus Model) |

Percent error = 100 * (minus (Reference minus Model)) / Reference

Absolute percent error = 100 * | minus (Reference minus Model) | / Reference




Error = - (Reference - Model)

Absolute error = | - (Reference - Model) |

Percent error = 100 * (- (Reference - Model)) / Reference

Absolute percent error = 100 * | - (Reference - Model)| / Reference

*/







use "LANL Grenada.dta", clear 




* gen months time bin


gen month = month(date)

gen monthstr = ""
replace monthstr = "01" if month == 1
replace monthstr = "02" if month == 2
replace monthstr = "03" if month == 3

replace monthstr = "04" if month == 4
replace monthstr = "05" if month == 5
replace monthstr = "06" if month == 6

replace monthstr = "07" if month == 7
replace monthstr = "08" if month == 8
replace monthstr = "09" if month == 9

replace monthstr = "10" if month == 10
replace monthstr = "11" if month == 11
replace monthstr = "12" if month == 12



gen year = year(date)

gen yearstr = ""
replace yearstr = "2020" if year == 2020
replace yearstr = "2021" if year == 2021
replace yearstr = "2022" if year == 2022
replace yearstr = "2023" if year == 2023


egen yearmonth = concat(yearstr monthstr), p(m)

replace yearmonth = "" if yearmonth == "2023m01"

sort date yearmonth 

isid date

label var month "calendar month"

label var monthstr "calendar month string"

label var year "calendar year"

label var yearstr "calendar year string" 

label var yearmonth "calendar year and month"

*


// <<-- modify 2

local list ///
20210912 ///
20210919 ///
20210926

sort date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorLANL`update'
gen DDErrorLANL`update' = - (DayDeaMeSmJOHN - DayDeaMeFoLANL`update')
label var DDErrorLANL`update' "DayDeaMeFoLANL`update' error"
qui replace DDErrorLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorLANL`update' = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada
                                                            // <<-- modify 3
capture drop DDAbsErrLANL`update'
gen DDAbsErrLANL`update' = abs(- (DayDeaMeSmJOHN - DayDeaMeFoLANL`update'))
label var DDAbsErrLANL`update' "DayDeaMeFoLANL`update' absolute error"
qui replace DDAbsErrLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrLANL`update' = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada

capture drop DDPerErrLANL`update'
gen DDPerErrLANL`update' = (100 * (- (DayDeaMeSmJOHN - DayDeaMeFoLANL`update'))) / DayDeaMeSmJOHN
replace DDPerErrLANL`update' = 0 if DDErrorLANL`update' == 0
label var DDPerErrLANL`update' "DayDeaMeFoLANL`update' percent error"
qui replace DDPerErrLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrLANL`update' = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada

capture drop DDAbPeErLANL`update'
gen DDAbPeErLANL`update' = (100 * abs(- (DayDeaMeSmJOHN - DayDeaMeFoLANL`update'))) / DayDeaMeSmJOHN
replace DDAbPeErLANL`update' = 0 if DDAbsErrLANL`update' == 0
label var DDAbPeErLANL`update' "DayDeaMeFoLANL`update' absolute percent error"
qui replace DDAbPeErLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErLANL`update' = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorLANL`update'_Med1
bysort yearmonth : egen DDErrorLANL`update'_Med1 = median(DDErrorLANL`update')
label var DDErrorLANL`update'_Med1 "DayDeaLANL median error by calendar months and updates"
qui replace DDErrorLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorLANL`update'_Med1 = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada

capture drop DDAbsErrLANL`update'_Med1
bysort yearmonth : egen DDAbsErrLANL`update'_Med1 = median(DDAbsErrLANL`update')
label var DDAbsErrLANL`update'_Med1 "DayDeaLANL median absolute error by calendar months and updates"
qui replace DDAbsErrLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrLANL`update'_Med1 = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada

capture drop DDPerErrLANL`update'_Med1
bysort yearmonth : egen DDPerErrLANL`update'_Med1 = median(DDPerErrLANL`update')
label var DDPerErrLANL`update'_Med1 "DayDeaLANL median % error by calendar months and updates"
qui replace DDPerErrLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrLANL`update'_Med1 = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada

capture drop DDAbPeErLANL`update'_Med1
bysort yearmonth : egen DDAbPeErLANL`update'_Med1 = median(DDAbPeErLANL`update')
label var DDAbPeErLANL`update'_Med1 "DayDeaLANL median absolute % error by calendar months and updates" 
qui replace DDAbPeErLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErLANL`update'_Med1 = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 4
 
order DDErrorLANL20210912_Med1
order DDErrorLANL20210919_Med1
order DDErrorLANL20210926_Med1

		
capture drop DDErrorLANL_Mean1 // "DDErrorLANL mean over updates of median error by calendar months"
egen DDErrorLANL_Mean1 = rowmean(DDErrorLANL20210926_Med1-DDErrorLANL20210912_Med1) // <<-- modify 5
label var DDErrorLANL_Mean1 "DDErrorLANL mean over updates of median error by calendar months"
qui replace DDErrorLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorLANL_Mean1 = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada






* gen DDAbsErrLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 6
 
order DDAbsErrLANL20210912_Med1
order DDAbsErrLANL20210919_Med1
order DDAbsErrLANL20210926_Med1


capture drop DDAbsErrLANL_Mean1 // "DDAbsErrLANL mean over updates of median absolute error by calendar months"
egen DDAbsErrLANL_Mean1 = rowmean(DDAbsErrLANL20210926_Med1-DDAbsErrLANL20210912_Med1) // <<-- modify 7
label var DDAbsErrLANL_Mean1 "DDAbsErrLANL mean over updates of median absolute error by calendar months"
qui replace DDAbsErrLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrLANL_Mean1 = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada







* gen DDPerErrLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

// <<-- modify 8

order DDPerErrLANL20210912_Med1
order DDPerErrLANL20210919_Med1
order DDPerErrLANL20210926_Med1


capture drop DDPerErrLANL_Mean1 // "DDPerErrLANL mean over updates of median absolute % error by calendar months"
egen DDPerErrLANL_Mean1 = rowmean(DDPerErrLANL20210926_Med1-DDPerErrLANL20210912_Med1) // <<-- modify 9
label var DDPerErrLANL_Mean1 "DDPerErrLANL mean over updates of median % error by calendar months"
qui replace DDPerErrLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrLANL_Mean1 = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada

 
 
 

* gen DDAbPeErLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 10
 

order DDAbPeErLANL20210912_Med1
order DDAbPeErLANL20210919_Med1
order DDAbPeErLANL20210926_Med1


capture drop DDAbPeErLANL_Mean1 // "DDAbPeErLANL mean over updates of median absolute % error by calendar months"
egen DDAbPeErLANL_Mean1 = rowmean(DDAbPeErLANL20210926_Med1-DDAbPeErLANL20210912_Med1) // <<-- modify 11
label var DDAbPeErLANL_Mean1 "DDAbPeErLANL mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErLANL_Mean1 = . if date < td(12sep2021) // 12sep2021 is the earliest date of LANL forecasts for Grenada

 
 
 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorLANL_Mean2 = mean(DDErrorLANL_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorLANL_Mean2 "DDErrorLANL Mean over calendar months of median error over updates"

egen DDAbsErrLANL_Mean2 = mean(DDAbsErrLANL_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrLANL_Mean2 "DDAbsErrLANL Mean over calendar months of median absolute error over updates"

egen DDPerErrLANL_Mean2 = mean(DDPerErrLANL_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrLANL_Mean2 "DDPerErrLANL Mean over calendar months of median % error over updates"

egen DDAbPeErLANL_Mean2 = mean(DDAbPeErLANL_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErLANL_Mean2 "DDAbPeErLANL Mean over calendar months of median absolute % error over updates"





drop if date < td(01jan2020)

drop if date > td(01jan2023)


qui compress




******
* graph 03 Daily deaths, Error // <<-- modify 12

twoway ///
(line DDErrorLANL20210912 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210919 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210926 date, sort lcolor(brown) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Grenada, LANL, all updates, forecast only", size(small)) 

qui graph export "graph 03 Grenada LANL C19 daily deaths error.pdf", replace





******
* graph 04 Daily deaths, Absolute Error // <<-- modify 13

twoway ///
(line DDAbsErrLANL20210912 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210919 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210926 date, sort lcolor(brown) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Grenada, LANL, all updates, forecast only", size(small))

qui graph export "graph 04 Grenada LANL C19 daily deaths absolute error.pdf", replace








******
* graph 05 Daily deaths, Percent Error <<-- modify 14

twoway ///
(line DDPerErrLANL20210912 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210919 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210926 date, sort lcolor(brown) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Grenada, LANL, all updates, forecast only", size(small))

qui graph export "graph 05 Grenada LANL C19 daily deaths percent error.pdf", replace








******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 15

* LANL lcolor brown // <<-- modify 16

twoway ///
(line DDAbPeErLANL20210912 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210919 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210926 date, sort lcolor(brown) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Grenada, LANL, all updates, forecast only", size(small))

qui graph export "graph 06 Grenada LANL C19 daily deaths absolute percent error.pdf", replace











***************************************************************
* graph 07 Daily deaths, average median error 

twoway ///
(line DDErrorLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Grenada, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 07 Grenada LANL C19 daily deaths average median error.pdf", replace





*********************
* smooth median error for better viewing 

tsset date, daily   

tssmooth ma DDErrorLANL_Mean1_window = DDErrorLANL_Mean1, window(3 1 3)

tssmooth ma DDErrorLANL_Mean1_sm = DDErrorLANL_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorLANL_Mean1_sm "Daily deaths LANL average median error smooth"

drop *_window

// tsset, clear

*













***************************************************************
* graph 08 Daily deaths, average median absolute error 

twoway ///
(line DDAbsErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Grenada, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 08 Grenada LANL C19 daily deaths average median absolute error.pdf", replace






*********************
* smooth median absolute error for better viewing 

// tsset date, daily   

tssmooth ma DDAbsErrLANL_Mean1_window = DDAbsErrLANL_Mean1, window(3 1 3)

tssmooth ma DDAbsErrLANL_Mean1_sm = DDAbsErrLANL_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrLANL_Mean1_sm "Daily deaths LANL average median absolute error smooth"

drop *_window

// tsset, clear

*










***************************************************************
* graph 09 Daily deaths, average median percent error 

twoway ///
(line DDPerErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Grenada, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 09 Grenada LANL C19 daily deaths average median percent error.pdf", replace





*********************
* smooth median percent error for better viewing 

// tsset date, daily   

tssmooth ma DDPerErrLANL_Mean1_window = DDPerErrLANL_Mean1, window(3 1 3)

tssmooth ma DDPerErrLANL_Mean1_sm = DDPerErrLANL_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrLANL_Mean1_sm "Daily deaths LANL average median percent error smooth"

drop *_window

// tsset, clear

*













***************************************************************
* graph 10 Daily deaths, average median absolute percent error

twoway ///
(line DDAbPeErLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Grenada, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 Grenada LANL C19 daily deaths average median absolute percent error.pdf", replace





*********************
* smooth median absolute % error for better viewing 

// tsset date, daily   

tssmooth ma DDAbPeErLANL_Mean1_window = DDAbPeErLANL_Mean1, window(3 1 3)

tssmooth ma DDAbPeErLANL_Mean1_sm = DDAbPeErLANL_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErLANL_Mean1_sm "Daily deaths LANL average median absolute percent error smooth"

drop *_window

tsset, clear

*





***********************************************

capture drop *2str

summ DDAbPeErLANL_Mean2, meanonly

local DDAbPeErLANL_Mean2str = string(r(mean),"%8.1f")

gen DDAbPeErLANL_Mean2str = `DDAbPeErLANL_Mean2str'
    

* graph 11 Daily deaths, Average MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErLANL_Mean2str /// 
, bar(1, fcolor(brown) lcolor(brown)) ///
blabel(bar, format(%30.0fc)) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("Grenada, LANL, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) ylabel(, labsize(small) angle(forty_five) format(%30.0fc))

qui graph export "graph 11 Grenada LANL C19 daily deaths Average MAPE over updates and calendar months.pdf", replace










******

qui compress 

save "LANL Grenada error.dta", replace 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "LANL Grenada error data dictionary.csv", replace 
	
restore



view "log CovidLongitudinal Grenada 5 LANL.smcl"

log close

exit, clear

