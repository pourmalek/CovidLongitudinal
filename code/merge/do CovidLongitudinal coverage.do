
clear all

cd "$pathCovidLongitudinal"

cd merge

capture log close 

log using "log CovidLongitudinal merge.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal merge.do"

* Project: Longitudinal assessment of C 19 models         
* Objective: Count the number of countries included in each model
                                                                
***************************************************************************





***** get the country merge

* get the number of countries included in C 19 epidemic models' updates 


*** for Global level, then for Regional levels ***


* find the update date of maximum countries for each model

* gen the maximum countries' list for each model







****************************************************************
**************************************************************** 
****************************************************************

* get the number of countries included in C 19 epidemic models' updates





*********************

* DELP number of countries

clear

local list1 ///
20200417 ///
20200424 ///
20200501 ///
20200509 ///
20200517 ///
20200524 ///
20200531 ///
20200607 ///
20200614 ///
20200621 ///
20200628 ///
20200704 ///
20200718 ///
20200723 ///
20200801 ///
20200815 ///
20200829 ///
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



cd ..

cd download

cd DELP

foreach update of local list1 {

	use "CovidLongitudinal DELP `update'.dta", clear
	
	keep update_date`update' loc_grand_name
	
	rename update_date`update' update_date
	
	format update_date %tdDDMonCCYY
	
	
	qui keep if ///
	loc_grand_name == "Afghanistan" | ///
	loc_grand_name == "Albania" | ///
	loc_grand_name == "Algeria" | ///
	loc_grand_name == "Andorra" | ///
	loc_grand_name == "Angola" | ///
	loc_grand_name == "Antigua and Barbuda" | ///
	loc_grand_name == "Argentina" | ///
	loc_grand_name == "Armenia" | ///
	loc_grand_name == "Australia" | ///
	loc_grand_name == "Austria" | ///
	loc_grand_name == "Azerbaijan" | ///
	loc_grand_name == "Bahrain" | ///
	loc_grand_name == "Bangladesh" | ///
	loc_grand_name == "Barbados" | ///
	loc_grand_name == "Belarus" | ///
	loc_grand_name == "Belgium" | ///
	loc_grand_name == "Belize" | ///
	loc_grand_name == "Benin" | ///
	loc_grand_name == "Bhutan" | ///
	loc_grand_name == "Bolivia" | ///
	loc_grand_name == "Bosnia and Herzegovina" | ///
	loc_grand_name == "Botswana" | ///
	loc_grand_name == "Brazil" | ///
	loc_grand_name == "Bulgaria" | ///
	loc_grand_name == "Burkina Faso" | ///
	loc_grand_name == "Burundi" | ///
	loc_grand_name == "Cambodia" | ///
	loc_grand_name == "Cameroon" | ///
	loc_grand_name == "Canada" | ///
	loc_grand_name == "Cape Verde" | ///
	loc_grand_name == "Central African Republic" | ///
	loc_grand_name == "Chad" | ///
	loc_grand_name == "Chile" | ///
	loc_grand_name == "Colombia" | ///
	loc_grand_name == "Comoros" | ///
	loc_grand_name == "Congo" | ///
	loc_grand_name == "Congo, DR" | ///
	loc_grand_name == "Costa Rica" | ///
	loc_grand_name == "Cote d'Ivoire" | ///
	loc_grand_name == "Croatia" | ///
	loc_grand_name == "Cuba" | ///
	loc_grand_name == "Cyprus" | ///
	loc_grand_name == "Czechia" | ///
	loc_grand_name == "Denmark" | ///
	loc_grand_name == "Djibouti" | ///
	loc_grand_name == "Dominican Republic" | ///
	loc_grand_name == "Ecuador" | ///
	loc_grand_name == "Egypt" | ///
	loc_grand_name == "El Salvador" | ///
	loc_grand_name == "Equatorial Guinea" | ///
	loc_grand_name == "Estonia" | ///
	loc_grand_name == "Ethiopia" | ///
	loc_grand_name == "Finland" | ///
	loc_grand_name == "France" | ///
	loc_grand_name == "Gabon" | ///
	loc_grand_name == "Gambia" | ///
	loc_grand_name == "Georgia" | ///
	loc_grand_name == "Germany" | ///
	loc_grand_name == "Ghana" | ///
	loc_grand_name == "Greece" | ///
	loc_grand_name == "Guatemala" | ///
	loc_grand_name == "Guinea" | ///
	loc_grand_name == "Guinea Bissau" | ///
	loc_grand_name == "Guyana" | ///
	loc_grand_name == "Haiti" | ///
	loc_grand_name == "Honduras" | ///
	loc_grand_name == "Hungary" | ///
	loc_grand_name == "Iceland" | ///
	loc_grand_name == "India" | ///
	loc_grand_name == "Indonesia" | ///
	loc_grand_name == "Iran" | ///
	loc_grand_name == "Iraq" | ///
	loc_grand_name == "Ireland" | ///
	loc_grand_name == "Israel" | ///
	loc_grand_name == "Italy" | ///
	loc_grand_name == "Jamaica" | ///
	loc_grand_name == "Japan" | ///
	loc_grand_name == "Jordan" | ///
	loc_grand_name == "Kazakhstan" | ///
	loc_grand_name == "Kenya" | ///
	loc_grand_name == "Korea, South" | ///
	loc_grand_name == "Kosovo" | ///
	loc_grand_name == "Kuwait" | ///
	loc_grand_name == "Latvia" | ///
	loc_grand_name == "Lebanon" | ///
	loc_grand_name == "Lesotho" | ///
	loc_grand_name == "Liberia" | ///
	loc_grand_name == "Libya" | ///
	loc_grand_name == "Liechtenstein" | ///
	loc_grand_name == "Lithuania" | ///
	loc_grand_name == "Luxembourg" | ///
	loc_grand_name == "Madagascar" | ///
	loc_grand_name == "Malawi" | ///
	loc_grand_name == "Malaysia" | ///
	loc_grand_name == "Maldives" | ///
	loc_grand_name == "Mali" | ///
	loc_grand_name == "Malta" | ///
	loc_grand_name == "Mauritania" | ///
	loc_grand_name == "Mauritius" | ///
	loc_grand_name == "Mexico" | ///
	loc_grand_name == "Moldova" | ///
	loc_grand_name == "Monaco" | ///
	loc_grand_name == "Mongolia" | ///
	loc_grand_name == "Montenegro" | ///
	loc_grand_name == "Morocco" | ///
	loc_grand_name == "Mozambique" | ///
	loc_grand_name == "Namibia" | ///
	loc_grand_name == "Nepal" | ///
	loc_grand_name == "Netherlands" | ///
	loc_grand_name == "New Zealand" | ///
	loc_grand_name == "Nicaragua" | ///
	loc_grand_name == "Niger" | ///
	loc_grand_name == "Nigeria" | ///
	loc_grand_name == "North Macedonia" | ///
	loc_grand_name == "Norway" | ///
	loc_grand_name == "Oman" | ///
	loc_grand_name == "Pakistan" | ///
	loc_grand_name == "Panama" | ///
	loc_grand_name == "Papua New Guinea" | ///
	loc_grand_name == "Paraguay" | ///
	loc_grand_name == "Peru" | ///
	loc_grand_name == "Philippines" | ///
	loc_grand_name == "Poland" | ///
	loc_grand_name == "Portugal" | ///
	loc_grand_name == "Qatar" | ///
	loc_grand_name == "Romania" | ///
	loc_grand_name == "Russia" | ///
	loc_grand_name == "Rwanda" | ///
	loc_grand_name == "San Marino" | ///
	loc_grand_name == "Sao Tome and Principe" | ///
	loc_grand_name == "Saudi Arabia" | ///
	loc_grand_name == "Senegal" | ///
	loc_grand_name == "Serbia" | ///
	loc_grand_name == "Seychelles" | ///
	loc_grand_name == "Sierra Leone" | ///
	loc_grand_name == "Singapore" | ///
	loc_grand_name == "Slovakia" | ///
	loc_grand_name == "Slovenia" | ///
	loc_grand_name == "Somalia" | ///
	loc_grand_name == "South Africa" | ///
	loc_grand_name == "South Sudan" | ///
	loc_grand_name == "Spain" | ///
	loc_grand_name == "Sri Lanka" | ///
	loc_grand_name == "Sudan" | ///
	loc_grand_name == "Suriname" | ///
	loc_grand_name == "Sweden" | ///
	loc_grand_name == "Switzerland" | ///
	loc_grand_name == "Tajikistan" | ///
	loc_grand_name == "Tanzania" | ///
	loc_grand_name == "Thailand" | ///
	loc_grand_name == "Togo" | ///
	loc_grand_name == "Trinidad and Tobago" | ///
	loc_grand_name == "Tunisia" | ///
	loc_grand_name == "Turkey" | ///
	loc_grand_name == "Uganda" | ///
	loc_grand_name == "Ukraine" | ///
	loc_grand_name == "United Arab Emirates" | ///
	loc_grand_name == "United Kingdom" | ///
	loc_grand_name == "United States of America" | ///
	loc_grand_name == "Uruguay" | ///
	loc_grand_name == "Uzbekistan" | ///
	loc_grand_name == "Venezuela" | ///
	loc_grand_name == "Viet Nam" | ///
	loc_grand_name == "Yemen" | ///
	loc_grand_name == "Zambia" | ///
	loc_grand_name == "Zimbabwe"



	
	qui tab loc_grand_name
	
	gen loc_unique = r(r)
	
	drop loc_grand_name
	
	qui keep in 1

	qui save "CovidLongitudinal DELP `update' loc_unique.dta", replace
	
}
*	



foreach update of local list1 {
	
	append using "CovidLongitudinal DELP `update' loc_unique.dta"

}
*	

gen model = "DELP"

qui duplicates drop *, force

sort update_date

isid update_date

sort update_date

cd ..

cd ..

cd merge

save "loc_unique DELP.dta", replace

* 












*********************

* IHME number of countries

clear 

local list2 ///
20200325 ///
20200326 ///
20200327 ///
20200329 ///
20200330 ///
20200331 ///
20200401 ///
20200405 ///
20200407 ///
20200408 ///
20200410 ///
20200413 ///
20200417 ///
20200421 ///
20200422 ///
20200427 ///
20200428 ///
20200429 ///
20200504 ///
20200510 ///
20200512 ///
20200520 ///
20200525 ///
20200526 ///
20200529 ///
20200605 ///
20200608 ///
20200610 ///
20200615 ///
20200625 ///
20200629 ///
20200707 ///
20200714 ///
20200722 ///
20200730 ///
20200806 ///
20200821 ///
20200827 ///
20200903 ///
20200911 ///
20200918 ///
20200924 ///
20201002 ///
20201009 ///
20201015 ///
20201022 ///
20201029 ///
20201112 ///
20201119 ///
20201203 ///
20201210 ///
20201217 ///
20201223 ///
20210115 ///
20210122 ///
20210128 ///
20210204 ///
20210212 ///
20210220 ///
20210225 ///
20210306 ///
20210311 ///
20210317 ///
20210325 ///
20210401 ///
20210409 ///
20210416 ///
20210423 ///
20210506 ///
20210514 ///
20210521 ///
20210528 ///
20210604 ///
20210610 ///
20210618 ///
20210625 ///
20210702 ///
20210715 ///
20210723 ///
20210730 ///
20210806 ///
20210820 ///
20210826 ///
20210902 ///
20210910 ///
20210916 ///
20210923 ///
20210930 ///
20211015 ///
20211021 ///
20211104 ///
20211119 ///
20211221 ///
20220108 ///
20220114 ///
20220121 ///
20220204 ///
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



cd ..

cd download

cd IHME



foreach update of local list2 {

	use "IHME `update'.dta", clear
			
	gen update = "`update'"

	gen this = substr(update,1,8)

	gen update_date = date(this, "YMD")

	drop this

	format update_date %tdDDMonCCYY
	
	
	rename location_name loc_grand_name
	
	keep update_date loc_grand_name 
		
	gen loc_grand_name_country = 0
	
	* List of countries from IHME update July 19, 2022.
		
		qui keep if ///
		loc_grand_name == "Afghanistan" | ///
		loc_grand_name == "Albania" | ///
		loc_grand_name == "Albania" | ///
		loc_grand_name == "Algeria" | ///
		loc_grand_name == "Andorra" | ///
		loc_grand_name == "Angola" | ///
		loc_grand_name == "Argentina" | ///
		loc_grand_name == "Armenia" | ///
		loc_grand_name == "Australia" | ///
		loc_grand_name == "Austria" | ///
		loc_grand_name == "Azerbaijan" | ///
		loc_grand_name == "Bahamas" | ///
		loc_grand_name == "Bahrain" | ///
		loc_grand_name == "Bangladesh" | ///
		loc_grand_name == "Barbados" | ///
		loc_grand_name == "Belarus" | ///
		loc_grand_name == "Belgium" | ///
		loc_grand_name == "Belize" | ///
		loc_grand_name == "Benin" | ///
		loc_grand_name == "Bolivia (Plurinational State of)" | ///
		loc_grand_name == "Bosnia and Herzegovina" | ///
		loc_grand_name == "Botswana" | ///
		loc_grand_name == "Brazil" | ///
		loc_grand_name == "Bulgaria" | ///
		loc_grand_name == "Burkina Faso" | ///
		loc_grand_name == "Cote d'Ivoire" | /// 
		loc_grand_name == "Cabo Verde" | ///
		loc_grand_name == "Cambodia" | ///
		loc_grand_name == "Cameroon" | ///
		loc_grand_name == "Canada" | ///
		loc_grand_name == "Central African Republic" | ///
		loc_grand_name == "Chad" | ///
		loc_grand_name == "Chile" | ///
		loc_grand_name == "China" | ///
		loc_grand_name == "Colombia" | ///
		loc_grand_name == "Comoros" | ///
		loc_grand_name == "Congo" | ///
		loc_grand_name == "Costa Rica" | ///
		loc_grand_name == "Croatia" | ///
		loc_grand_name == "Cuba" | ///
		loc_grand_name == "Cyprus" | ///
		loc_grand_name == "Czechia" | ///
		loc_grand_name == "Democratic Republic of the Congo" | ///
		loc_grand_name == "Denmark" | ///
		loc_grand_name == "Djibouti" | ///
		loc_grand_name == "Dominican Republic" | ///
		loc_grand_name == "Ecuador" | ///
		loc_grand_name == "Egypt" | ///
		loc_grand_name == "El Salvador" | ///
		loc_grand_name == "Equatorial Guinea" | ///
		loc_grand_name == "Estonia" | ///
		loc_grand_name == "Eswatini" | ///
		loc_grand_name == "Ethiopia" | ///
		loc_grand_name == "Fiji" | ///
		loc_grand_name == "Finland" | ///
		loc_grand_name == "France" | ///
		loc_grand_name == "Gabon" | ///
		loc_grand_name == "Gambia" | ///
		loc_grand_name == "Germany" | ///
		loc_grand_name == "Ghana" | ///
		loc_grand_name == "Greece" | ///
		loc_grand_name == "Guam" | ///
		loc_grand_name == "Guatemala" | ///
		loc_grand_name == "Guinea" | ///
		loc_grand_name == "Guinea-Bissau" | ///
		loc_grand_name == "Guyana" | ///
		loc_grand_name == "Haiti" | ///
		loc_grand_name == "Honduras" | ///
		loc_grand_name == "Hungary" | ///
		loc_grand_name == "Iceland" | ///
		loc_grand_name == "India" | ///
		loc_grand_name == "Indonesia" | ///
		loc_grand_name == "Iran (Islamic Republic of)" | ///
		loc_grand_name == "Iraq" | ///
		loc_grand_name == "Israel" | ///
		loc_grand_name == "Italy" | ///
		loc_grand_name == "Jamaica" | ///
		loc_grand_name == "Japan" | ///
		loc_grand_name == "Jordan" | ///
		loc_grand_name == "Kazakhstan" | ///
		loc_grand_name == "Kenya" | ///
		loc_grand_name == "Kuwait" | ///
		loc_grand_name == "Kyrgyzstan" | ///
		loc_grand_name == "Latvia" | ///
		loc_grand_name == "Lebanon" | ///
		loc_grand_name == "Lesotho" | ///
		loc_grand_name == "Liberia" | ///
		loc_grand_name == "Libya" | ///
		loc_grand_name == "Lithuania" | ///
		loc_grand_name == "Luxembourg" | ///
		loc_grand_name == "Madagascar" | ///
		loc_grand_name == "Malawi" | ///
		loc_grand_name == "Malaysia" | ///
		loc_grand_name == "Maldives" | ///
		loc_grand_name == "Mali" | ///
		loc_grand_name == "Malta" | ///
		loc_grand_name == "Mauritania" | ///
		loc_grand_name == "Mauritius" | ///
		loc_grand_name == "Mexico" | ///
		loc_grand_name == "Mongolia" | ///
		loc_grand_name == "Montenegro" | ///
		loc_grand_name == "Morocco" | ///
		loc_grand_name == "Mozambique" | ///
		loc_grand_name == "Myanmar" | ///
		loc_grand_name == "Namibia" | ///
		loc_grand_name == "Nepal" | ///
		loc_grand_name == "Netherlands" | ///
		loc_grand_name == "New Zealand" | ///
		loc_grand_name == "Nicaragua" | ///
		loc_grand_name == "Niger" | ///
		loc_grand_name == "Nigeria" | ///
		loc_grand_name == "North Macedonia" | ///
		loc_grand_name == "Norway" | ///
		loc_grand_name == "Oman" | ///
		loc_grand_name == "Pakistan" | ///
		loc_grand_name == "Palestine" | ///
		loc_grand_name == "Panama" | ///
		loc_grand_name == "Papua New Guinea" | ///
		loc_grand_name == "Paraguay" | ///
		loc_grand_name == "Peru" | ///
		loc_grand_name == "Philippines" | ///
		loc_grand_name == "Poland" | ///
		loc_grand_name == "Portugal" | ///
		loc_grand_name == "Puerto Rico" | ///
		loc_grand_name == "Qatar" | ///
		loc_grand_name == "Republic of Korea" | ///
		loc_grand_name == "Republic of Moldova" | ///
		loc_grand_name == "Romania" | ///
		loc_grand_name == "Russian Federation" | ///
		loc_grand_name == "Rwanda" | ///
		loc_grand_name == "San Marino" | ///
		loc_grand_name == "Sao Tome and Principe" | ///
		loc_grand_name == "Saudi Arabia" | ///
		loc_grand_name == "Senegal" | ///
		loc_grand_name == "Serbia" | ///
		loc_grand_name == "Sierra Leone" | ///
		loc_grand_name == "Singapore" | ///
		loc_grand_name == "Slovakia" | ///
		loc_grand_name == "Slovenia" | ///
		loc_grand_name == "Somalia" | ///
		loc_grand_name == "South Africa" | ///
		loc_grand_name == "South Sudan" | ///
		loc_grand_name == "Spain" | ///
		loc_grand_name == "Sri Lanka" | ///
		loc_grand_name == "Sudan" | ///
		loc_grand_name == "Suriname" | ///
		loc_grand_name == "Sweden" | ///
		loc_grand_name == "Switzerland" | ///
		loc_grand_name == "Syrian Arab Republic" | ///
		loc_grand_name == "Taiwan (Province of China)" | ///
		loc_grand_name == "Tajikistan" | ///
		loc_grand_name == "Thailand" | ///
		loc_grand_name == "Timor-Leste" | ///
		loc_grand_name == "Togo" | ///
		loc_grand_name == "Trinidad and Tobago" | ///
		loc_grand_name == "Tunisia" | ///
		loc_grand_name == "Turkey" | ///
		loc_grand_name == "Uganda" | ///
		loc_grand_name == "Ukraine" | ///
		loc_grand_name == "United Arab Emirates" | ///
		loc_grand_name == "United Kingdom" | ///
		loc_grand_name == "United States of America" | ///
		loc_grand_name == "United States Virgin Islands" | ///
		loc_grand_name == "Uruguay" | ///
		loc_grand_name == "Uzbekistan" | ///
		loc_grand_name == "Venezuela (Bolivarian Republic of)" | ///
		loc_grand_name == "Viet Nam" | ///
		loc_grand_name == "Yemen" | ///
		loc_grand_name == "Zambia" | ///
		loc_grand_name == "Zimbabwe" | ///
		loc_grand_name == "Georgia"	| ///
		loc_grand_name == "US"	// IHME 20200330.dta changes from "United States of America" to "US"
		
			
	qui tab loc_grand_name
	
	gen loc_unique = r(r)
	
	drop loc_grand_name
	
	qui keep in 1

	qui save "CovidLongitudinal IHME `update' loc_unique.dta", replace
	

	
}
*	





foreach update of local list2 {
	
	append using "CovidLongitudinal IHME `update' loc_unique.dta"

}
*	



gen model = "IHME"

qui duplicates drop *, force

drop loc_grand_name_country

sort update_date

isid update_date

sort update_date

cd ..

cd ..

cd merge

save "loc_unique IHME.dta", replace

* 











*********************

* IMPE number of countries

clear

local list3 ///
20200428 ///
20200429 ///
20200430 ///
20200501 ///
20200502 ///
20200503 ///
20200504 ///
20200505 ///
20200506 ///
20200507 ///
20200508 ///
20200509 ///
20200510 ///
20200511 ///
20200512 ///
20200513 ///
20200514 ///
20200515 ///
20200516 ///
20200517 ///
20200519 ///
20200520 ///
20200521 ///
20200522 ///
20200523 ///
20200524 ///
20200525 ///
20200526 ///
20200527 ///
20200528 ///
20200529 ///
20200530 ///
20200531 ///
20200601 ///
20200602 ///
20200603 ///
20200604 ///
20200606 ///
20200609 ///
20200614 ///
20200616 ///
20200619 ///
20200621 ///
20200623 ///
20200626 ///
20200628 ///
20200702 ///
20200703 ///
20200704 ///
20200707 ///
20200711 ///
20200714 ///
20200715 ///
20200718 ///
20200720 ///
20200722 ///
20200725 ///
20200727 ///
20200731 ///
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



cd ..

cd download

cd IMPE

foreach update of local list3 {

	use "IMPE `update'.dta", clear
	
	gen update = "`update'"

	gen this = substr(update,1,8)

	gen update_date = date(this, "YMD")

	drop this

	format update_date %tdDDMonCCYY

	
	keep update_date loc_grand_name
	
		
	qui tab loc_grand_name
	
	gen loc_unique = r(r)
	
	drop loc_grand_name
	
	qui keep in 1

	qui save "CovidLongitudinal IMPE `update' loc_unique.dta", replace
	
}
*	




foreach update of local list3 {
	
	append using "CovidLongitudinal IMPE `update' loc_unique.dta"

}
*	

gen model = "IMPE"

qui duplicates drop *, force

sort update_date

isid update_date

sort update_date

cd ..

cd ..

cd merge

save "loc_unique IMPE.dta", replace

* 








*********************

* LANL number of countries

clear

local list4 ///
20200426 ///
20200429 ///
20200503 ///
20200506 ///
20200510 ///
20200513 ///
20200517 ///
20200520 ///
20200524 ///
20200527 ///
20200531 ///
20200603 ///
20200607 ///
20200610 ///
20200613 ///
20200617 ///
20200621 ///
20200623 ///
20200628 ///
20200701 ///
20200705 ///
20200708 ///
20200712 ///
20200715 ///
20200719 ///
20200722 ///
20200726 ///
20200729 ///
20200802 ///
20200805 ///
20200809 ///
20200812 ///
20200816 ///
20200819 ///
20200823 ///
20200826 ///
20200830 ///
20200902 ///
20200906 ///
20200909 ///
20200913 ///
20200916 ///
20200920 ///
20200923 ///
20200927 ///
20200930 ///
20201004 ///
20201007 ///
20201011 ///
20201014 ///
20201018 ///
20201021 ///
20201025 ///
20201028 ///
20201101 ///
20201104 ///
20201108 ///
20201111 ///
20201115 ///
20201118 ///
20201122 ///
20201125 ///
20201129 ///
20201202 ///
20201206 ///
20201209 ///
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



cd ..

cd download

cd LANL

foreach update of local list4 {

	use "CovidLongitudinal LANL `update'.dta", clear
	
	keep loc_grand_name
	
	gen update = "`update'"

	gen this = substr(update,1,8)

	gen update_date = date(this, "YMD")

	drop this update

	format update_date %tdDDMonCCYY	

	
	
	qui tab loc_grand_name
	
	gen loc_unique = r(r)
	
	drop loc_grand_name
	
	qui keep in 1

	qui save "CovidLongitudinal LANL `update' loc_unique.dta", replace
	
}
*	




foreach update of local list4 {
	
	append using "CovidLongitudinal LANL `update' loc_unique.dta"

}
*	

gen model = "LANL"

qui duplicates drop *, force

sort update_date

isid update_date

sort update_date

cd ..

cd ..

cd merge

save "loc_unique LANL.dta", replace

*







*********************

* UCLA number of countries

clear

local list5 ///
20210103 ///
20210110 ///
20210206 ///
20210228 ///
20210307 ///
20210315 ///
20210328 ///
20210404 ///
20210606 ///
20210614 ///
20210621 ///
20210627 ///
20210630 ///
20210706 ///
20210712 ///
20210719 ///
20210726 ///
20210802 ///
20210809 ///
20210816 ///
20210823 ///
20210830 ///
20210906 ///
20210913 ///
20210920 ///
20210927 ///
20211004 ///
20211011 ///
20211018 ///
20211025 ///
20211101 ///
20211108 ///
20211115 ///
20211122 ///
20211129 ///
20211206 ///
20211213 ///
20211220


cd ..

cd download

cd UCLA

foreach update of local list5 {

	use "CovidLongitudinal UCLA `update'.dta", clear
	
	keep loc_grand_name
	
	gen update = "`update'"

	gen this = substr(update,1,8)

	gen update_date = date(this, "YMD")

	drop this update

	format update_date %tdDDMonCCYY	

	
	
	qui tab loc_grand_name
	
	gen loc_unique = r(r)
	
	drop loc_grand_name
	
	qui keep in 1

	qui save "CovidLongitudinal UCLA `update' loc_unique.dta", replace
	
}
*	




foreach update of local list5 {
	
	append using "CovidLongitudinal UCLA `update' loc_unique.dta"

}
*	

gen model = "UCLA"

qui duplicates drop *, force

sort update_date

isid update_date

sort update_date

cd ..

cd ..

cd merge

save "loc_unique UCLA.dta", replace

*







*********************

* YYGU number of countries

clear

local list6 ///
20200401 ///
20200402 ///
20200403 ///
20200404 ///
20200405 ///
20200406 ///
20200407 ///
20200408 ///
20200409 ///
20200410 ///
20200411 ///
20200412 ///
20200413 ///
20200414 ///
20200415 ///
20200416 ///
20200417 ///
20200418 ///
20200419 ///
20200420 ///
20200421 ///
20200422 ///
20200423 ///
20200424 ///
20200425 ///
20200426 ///
20200427 ///
20200428 ///
20200429 ///
20200430 ///
20200501 ///
20200502 ///
20200503 ///
20200504 ///
20200505 ///
20200506 ///
20200507 ///
20200508 ///
20200509 ///
20200510 ///
20200511 ///
20200512 ///
20200513 ///
20200514 ///
20200515 ///
20200516 ///
20200517 ///
20200518 ///
20200519 ///
20200520 ///
20200521 ///
20200522 ///
20200523 ///
20200524 ///
20200525 ///
20200526 ///
20200527 ///
20200528 ///
20200529 ///
20200530 ///
20200531 ///
20200601 ///
20200602 ///
20200603 ///
20200604 ///
20200605 ///
20200606 ///
20200607 ///
20200608 ///
20200609 ///
20200610 ///
20200611 ///
20200612 ///
20200613 ///
20200614 ///
20200615 ///
20200616 ///
20200617 ///
20200618 ///
20200619 ///
20200620 ///
20200621 ///
20200622 ///
20200623 ///
20200624 ///
20200625 ///
20200626 ///
20200627 ///
20200628 ///
20200629 ///
20200630 ///
20200701 ///
20200702 ///
20200703 ///
20200704 ///
20200705 ///
20200706 ///
20200707 ///
20200708 ///
20200709 ///
20200710 ///
20200711 ///
20200712 ///
20200713 ///
20200714 ///
20200715 ///
20200716 ///
20200717 ///
20200718 ///
20200719 ///
20200720 ///
20200721 ///
20200722 ///
20200723 ///
20200724 ///
20200725 ///
20200726 ///
20200727 ///
20200728 ///
20200729 ///
20200730 ///
20200731 ///
20200801 ///
20200802 ///
20200803 ///
20200804 ///
20200805 ///
20200806 ///
20200807 ///
20200808 ///
20200809 ///
20200810 ///
20200811 ///
20200812 ///
20200813 ///
20200814 ///
20200815 ///
20200816 ///
20200817 ///
20200818 ///
20200819 ///
20200820 ///
20200821 ///
20200822 ///
20200823 ///
20200824 ///
20200825 ///
20200826 ///
20200827 ///
20200828 ///
20200829 ///
20200830 ///
20200831 ///
20200901 ///
20200902 ///
20200903 ///
20200904 ///
20200905 ///
20200906 ///
20200907 ///
20200908 ///
20200909 ///
20200910 ///
20200911 ///
20200912 ///
20200913 ///
20200914 ///
20200915 ///
20200916 ///
20200917 ///
20200918 ///
20200919 ///
20200920 ///
20200921 ///
20200922 ///
20200923 ///
20200924 ///
20200925 ///
20200926 ///
20200927 ///
20200928 ///
20200929 ///
20200930 ///
20201001 ///
20201002 ///
20201003 ///
20201004 ///
20201005



cd ..

cd download

cd YYGU

foreach update of local list6 {

	use "CovidLongitudinal YYGU `update'.dta", clear
	
	keep loc_grand_name
	
	gen update = "`update'"

	gen this = substr(update,1,8)

	gen update_date = date(this, "YMD")

	drop this update

	format update_date %tdDDMonCCYY	

	
	
	qui tab loc_grand_name
	
	gen loc_unique = r(r)
	
	drop loc_grand_name
	
	qui keep in 1

	qui save "CovidLongitudinal YYGU `update' loc_unique.dta", replace
	
}
*	




foreach update of local list6 {
	
	append using "CovidLongitudinal YYGU `update' loc_unique.dta"

}
*	

gen model = "YYGU"

qui duplicates drop *, force

sort update_date

isid update_date

sort update_date

cd ..

cd ..

cd merge

save "loc_unique YYGU.dta", replace

*









*********************

* JOHN number of countries

clear



cd ..

cd download

cd JOHN

use "CovidLongitudinal JOHN.dta", clear
	
keep loc_grand_name

contract loc_grand_name

drop _freq

qui tab loc_grand_name

gen loc_unique = r(r)

drop loc_grand_name

qui keep in 1
	


gen model = "JOHN"

cd ..

cd ..

cd merge

save "loc_unique JOHN.dta", replace

*














*********************************

* append models number of countries

use "loc_unique DELP.dta", clear 

append using "loc_unique IHME.dta"

append using "loc_unique IMPE.dta"

append using "loc_unique LANL.dta"

append using "loc_unique UCLA.dta"

append using "loc_unique YYGU.dta"

append using "loc_unique JOHN.dta"



* gen vars by models

gen loc_unique_DELP = loc_unique 
replace loc_unique_DELP = . if model != "DELP"

gen loc_unique_IHME = loc_unique 
replace loc_unique_IHME = . if model != "IHME"

gen loc_unique_IMPE = loc_unique 
replace loc_unique_IMPE = . if model != "IMPE"

gen loc_unique_LANL = loc_unique 
replace loc_unique_LANL = . if model != "LANL"

gen loc_unique_UCLA = loc_unique 
replace loc_unique_UCLA = . if model != "UCLA"

gen loc_unique_YYGU = loc_unique 
replace loc_unique_YYGU = . if model != "YYGU"

gen loc_unique_JOHN = loc_unique 
replace loc_unique_JOHN = . if model != "JOHN"


gen date = update_date

format date %tdDDMonCCYY

codebook date

qui compress

save "loc_unique ALL models.dta", replace







* gen date

clear

di td(01jan2020) // 21915

di td(01jan2022) // 22646

di td(01jan2022) - td(01jan2020) + 1 // 732



set obs 732

gen date = .

replace date = 21915 in 1

replace date = date[_n-1] + 1 in 2/l

replace date = date[_n-1] + 1 in 2/732

format date %tdDDMonCCYY

codebook date

save date.dta, replace



merge m:m date using "loc_unique ALL models.dta"

drop _merge

label var date "calendar date"
label var loc_unique "number of countries in model"
label var model "epidemic model"
label var loc_unique_DELP "number of countries in DELP model"
label var loc_unique_IHME "number of countries in IHME model"
label var loc_unique_IMPE "number of countries in IMPE model"
label var loc_unique_LANL "number of countries in LANL model"
label var loc_unique_UCLA "number of countries in UCLA model"
label var loc_unique_YYGU "number of countries in YYGU model"
label var loc_unique_JOHN "number of countries in JOHN"

save "loc_unique ALL models.dta", replace







**********************

* graphs number of countries


grstyle init

grstyle color background white



twoway ///
(connected loc_unique_DELP date, sort lcolor(red*.5) lwidth(medium) mcolor(red) msize(medsmall) msymbol(smcircle_hollow)) /// 
(connected loc_unique_IHME date, sort lcolor(black*.5) lwidth(medium) mcolor(black) msize(medsmall) msymbol(smcircle_hollow)) /// 
(connected loc_unique_IMPE date, sort lcolor(magenta*.5) lwidth(medium) mcolor(magenta) msize(medsmall) msymbol(smcircle_hollow)) /// 
(connected loc_unique_LANL date, sort lcolor(brown*.5) lwidth(medium) mcolor(brown) msize(medsmall) msymbol(smcircle_hollow)) /// 
(connected loc_unique_UCLA date, sort lcolor(blue*.5) lwidth(medium) mcolor(blue) msize(medsmall) msymbol(smcircle_hollow)) /// 
(connected loc_unique_YYGU date, sort lcolor(gold*.5) lwidth(medium) mcolor(gold) msize(medsmall) msymbol(smcircle_hollow)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(, grid) xlabel(, grid) xlabel(#37, format(%tdYY-NN-DD) labsize(small)) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Number of countries) title("Number of countries included in C 19 epidemic models, 2020-22", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "UCLA" 6 "YYGU") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) 

graph export "graph 301 Number of countries included in C 19 epidemic models, 2020-22.pdf", replace











view "log CovidLongitudinal merge.smcl"

log close

exit, clear




