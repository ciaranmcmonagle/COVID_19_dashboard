## process_covidcases.R

## Processes the COVID-19 case data to extract the date, healthboard name and code, daily positive cases, cumulative positive cases, daily deaths, cumulative deaths, ICU admissiona and hospital admissions

library(readr)
library(dplyr)

dir.create(file.path("processed_data","COVID"))

read_csv(file.path("raw_data","covidcases.csv"),
         col_types = cols(.default=col_character()))%>%
  select(Date, HB,HBName,DailyPositive, CumulativePositive,DailyDeaths,CumulativeDeaths,ICUAdmissions,HospitalAdmissions)%>%
  write_csv(file.path("processed_data","COVID","covidcases.csv"))
