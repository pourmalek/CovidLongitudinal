
***************************************************************************
* This is "do CovidLongitudinal merge.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Describe the predictive performance of models and assess the determinants                                                                       
***************************************************************************


*** input data files: "$pathCovidLongitudinal/countries/`country'/ALL MODELS `country' error - only error measures across models.dta", clear
**                   /// gets for each country, error measures across models data

**                   "$pathCovidLongitudinal/master/loc_grand_name.dta"
**                   /// gets master location grand name (loc_grand_name) data

**                   "$pathCovidLongitudinal/merge/WB_countries_Admin0_10mWB_countries_Admin0_10m.shp"
**                   "$pathCovidLongitudinal/merge/WB_countries_Admin0_10mWB_countries_Admin0_10m.dbf"
**                   /// get World Bank shape and dbf data for mapping countries, variable _ID


*** output data files: "ALL MODELS all countries error - only error measures across models.dta"
**                   /// saves data for error measures across models for all countries

**                    "ALL MODELS all countries error - only error measures across models - with WB.dta"
**                   /// saves data for error measures across models for all countries merged with 
**                   /// World Bank shape and dbf data for mapping countries, variable _ID

**                   "CovidLongitudinal_Final_Data_Dictionary.csv" 

**                   "world with country.dta"
**                   "world_shp.dta"
**                   /// saves World Bank shape and dbf data for mapping countries


*** output data dictionary files: "ALL MODELS all countries error - only error measures across models Data Dictionary.csv"
**                               "ALL MODELS all countries error - only error measures across models - with WB Data Dictionary.csv"


*** graphs:
** Map of countries by Absolute Percent Error for each model, using two sets of Deciles:

** "graph 101 a C19 daily deaths, DELP model, Absolute Percent Error, Deciles of MEANS model.pdf"
** "graph 101 b C19 daily deaths, DELP model, Absolute Percent Error, Deciles of DELP.pdf"
** "graph 102 a C19 daily deaths, IHME model, Absolute Percent Error, Deciles of MEANS model.pdf"
** "graph 102 b C19 daily deaths, IHME model, Absolute Percent Error, Deciles of IHME.pdf"
** "graph 103 a C19 daily deaths, IMPE model, Absolute Percent Error, Deciles of MEANS model.pdf"
** "graph 103 b C19 daily deaths, IMPE model, Absolute Percent Error, Deciles of IMPE.pdf"
** "graph 104 a C19 daily deaths, LANL model, Absolute Percent Error, Deciles of MEANS model.pdf"
** "graph 104 b C19 daily deaths, LANL model, Absolute Percent Error, Deciles of LANL.pdf"
** "graph 105 a C19 daily deaths, UCLA model, Absolute Percent Error, Deciles of MEANS model.pdf"
** "graph 105 b C19 daily deaths, UCLA model, Absolute Percent Error, Deciles of UCLA.pdf"
** "graph 106 a C19 daily deaths, YYGU model, Absolute Percent Error, Deciles of MEANS model.pdf"
** "graph 106 b C19 daily deaths, YYGU model, Absolute Percent Error, Deciles of YYGU.pdf"
** "graph 107 a C19 daily deaths, Mean of models, Absolute Percent Error, Deciles of MEANS model.pdf"
** "graph 107 b C19 daily deaths, Mean of models, Absolute Percent Error, Deciles of MEANS.pdf"


cd "$pathCovidLongitudinal/merge"

capture log close

log using "log CovidLongitudinal merge.smcl", replace 



* use the file for Afghanistan as frame and add each country

use "$pathCovidLongitudinal/countries/Afghanistan/ALL MODELS Afghanistan error - only error measures across models.dta", clear

local list `" "Afghanistan" "Albania" "Algeria" "Andorra" "Angola" "Antigua and Barbuda" "Argentina" "Armenia" "Australia" "Austria" "Azerbaijan" "Bahamas" "Bahrain" "Bangladesh" "Barbados" "Belarus" "Belgium" "Belize" "Benin" "Bhutan" "Bolivia" "Bosnia and Herzegovina" "Botswana" "Brazil" "Brunei" "Bulgaria" "Burkina Faso" "Burundi" "Cambodia" "Cameroon" "Canada" "Cape Verde" "Central African Republic" "Chad" "Chile" "China" "Colombia" "Comoros" "Congo" "Congo DR" "Costa Rica" "Cote d'Ivoire" "Croatia" "Cuba" "Cyprus" "Czechia" "Denmark" "Djibouti" "Dominican Republic" "Ecuador" "Egypt" "El Salvador" "Equatorial Guinea" "Eritrea" "Estonia" "Eswatini" "Ethiopia" "Fiji" "Finland" "France" "Gabon" "Gambia" "Georgia" "Germany" "Ghana" "Greece" "Grenada" "Guatemala" "Guinea" "Guinea Bissau" "Guyana" "Haiti" "Honduras" "Hungary" "Iceland" "India" "Indonesia" "Iran" "Iraq" "Ireland" "Israel" "Italy" "Jamaica" "Japan" "Jordan" "Kazakhstan" "Kenya" "Kiribati" "Korea North" "Korea South" "Kosovo" "Kuwait" "Kyrgyzstan" "Laos" "Latvia" "Lebanon" "Lesotho" "Liberia" "Libya" "Liechtenstein" "Lithuania" "Luxembourg" "Madagascar" "Malawi" "Malaysia" "Maldives" "Mali" "Malta" "Mauritania" "Mauritius" "Mexico" "Micronesia" "Moldova" "Monaco" "Mongolia" "Montenegro" "Morocco" "Mozambique" "Myanmar" "Namibia" "Nepal" "Netherlands" "New Zealand" "Nicaragua" "Niger" "Nigeria" "North Macedonia" "Norway" "Oman" "Pakistan" "Palestine" "Panama" "Papua New Guinea" "Paraguay" "Peru" "Philippines" "Poland" "Portugal" "Qatar" "Romania" "Russia" "Rwanda" "Saint Lucia" "Saint Vincent and the Grenadines" "Samoa" "San Marino" "Sao Tome and Principe" "Saudi Arabia" "Senegal" "Serbia" "Seychelles" "Sierra Leone" "Singapore" "Slovakia" "Slovenia" "Solomon Islands" "Somalia" "South Africa" "South Sudan" "Spain" "Sri Lanka" "Sudan" "Suriname" "Sweden" "Switzerland" "Syria" "Taiwan" "Tajikistan" "Tanzania" "Thailand" "Timor Leste" "Togo" "Tonga" "Trinidad and Tobago" "Tunisia" "Turkey" "Uganda" "Ukraine" "United Arab Emirates" "United Kingdom" "United States of America" "Uruguay" "Uzbekistan" "Vanuatu" "Venezuela" "Viet Nam" "Yemen" "Zambia" "Zimbabwe" "'

foreach country of local list {
	
	qui append using "$pathCovidLongitudinal/countries/`country'/ALL MODELS `country' error - only error measures across models.dta"

	
}
*


order DD_*_Errorr DD_*_AbsErr DD_*_PerErr DD_*_AbPeEr

order DD_UCLA_AbPeEr DD_YYGU_AbPeEr, after(DD_LANL_AbPeEr)

duplicates drop // in terms of all variables, that is the obs 1, Afghanistan, added as frame 

gen country_id_no = _n

label var country_id_no "Country ID number"

gen loc_grand_name = country // (for merge with "loc_grand_name.dta")

label var country "Country name"
label var iso "Country iso3 code"
label var loc_grand_name "Country grand name"

order country iso country_id_no loc_grand_name, first
 
qui compress

save "ALL MODELS all countries error - only error measures across models.dta", replace


******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS all countries error - only error measures across models Data Dictionary.csv", replace 
	
restore




*****************************************************

* add vars (region) form "loc_grand_name.dta"

cd ..

cd master

use "loc_grand_name.dta", clear 

cd ..

cd merge

merge m:m loc_grand_name using "ALL MODELS all countries error - only error measures across models.dta"

drop if _merge==1

drop _merge

replace region = "AMRO" if region == "AMRA"
replace region = "AMRO" if region == "AMRB"

compress

save "ALL MODELS all countries error - only error measures across models.dta", replace










*****************************************************
*****************************************************
*****************************************************

* Descriptives across 189 countries, by 4 error types and 6 models

* gen Average of Models for Daily Deaths Error, Global and regional
egen DD_MODELS_Errorr = rowmean(DD_DELP_Errorr DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr DD_UCLA_Errorr DD_YYGU_Errorr)
label var DD_MODELS_Errorr "Average Models Daily Deaths Error mean medians updates months"

* gen Average of Models for Daily Deaths Absolute Error, Global and regional
egen DD_MODELS_AbsErr = rowmean(DD_DELP_AbsErr DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr DD_UCLA_AbsErr DD_YYGU_AbsErr)
label var DD_MODELS_AbsErr "Average Models Daily Deaths Absolute Error mean medians updates months"

* gen Average of Models for Daily Deaths Percent Error, Global and regional
egen DD_MODELS_PerErr = rowmean(DD_DELP_PerErr DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr DD_UCLA_PerErr DD_YYGU_PerErr)
label var DD_MODELS_PerErr "Average Models Daily Deaths Percent Error mean medians updates months"

* gen Average of Models for Daily Deaths Absolute Percent Error, Global and regional
egen DD_MODELS_AbPeEr = rowmean(DD_DELP_AbPeEr DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr DD_UCLA_AbPeEr DD_YYGU_AbPeEr)
label var DD_MODELS_AbPeEr "Average Models Daily Deaths Absolute Percent Error mean medians updates months"


tabstat DD_*_Errorr DD_*_AbsErr DD_*_PerErr DD_*_AbPeEr, by(region) ///
columns(statistics) statistics(mean sd median iqr min max r n) format(%9.1fc) varwidth(16) 

** The above results are also saved in "Results Summary Statistics.xlsx", sheet Statistics


sort country_id_no


save "ALL MODELS all countries error - only error measures across models.dta", replace





*********************************************************

* The countries with min and max of all error types, Global


foreach var of varlist DD_DELP_Errorr DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr DD_UCLA_Errorr DD_YYGU_Errorr DD_MODELS_Errorr ///
DD_DELP_AbsErr DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr DD_UCLA_AbsErr DD_YYGU_AbsErr DD_MODELS_AbsErr ///
DD_DELP_PerErr DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr DD_UCLA_PerErr DD_YYGU_PerErr DD_MODELS_PerErr ///
DD_DELP_AbPeEr DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr DD_UCLA_AbPeEr DD_YYGU_AbPeEr DD_MODELS_AbPeEr {
	
	qui summ `var'
	
	di "---------------------------------------------------------"
	di in red "Global The country with mimimum " "`var'" " is: "
	
	qui gen `var'_min = r(min)
	
	di `r(min)'
	
	tab country if `var' == `var'_min
	
	*
	qui summ `var'
	
	di "`r'" "---------------------------------------------------------"
	di in red "Global The country with maximum " "`var'" " is: "
	
	qui gen `var'_max = r(max)
	
	di `r(max)'
	
	tab country if `var' == `var'_max
	
	*
	
	sort `var' country

	di "`var'" " sort"
	list `var' country if region != "", noobs clean // max at the end of the list
	
	* The above results are also saved in "Results Summary Statistics.xlsx", sheet Statistics

}







sort country_id_no





*********************************************************

* The countries with min and max of all error types, by region

* AFRO

foreach var of varlist DD_DELP_Errorr DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr DD_UCLA_Errorr DD_YYGU_Errorr DD_MODELS_Errorr ///
DD_DELP_AbsErr DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr DD_UCLA_AbsErr DD_YYGU_AbsErr DD_MODELS_AbsErr ///
DD_DELP_PerErr DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr DD_UCLA_PerErr DD_YYGU_PerErr DD_MODELS_PerErr ///
DD_DELP_AbPeEr DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr DD_UCLA_AbPeEr DD_YYGU_AbPeEr DD_MODELS_AbPeEr {
	
sort region `var' country

di "`var'" " sort"
list region `var' country if region != "" & region == "AFRO", noobs clean // max at the end of the list

}

* AMRO

foreach var of varlist DD_DELP_Errorr DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr DD_UCLA_Errorr DD_YYGU_Errorr DD_MODELS_Errorr ///
DD_DELP_AbsErr DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr DD_UCLA_AbsErr DD_YYGU_AbsErr DD_MODELS_AbsErr ///
DD_DELP_PerErr DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr DD_UCLA_PerErr DD_YYGU_PerErr DD_MODELS_PerErr ///
DD_DELP_AbPeEr DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr DD_UCLA_AbPeEr DD_YYGU_AbPeEr DD_MODELS_AbPeEr {
	
sort region `var' country

di "`var'" " sort"
list region `var' country if region != "" & region == "AMRO", noobs clean // max at the end of the list

}

* EMRO

foreach var of varlist DD_DELP_Errorr DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr DD_UCLA_Errorr DD_YYGU_Errorr DD_MODELS_Errorr ///
DD_DELP_AbsErr DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr DD_UCLA_AbsErr DD_YYGU_AbsErr DD_MODELS_AbsErr ///
DD_DELP_PerErr DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr DD_UCLA_PerErr DD_YYGU_PerErr DD_MODELS_PerErr ///
DD_DELP_AbPeEr DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr DD_UCLA_AbPeEr DD_YYGU_AbPeEr DD_MODELS_AbPeEr {
	
sort region `var' country

di "`var'" " sort"
list region `var' country if region != "" & region == "EMRO", noobs clean // max at the end of the list

}

* EURO

foreach var of varlist DD_DELP_Errorr DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr DD_UCLA_Errorr DD_YYGU_Errorr DD_MODELS_Errorr ///
DD_DELP_AbsErr DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr DD_UCLA_AbsErr DD_YYGU_AbsErr DD_MODELS_AbsErr ///
DD_DELP_PerErr DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr DD_UCLA_PerErr DD_YYGU_PerErr DD_MODELS_PerErr ///
DD_DELP_AbPeEr DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr DD_UCLA_AbPeEr DD_YYGU_AbPeEr DD_MODELS_AbPeEr {
	
sort region `var' country

di "`var'" " sort"
list region `var' country if region != "" & region == "EURO", noobs clean // max at the end of the list

}

* SEARO

foreach var of varlist DD_DELP_Errorr DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr DD_UCLA_Errorr DD_YYGU_Errorr DD_MODELS_Errorr ///
DD_DELP_AbsErr DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr DD_UCLA_AbsErr DD_YYGU_AbsErr DD_MODELS_AbsErr ///
DD_DELP_PerErr DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr DD_UCLA_PerErr DD_YYGU_PerErr DD_MODELS_PerErr ///
DD_DELP_AbPeEr DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr DD_UCLA_AbPeEr DD_YYGU_AbPeEr DD_MODELS_AbPeEr {
	
sort region `var' country

di "`var'" " sort"
list region `var' country if region != "" & region == "SEARO", noobs clean // max at the end of the list

}

* WPRO

foreach var of varlist DD_DELP_Errorr DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr DD_UCLA_Errorr DD_YYGU_Errorr DD_MODELS_Errorr ///
DD_DELP_AbsErr DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr DD_UCLA_AbsErr DD_YYGU_AbsErr DD_MODELS_AbsErr ///
DD_DELP_PerErr DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr DD_UCLA_PerErr DD_YYGU_PerErr DD_MODELS_PerErr ///
DD_DELP_AbPeEr DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr DD_UCLA_AbPeEr DD_YYGU_AbPeEr DD_MODELS_AbPeEr {
	
sort region `var' country

di "`var'" " sort"
list region `var' country if region != "" & region == "WPRO", noobs clean // max at the end of the list

}












*****************************************************
*****************************************************
*****************************************************

* Maps





** downlaod "World Country Polygons - Very High Definition" shape and data files

/* first remove previously downloaded zip file and directory

capture shell rm -r "wb_countries_admin0_10m.zip"

capture shell rm -r "WB_countries_Admin0_10m" */

* downlaod wb_countries_admin0_10m.zip 
* from https://datacatalog.worldbank.org/search/dataset/0038272/World-Bank-Official-Boundaries
* Link: blob:https://datacatalog.worldbank.org/bd5b75c5-eeab-462b-9817-8a27a9573962


* Stata as of Stata/MP 18.0 cannot perform without error the following unzipfile command
* . unzipfile wb_countries_admin0_10m.zip
* Error:
* zip END header not found
*    File wb_countries_admin0_10m.zip not a zip archive.

* as such, ___MANUALLY DOWNLOAD___ the wb_countries_admin0_10m.zip 
* from https://datacatalog.worldbank.org/search/dataset/0038272/World-Bank-Official-Boundaries
* where the name of the download link to look for is "World Country Polygons - Very High Definition"
* and ___SAVE___ it in /CovidLongitudinal-main/code/merge/
* and ___UNZIP___ it 

/* copy https://datacatalog.worldbank.org/bd5b75c5-eeab-462b-9817-8a27a9573962 wb_countries_admin0_10m.zip

unzipfile "wb_countries_admin0_10m.zip" */


cd "WB_countries_Admin0_10m"

* create files "world_shp.dta: and "world.dta"

spshape2dta WB_countries_Admin0_10m, replace saving(world)


* save the two files in /CovidLongitudinal-main/code/merge/

use "world_shp.dta", clear

describe

cd ..

save "world_shp.dta", replace


cd "WB_countries_Admin0_10m"

use "world.dta", clear

describe


tab FORMAL_EN

capture drop country
gen country = ""
replace country = "American Samoa" if FORMAL_EN == "American Samoa"
replace country = "Antigua and Barbuda" if FORMAL_EN == "Antigua and Barbuda"
replace country = "Egypt" if FORMAL_EN == "Arab Republic of Egypt"
replace country = "Argentina" if FORMAL_EN == "Argentine Republic"
replace country = "Aruba" if FORMAL_EN == "Aruba"
replace country = "Guernsey" if FORMAL_EN == "Bailiwick of Guernsey"
replace country = "Jersey" if FORMAL_EN == "Bailiwick of Jersey"
replace country = "Barbados" if FORMAL_EN == "Barbados"
replace country = "Belize" if FORMAL_EN == "Belize"
replace country = "Venezuela" if FORMAL_EN == "Bolivarian Republic of Venezuela"
replace country = "Bosnia and Herzegovina" if FORMAL_EN == "Bosnia and Herzegovina"
replace country = "British Virgin Islands" if FORMAL_EN == "British Virgin Islands"
replace country = "Burkina Faso" if FORMAL_EN == "Burkina Faso"
replace country = "Canada" if FORMAL_EN == "Canada"
replace country = "Cayman Islands" if FORMAL_EN == "Cayman Islands"
replace country = "Central African Republic" if FORMAL_EN == "Central African Republic"
replace country = "Guyana" if FORMAL_EN == "Co-operative Republic of Guyana"
replace country = "Australia" if FORMAL_EN == "Commonwealth of Australia"
replace country = "Commonwealth of Dominica" if FORMAL_EN == "Commonwealth of Dominica"
replace country = "Commonwealth of Puerto Rico" if FORMAL_EN == "Commonwealth of Puerto Rico"
replace country = "Bahamas" if FORMAL_EN == "Commonwealth of the Bahamas"
replace country = "Northern Mariana Islands" if FORMAL_EN == "Commonwealth of the Northern Mariana Islands"
replace country = "Curacao" if FORMAL_EN == "Curaçao"
replace country = "Czechia" if FORMAL_EN == "Czech Republic"
replace country = "Korea North" if FORMAL_EN == "Democratic People's Republic of Korea"
replace country = "Sao Tome and Principe" if FORMAL_EN == "Democratic Republic of São Tomé and Principe"
replace country = "Congo DR" if FORMAL_EN == "Democratic Republic of the Congo"
replace country = "Timor Leste" if FORMAL_EN == "Democratic Republic of Timor-Leste"
replace country = "Sri Lanka" if FORMAL_EN == "Democratic Socialist Republic of Sri Lanka"
replace country = "Dominican Republic" if FORMAL_EN == "Dominican Republic"
replace country = "Falkland Islands" if FORMAL_EN == "Falkland Islands"
replace country = "Ethiopia" if FORMAL_EN == "Federal Democratic Republic of Ethiopia"
replace country = "Germany" if FORMAL_EN == "Federal Republic of Germany"
replace country = "Nigeria" if FORMAL_EN == "Federal Republic of Nigeria"
replace country = "Somalia" if FORMAL_EN == "Federal Republic of Somalia"
replace country = "Micronesia" if FORMAL_EN == "Federated States of Micronesia"
replace country = "Saint Kitts and Nevis" if FORMAL_EN == "Federation of Saint Kitts and Nevis"
replace country = "Brazil" if FORMAL_EN == "Federative Republic of Brazil"
replace country = "North Macedonia" if FORMAL_EN == "Former Yugoslav Republic of Macedonia"
replace country = "Faroe Islands" if FORMAL_EN == "Føroyar Is. (Faeroe Is.)"
replace country = "French Polynesia" if FORMAL_EN == "French Polynesia"
replace country = "France" if FORMAL_EN == "French Republic"
replace country = "Gabon" if FORMAL_EN == "Gabonese Republic"
replace country = "Georgia" if FORMAL_EN == "Georgia"
replace country = "Luxembourg" if FORMAL_EN == "Grand Duchy of Luxembourg"
replace country = "Greenland" if FORMAL_EN == "Greenland"
replace country = "Grenada" if FORMAL_EN == "Grenada"
replace country = "Jordan" if FORMAL_EN == "Hashemite Kingdom of Jordan"
replace country = "Greece" if FORMAL_EN == "Hellenic Republic"
replace country = "Papua New Guinea" if FORMAL_EN == "Independent State of Papua New Guinea"
replace country = "Samoa" if FORMAL_EN == "Independent State of Samoa"
replace country = "Ireland" if FORMAL_EN == "Ireland"
replace country = "Iran" if FORMAL_EN == "Islamic Republic of Iran"
replace country = "Mauritania" if FORMAL_EN == "Islamic Republic of Mauritania"
replace country = "Pakistan" if FORMAL_EN == "Islamic Republic of Pakistan"
replace country = "Afghanistan" if FORMAL_EN == "Islamic State of Afghanistan"
replace country = "Italy" if FORMAL_EN == "Italian Republic"
replace country = "Jamaica" if FORMAL_EN == "Jamaica"
replace country = "Japan" if FORMAL_EN == "Japan"
replace country = "Bahrain" if FORMAL_EN == "Kingdom of Bahrain"
replace country = "Belgium" if FORMAL_EN == "Kingdom of Belgium"
replace country = "Bhutan" if FORMAL_EN == "Kingdom of Bhutan"
replace country = "Cambodia" if FORMAL_EN == "Kingdom of Cambodia"
replace country = "Denmark" if FORMAL_EN == "Kingdom of Denmark"
replace country = "Eswatini" if FORMAL_EN == "Kingdom of eSwatini"
replace country = "Lesotho" if FORMAL_EN == "Kingdom of Lesotho"
replace country = "Morocco" if FORMAL_EN == "Kingdom of Morocco"
replace country = "Norway" if FORMAL_EN == "Kingdom of Norway"
replace country = "Saudi Arabia" if FORMAL_EN == "Kingdom of Saudi Arabia"
replace country = "Spain" if FORMAL_EN == "Kingdom of Spain"
replace country = "Sweden" if FORMAL_EN == "Kingdom of Sweden"
replace country = "Thailand" if FORMAL_EN == "Kingdom of Thailand"
replace country = "Netherlands" if FORMAL_EN == "Kingdom of the Netherlands" & _ID == 238 // mainland
replace country = "Tonga" if FORMAL_EN == "Kingdom of Tonga"
replace country = "Kyrgyzstan" if FORMAL_EN == "Kyrgyz Republic"
replace country = "Laos" if FORMAL_EN == "Lao People's Democratic Republic"
replace country = "Lebanon" if FORMAL_EN == "Lebanese Republic"
replace country = "Libya" if FORMAL_EN == "Libya"
replace country = "Macao" if FORMAL_EN == "Macao Special Administrative Region, PRC"
replace country = "Malaysia" if FORMAL_EN == "Malaysia"
replace country = "Mongolia" if FORMAL_EN == "Mongolia"
replace country = "Montenegro" if FORMAL_EN == "Montenegro"
replace country = "Brunei" if FORMAL_EN == "Negara Brunei Darussalam"
replace country = "Nepal" if FORMAL_EN == "Nepal"
replace country = "New Caledonia" if FORMAL_EN == "New Caledonia"
replace country = "New Zealand" if FORMAL_EN == "New Zealand" & _ID == 251 // mainland
replace country = "Uruguay" if FORMAL_EN == "Oriental Republic of Uruguay"
replace country = "Algeria" if FORMAL_EN == "People's Democratic Republic of Algeria"
replace country = "Angola" if FORMAL_EN == "People's Republic of Angola"
replace country = "Bangladesh" if FORMAL_EN == "People's Republic of Bangladesh"
replace country = "China" if FORMAL_EN == "People's Republic of China"
replace country = "Pitcairn" if FORMAL_EN == "Pitcairn, Henderson, Ducie and Oeno Islands"
replace country = "Bolivia" if FORMAL_EN == "Plurinational State of Bolivia"
replace country = "Portugal" if FORMAL_EN == "Portuguese Republic"
replace country = "Andorra" if FORMAL_EN == "Principality of Andorra"
replace country = "Liechtenstein" if FORMAL_EN == "Principality of Liechtenstein"
replace country = "Monaco" if FORMAL_EN == "Principality of Monaco"
replace country = "Albania" if FORMAL_EN == "Republic of Albania"
replace country = "Armenia" if FORMAL_EN == "Republic of Armenia"
replace country = "Austria" if FORMAL_EN == "Republic of Austria"
replace country = "Azerbaijan" if FORMAL_EN == "Republic of Azerbaijan"
replace country = "Belarus" if FORMAL_EN == "Republic of Belarus"
replace country = "Benin" if FORMAL_EN == "Republic of Benin"
replace country = "Botswana" if FORMAL_EN == "Republic of Botswana"
replace country = "Bulgaria" if FORMAL_EN == "Republic of Bulgaria"
replace country = "Burundi" if FORMAL_EN == "Republic of Burundi"
replace country = "Cape Verde" if FORMAL_EN == "Republic of Cabo Verde"
replace country = "Cameroon" if FORMAL_EN == "Republic of Cameroon"
replace country = "Chad" if FORMAL_EN == "Republic of Chad"
replace country = "Chile" if FORMAL_EN == "Republic of Chile"
replace country = "Colombia" if FORMAL_EN == "Republic of Colombia"
replace country = "Costa Rica" if FORMAL_EN == "Republic of Costa Rica"
replace country = "Croatia" if FORMAL_EN == "Republic of Croatia"
replace country = "Cuba" if FORMAL_EN == "Republic of Cuba"
replace country = "Cyprus" if FORMAL_EN == "Republic of Cyprus"
replace country = "Djibouti" if FORMAL_EN == "Republic of Djibouti"
replace country = "Ecuador" if FORMAL_EN == "Republic of Ecuador"
replace country = "El Salvador" if FORMAL_EN == "Republic of El Salvador"
replace country = "Equatorial Guinea" if FORMAL_EN == "Republic of Equatorial Guinea"
replace country = "Estonia" if FORMAL_EN == "Republic of Estonia"
replace country = "Fiji" if FORMAL_EN == "Republic of Fiji"
replace country = "Finland" if FORMAL_EN == "Republic of Finland"
replace country = "Ghana" if FORMAL_EN == "Republic of Ghana"
replace country = "Guatemala" if FORMAL_EN == "Republic of Guatemala"
replace country = "Guinea" if FORMAL_EN == "Republic of Guinea"
replace country = "Guinea Bissau" if FORMAL_EN == "Republic of Guinea-Bissau"
replace country = "Haiti" if FORMAL_EN == "Republic of Haiti"
replace country = "Honduras" if FORMAL_EN == "Republic of Honduras"
replace country = "Hungary" if FORMAL_EN == "Republic of Hungary"
replace country = "Iceland" if FORMAL_EN == "Republic of Iceland"
replace country = "India" if FORMAL_EN == "Republic of India"
replace country = "Indonesia" if FORMAL_EN == "Republic of Indonesia"
replace country = "Iraq" if FORMAL_EN == "Republic of Iraq"
replace country = "Cote d'Ivoire" if FORMAL_EN == "Republic of Ivory Coast"
replace country = "Kazakhstan" if FORMAL_EN == "Republic of Kazakhstan"
replace country = "Kenya" if FORMAL_EN == "Republic of Kenya"
replace country = "Kiribati" if FORMAL_EN == "Republic of Kiribati"
replace country = "Korea South" if FORMAL_EN == "Republic of Korea"
replace country = "Kosovo" if FORMAL_EN == "Republic of Kosovo"
replace country = "Latvia" if FORMAL_EN == "Republic of Latvia"
replace country = "Liberia" if FORMAL_EN == "Republic of Liberia"
replace country = "Lithuania" if FORMAL_EN == "Republic of Lithuania"
replace country = "Madagascar" if FORMAL_EN == "Republic of Madagascar"
replace country = "Malawi" if FORMAL_EN == "Republic of Malawi"
replace country = "Maldives" if FORMAL_EN == "Republic of Maldives"
replace country = "Mali" if FORMAL_EN == "Republic of Mali"
replace country = "Malta" if FORMAL_EN == "Republic of Malta"
replace country = "Mauritius" if FORMAL_EN == "Republic of Mauritius"
replace country = "Moldova" if FORMAL_EN == "Republic of Moldova"
replace country = "Mozambique" if FORMAL_EN == "Republic of Mozambique"
replace country = "Namibia" if FORMAL_EN == "Republic of Namibia"
replace country = "Nauru" if FORMAL_EN == "Republic of Nauru"
replace country = "Nicaragua" if FORMAL_EN == "Republic of Nicaragua"
replace country = "Niger" if FORMAL_EN == "Republic of Niger"
replace country = "Palau" if FORMAL_EN == "Republic of Palau"
replace country = "Panama" if FORMAL_EN == "Republic of Panama"
replace country = "Paraguay" if FORMAL_EN == "Republic of Paraguay"
replace country = "Peru" if FORMAL_EN == "Republic of Peru"
replace country = "Poland" if FORMAL_EN == "Republic of Poland"
replace country = "Rwanda" if FORMAL_EN == "Republic of Rwanda"
replace country = "San Marino" if FORMAL_EN == "Republic of San Marino"
replace country = "Senegal" if FORMAL_EN == "Republic of Senegal"
replace country = "Serbia" if FORMAL_EN == "Republic of Serbia"
replace country = "Seychelles" if FORMAL_EN == "Republic of Seychelles"
replace country = "Sierra Leone" if FORMAL_EN == "Republic of Sierra Leone"
replace country = "Singapore" if FORMAL_EN == "Republic of Singapore"
replace country = "Slovenia" if FORMAL_EN == "Republic of Slovenia"
replace country = "South Africa" if FORMAL_EN == "Republic of South Africa"
replace country = "South Sudan" if FORMAL_EN == "Republic of South Sudan"
replace country = "Suriname" if FORMAL_EN == "Republic of Suriname"
replace country = "Tajikistan" if FORMAL_EN == "Republic of Tajikistan"
replace country = "Congo" if FORMAL_EN == "Republic of the Congo"
replace country = "Gambia" if FORMAL_EN == "Republic of the Gambia"
replace country = "Marshall Islands" if FORMAL_EN == "Republic of the Marshall Islands"
replace country = "Philippines" if FORMAL_EN == "Republic of the Philippines"
replace country = "Sudan" if FORMAL_EN == "Republic of the Sudan"
replace country = "Myanmar" if FORMAL_EN == "Republic of the Union of Myanmar"
replace country = "Trinidad and Tobago" if FORMAL_EN == "Republic of Trinidad and Tobago"
replace country = "Tunisia" if FORMAL_EN == "Republic of Tunisia"
replace country = "Turkey" if FORMAL_EN == "Republic of Turkey"
replace country = "Uganda" if FORMAL_EN == "Republic of Uganda"
replace country = "Uzbekistan" if FORMAL_EN == "Republic of Uzbekistan"
replace country = "Vanuatu" if FORMAL_EN == "Republic of Vanuatu"
replace country = "Yemen" if FORMAL_EN == "Republic of Yemen"
replace country = "Zambia" if FORMAL_EN == "Republic of Zambia"
replace country = "Zimbabwe" if FORMAL_EN == "Republic of Zimbabwe"
replace country = "Romania" if FORMAL_EN == "Romania"
replace country = "Russia" if FORMAL_EN == "Russian Federation"
replace country = "Saint Lucia" if FORMAL_EN == "Saint Lucia"
replace country = "Saint Pierre and Miquelon" if FORMAL_EN == "Saint Pierre and Miquelon"
replace country = "Saint Vincent and the Grenadines" if FORMAL_EN == "Saint Vincent and the Grenadines"
replace country = "Saint-Barthelemy" if FORMAL_EN == "Saint-Barthélemy"
replace country = "Saint-Martin French" if FORMAL_EN == "Saint-Martin (French part)"
replace country = "Sint Maarten Dutch" if FORMAL_EN == "Sint Maarten (Dutch part)"
replace country = "Slovakia" if FORMAL_EN == "Slovak Republic"
replace country = "Viet Nam" if FORMAL_EN == "Socialist Republic of Vietnam"
replace country = "South Georgia" if FORMAL_EN == "South Georgia and the Islands"
replace country = "Eritrea" if FORMAL_EN == "State of Eritrea"
replace country = "Israel" if FORMAL_EN == "State of Israel"
replace country = "Kuwait" if FORMAL_EN == "State of Kuwait"
replace country = "Qatar" if FORMAL_EN == "State of Qatar"
replace country = "Vatican" if FORMAL_EN == "State of the Vatican City"
replace country = "Oman" if FORMAL_EN == "Sultanate of Oman"
replace country = "Switzerland" if FORMAL_EN == "Swiss Confederation"
replace country = "Syria" if FORMAL_EN == "Syrian Arab Republic"
replace country = "Guam" if FORMAL_EN == "Territory of Guam"
replace country = "Heard Island" if FORMAL_EN == "Territory of Heard Island and McDonald Islands"
replace country = "Norfolk Island" if FORMAL_EN == "Territory of Norfolk Island"
replace country = "French Southern and Antarctic Lands" if FORMAL_EN == "Territory of the French Southern and Antarctic Lands"
replace country = "Bermuda" if FORMAL_EN == "The Bermudas or Somers Isles"
replace country = "Togo" if FORMAL_EN == "Togolese Republic"
replace country = "Turkmenistan" if FORMAL_EN == "Turkmenistan"
replace country = "Turks and Caicos Islands" if FORMAL_EN == "Turks and Caicos Islands"
replace country = "Tuvalu" if FORMAL_EN == "Tuvalu"
replace country = "Ukraine" if FORMAL_EN == "Ukraine"
replace country = "Comoros" if FORMAL_EN == "Union of the Comoros"
replace country = "United Arab Emirates" if FORMAL_EN == "United Arab Emirates"
replace country = "United Kingdom" if FORMAL_EN == "United Kingdom of Great Britain and Northern Ireland"
replace country = "Mexico" if FORMAL_EN == "United Mexican States"
replace country = "Tanzania" if FORMAL_EN == "United Republic of Tanzania"
replace country = "United States of America" if FORMAL_EN == "United States of America"
replace country = "Virgin Islands of the United States" if FORMAL_EN == "Virgin Islands of the United States"
replace country = "Wallis and Futuna Islands" if FORMAL_EN == "Wallis and Futuna Islands"
replace country = "Palestine" if FORMAL_EN == "West Bank and Gaza" 


list country FORMAL_EN


gen country_NotIn_189countries = 0
label var country_NotIn_189countries "This country or location not in 189 countries list of this study"

replace country_NotIn_189countries = 1 if country == "American Samoa"
replace country_NotIn_189countries = 1 if country == "Arub"
replace country_NotIn_189countries = 1 if country == "Bermuda"
replace country_NotIn_189countries = 1 if country == "British Virgin Islands"
replace country_NotIn_189countries = 1 if country == "Cayman Islands"
replace country_NotIn_189countries = 1 if country == "Commonwealth of Dominica"
replace country_NotIn_189countries = 1 if country == "Commonwealth of Puerto Rico"
replace country_NotIn_189countries = 1 if country == "Curacao"
replace country_NotIn_189countries = 1 if country == "Falkland Islands"
replace country_NotIn_189countries = 1 if country == "Faroe Islands"
replace country_NotIn_189countries = 1 if country == "French Polynesia"
replace country_NotIn_189countries = 1 if country == "French Southern and Antarctic Lands"
replace country_NotIn_189countries = 1 if country == "Greenland"
replace country_NotIn_189countries = 1 if country == "Guam"
replace country_NotIn_189countries = 1 if country == "Guernsey"
replace country_NotIn_189countries = 1 if country == "Heard Island"
replace country_NotIn_189countries = 1 if country == "Hong Kong"
replace country_NotIn_189countries = 1 if country == "Jersey"
replace country_NotIn_189countries = 1 if country == "Macao"
replace country_NotIn_189countries = 1 if country == "Marshall Islands"
replace country_NotIn_189countries = 1 if country == "Nauru"
replace country_NotIn_189countries = 1 if country == "New Caledonia"
replace country_NotIn_189countries = 1 if country == "Norfolk Island"
replace country_NotIn_189countries = 1 if country == "Northern Mariana Islands"
replace country_NotIn_189countries = 1 if country == "Palau"
replace country_NotIn_189countries = 1 if country == "Pitcairn"
replace country_NotIn_189countries = 1 if country == "Saint Kitts and Nevis"
replace country_NotIn_189countries = 1 if country == "Saint Pierre and Miquelon"
replace country_NotIn_189countries = 1 if country == "Saint-Barthelemy"
replace country_NotIn_189countries = 1 if country == "Saint-Martin French"
replace country_NotIn_189countries = 1 if country == "Sint Maarten Dutch"
replace country_NotIn_189countries = 1 if country == "South Georgia"
replace country_NotIn_189countries = 1 if country == "Turkmenistan"
replace country_NotIn_189countries = 1 if country == "Turks and Caicos Islands"
replace country_NotIn_189countries = 1 if country == "Tuvalu"
replace country_NotIn_189countries = 1 if country == "Vatican"
replace country_NotIn_189countries = 1 if country == "Virgin Islands of the United States"
replace country_NotIn_189countries = 1 if country == "Wallis and Futuna Islands"



* use WB_NAME for:
replace country = "Guantanamo Bay US" if _ID == 130
replace country = "Gibraltar UK" if _ID == 149
replace country = "Montserrat UK" if _ID == 190
replace country = "Anguilla UK" if _ID == 196
replace country = "Saint Helena UK" if _ID == 202
replace country = "Isle of Man UK" if _ID == 210
replace country = "British Indian Ocean Territory UK" if _ID == 212
replace country = "Cook Islands NZ" if _ID == 215
replace country = "Solomon Islands" if _ID == 219
replace country = "Niue NZ" if _ID == 227
replace country = "Clipperton Island Fr" if _ID == 233
replace country = "Bonaire Neth" if _ID == 235
replace country = "Sint Eustatius Neth" if _ID == 236
replace country = "Saba Neth" if _ID == 237
replace country = "Cocos Keeling Islands Aus" if _ID == 239
replace country = "Christmas Island Aus" if _ID == 240
replace country = "Johnston Atoll US" if _ID == 241
replace country = "Jarvis Island US" if _ID == 242
replace country = "Baker Island US" if _ID == 243
replace country = "Howland Island US" if _ID == 244
replace country = "Wake Island US" if _ID == 245
replace country = "Midway Islands US" if _ID == 246
replace country = "Navassa Island US" if _ID == 247
replace country = "Palmyra Atoll US" if _ID == 248
replace country = "Kingman Reef US" if _ID == 249
replace country = "Tokelau NZ" if _ID == 250




cd ..

save "world with country.dta", replace



* use local data and merge with World Bank shape data 

use "ALL MODELS all countries error - only error measures across models.dta", clear

merge 1:m country using "world with country.dta", keepusing(_ID) 

list country if _merge == 1 // Taiwan not available in World Bank shape data file


order (loc_grand_order-mappingcolormeaning), last

order loc_grand_name_numlabel loc_grand_name_snail, after(loc_grand_id)

order country iso country_id_no, first

gsort - _merge country 

rename _merge _merge_errors_loc_grand_order

sort loc_grand_order

drop if country_id_no == . 

order DD_MODELS_Errorr DD_MODELS_AbsErr DD_MODELS_PerErr DD_MODELS_AbPeEr, after(country_id_no)

compress

save "ALL MODELS all countries error - only error measures across models - with WB.dta", replace

export excel using "CovidLongitudinal_Final_Data.xlsx", firstrow(variables) replace


******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS all countries error - only error measures across models - with WB Data Dictionary.csv", replace 
	
	export delimited name varlab using "CovidLongitudinal_Final_Data_Dictionary.csv", replace 

restore



***************************************

/* MAPS

Predicative performance error measures for COVID-19 daily deaths in international periodically updated 
epidemic models 2020-2022 by country


For each model, two maps are shown that use different color schemes for error measures: 
(a) deciles of mean error measures of all epidemic models, and 
(b) deciles of error measures of the individual epidemic model. 

The first map facilitates comparison across all models, but with less color differentiation within the model. 
The second map differentiates countries within each individual model, 
but comparison across all models is not facilitated due to different color schemes.

*/



* set scheme white_tableau for maps

set scheme white_tableau


pctile DD_MODELS_AbPeEr_pct = DD_MODELS_AbPeEr, nq(10)
list DD_MODELS_AbPeEr_pct in 1/10

drop DD_MODELS_AbPeEr_pct

* But copy deciles from -clnum(10)- subcommand of -grmap-
* 3.5 96.3 149.0 195.7 296.6 449.6 779.5 1367.1 2695.7 5262.6 23695.1
* and replace the max value of DD_MODELS_AbPeEr that is 23695.1, 
* with the max value of _AbPeEr across all models, that is 
* 85,149.2 from DD_DELP_AbPeEr, in order to be inclusive of countries of 
* countries whose DD_`model'_AbPeEr is lrger than 23695.1




* Graph Map C19 daily deaths, DELP model, Absolute Percent Error

colorpalette viridis, n(12) nograph reverse 
local colors `r(p)'

format DD_DELP_AbPeEr %5.1fc


* use Deciles of MEANS model

grmap DD_DELP_AbPeEr using world_shp, id(_ID) ///
clmethod(custom) clbreaks(3.5 96.3 149.0 195.7 296.6 449.6 779.5 1367.1 2695.7 5262.6 85149.2) ///
fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, DELP model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 101 a C19 daily deaths, DELP model, Absolute Percent Error, Deciles of MEANS model.pdf", replace


* use Deciles of DELP model

grmap DD_DELP_AbPeEr using world_shp, id(_ID) ///
clnum(10) fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, DELP model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 101 b C19 daily deaths, DELP model, Absolute Percent Error, Deciles of DELP.pdf", replace







* Graph Map C19 daily deaths, IHME model, Absolute Percent Error

colorpalette viridis, n(12) nograph reverse 
local colors `r(p)'

format DD_IHME_AbPeEr %5.1fc


* use Deciles of MEANS model

grmap DD_IHME_AbPeEr using world_shp, id(_ID) ///
clmethod(custom) clbreaks(3.5 96.3 149.0 195.7 296.6 449.6 779.5 1367.1 2695.7 5262.6 85149.2) ///
fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, IHME model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 102 a C19 daily deaths, IHME model, Absolute Percent Error, Deciles of MEANS model.pdf", replace


* use Deciles of IHME model

grmap DD_IHME_AbPeEr using world_shp, id(_ID) ///
clnum(10) fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, IHME model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 102 b C19 daily deaths, IHME model, Absolute Percent Error, Deciles of IHME.pdf", replace






* Graph Map C19 daily deaths, IMPE model, Absolute Percent Error

colorpalette viridis, n(12) nograph reverse 
local colors `r(p)'

format DD_IMPE_AbPeEr %5.1fc


* use Deciles of MEANS model

grmap DD_IMPE_AbPeEr using world_shp, id(_ID) ///
clmethod(custom) clbreaks(3.5 96.3 149.0 195.7 296.6 449.6 779.5 1367.1 2695.7 5262.6 85149.2) ///
fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, IMPE model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 103 a C19 daily deaths, IMPE model, Absolute Percent Error, Deciles of MEANS model.pdf", replace


* use Deciles of IMPE model

grmap DD_IMPE_AbPeEr using world_shp, id(_ID) ///
clnum(10) fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, IMPE model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 103 b C19 daily deaths, IMPE model, Absolute Percent Error, Deciles of IMPE.pdf", replace






* Graph Map C19 daily deaths, LANL model, Absolute Percent Error

colorpalette viridis, n(12) nograph reverse 
local colors `r(p)'

format DD_LANL_AbPeEr %5.1fc


* use Deciles of MEANS model

grmap DD_LANL_AbPeEr using world_shp, id(_ID) ///
clmethod(custom) clbreaks(3.5 96.3 149.0 195.7 296.6 449.6 779.5 1367.1 2695.7 5262.6 85149.2) ///
fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, LANL model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 104 a C19 daily deaths, LANL model, Absolute Percent Error, Deciles of MEANS model.pdf", replace


* use Deciles of LANL model

grmap DD_LANL_AbPeEr using world_shp, id(_ID) ///
clnum(10) fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, LANL model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 104 b C19 daily deaths, LANL model, Absolute Percent Error, Deciles of LANL.pdf", replace





* Graph Map C19 daily deaths, UCLA model, Absolute Percent Error

colorpalette viridis, n(12) nograph reverse 
local colors `r(p)'

format DD_UCLA_AbPeEr %5.1fc


* use Deciles of MEANS model

grmap DD_UCLA_AbPeEr using world_shp, id(_ID) ///
clmethod(custom) clbreaks(3.5 96.3 149.0 195.7 296.6 449.6 779.5 1367.1 2695.7 5262.6 85149.2) ///
fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, UCLA model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 105 a C19 daily deaths, UCLA model, Absolute Percent Error, Deciles of MEANS model.pdf", replace


* use Deciles of UCLA model

grmap DD_UCLA_AbPeEr using world_shp, id(_ID) ///
clnum(10) fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, UCLA model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 105 b C19 daily deaths, UCLA model, Absolute Percent Error, Deciles of UCLA.pdf", replace





* Graph Map C19 daily deaths, YYGU model, Absolute Percent Error

colorpalette viridis, n(12) nograph reverse 
local colors `r(p)'

format DD_YYGU_AbPeEr %5.1fc


* use Deciles of MEANS model

grmap DD_YYGU_AbPeEr using world_shp, id(_ID) ///
clmethod(custom) clbreaks(3.5 96.3 149.0 195.7 296.6 449.6 779.5 1367.1 2695.7 5262.6 85149.2) ///
fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, YYGU model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 106 a C19 daily deaths, YYGU model, Absolute Percent Error, Deciles of MEANS model.pdf", replace


* use Deciles of YYGU model

grmap DD_YYGU_AbPeEr using world_shp, id(_ID) ///
clnum(10) fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, YYGU model, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 106 b C19 daily deaths, YYGU model, Absolute Percent Error, Deciles of YYGU.pdf", replace





* Graph Map C19 daily deaths, MEANS model, Absolute Percent Error

colorpalette viridis, n(12) nograph reverse 
local colors `r(p)'

format DD_MODELS_AbPeEr %5.1fc



* use Deciles of MEANS model

grmap DD_MODELS_AbPeEr using world_shp, id(_ID) ///
clnum(10) fcolor("`colors'") ocolor(white ..) osize(0.05 ..) ///
legstyle(2) legend(pos(7) size(2.8) region(fcolor(gs15))) ///
title("C19 daily deaths, Mean of models, Absolute Percent Error, 2020-2022", size(4)) 

graph export "graph 107 C19 daily deaths, Mean of models, Absolute Percent Error, Deciles of MEANS.pdf", replace



*

save "CovidLongitudinal_Final_Data.dta", replace


view "log CovidLongitudinal merge.smcl"

log close _all

exit, clear



