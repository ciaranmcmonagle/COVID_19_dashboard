## download_healthboard_pops.R
## Downloads 2019 healthboard population data from NHS Scotland open data website


library(readr)
library(dplyr)

## Link to API which downloads dataset
url = "https://www.opendata.nhs.scot/dataset/7f010430-6ce1-4813-b25c-f7f335bdc4dc/resource/27a72cc8-d6d8-430c-8b4f-3109a9ceadb1/download/hb2019_pop_est_29062021.csv"


# Downloads file and places in raw_data folder.
download.file(url = url, # This is the url for the data you want to download
              destfile = file.path("raw_data","healthboard_pops.csv"), # This is where you want to store the data!
              mode = "wb")

read_csv(file.path("raw_data","healthboard_pops.csv"),
         col_types = cols(.default = col_character()))%>%
  head()

rm(list="url")
