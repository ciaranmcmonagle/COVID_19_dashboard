
# calculate_covidrates.R


## Calculate COVID-19 positivity, death and hopsitalisation rates in each Scottish Healthboard

library(readr)
library(dplyr)

covidcases = read_csv(file.path("processed_data","COVID","covidcases.csv"))
healthboad_pops = read_csv(file.path("processed_data","population","person_healthboard_2019.csv"))%>%
  rename(populations = AllAges)%>%
  select(HB, populations)


covidrates= left_join(covidcases,healthboad_pops, by="HB" )%>% # Join population data to the case data
  rowwise()%>%
  mutate(across(DailyPositive:HospitalAdmissions, function(x) (x/populations)*100000)) # Find the rate per 100,000 of each COVID case measure


write_csv(covidrates, "analysis_outputs/covid/covidrates.csv")

