
## download_covidcases.R
## Downloads COVID19 case data from NHS Scotland open data website


library(stringr)
library(readr)
library(lubridate)
library(dplyr)

## Link to API which downloads dataset
"https://www.opendata.nhs.scot/dataset/b318bddf-a4dc-4262-971f-0ba329e09b87/resource/7fad90e5-6f19-455b-bc07-694a22f8d5dc/download/total_cases_by_hb_20220223.csv"

url = "https://www.opendata.nhs.scot/dataset/b318bddf-a4dc-4262-971f-0ba329e09b87/resource/2dd8534b-0a6f-4744-9253-9565d62f96c2/download/trend_hb_20220223.csv"


# Downloads file and places in raw_data folder.
download.file(url = url, # This is the url for the data you want to download
              destfile = file.path("raw_data","covidcases.csv"), # This is where you want to store the data!
              mode = "wb")

read_csv(file.path("raw_data","covidcases.csv"),
         col_types = cols(.default = col_character()))%>%
  head()

# We now have a file with the data for covid cases all the way up to the 23rd of Feburary (when I made this) but we can also write a bit of code to extract the data at todays date!
# N.B. for data thats released daily its important to know what time of day the website is updated!!


# Here we extract the URL up to the section in the original call which contains a date
url_root = "https://www.opendata.nhs.scot/dataset/b318bddf-a4dc-4262-971f-0ba329e09b87/resource/2dd8534b-0a6f-4744-9253-9565d62f96c2/download/trend_hb_"

# Find sys.date finds todays date, using str_replace_all we can remove all dashes by replacing them with nothing 
todaysdate = str_replace_all(Sys.Date(), "-", "")

# Join todays date to the end of the URl and add .csv to the end
url = str_c(url_root, todaysdate, ".csv")

# Now download todays data
download.file(url = url, destfile = file.path("raw_data","covidcases.csv"), mode = "wb")



# Print the latest date at which data is available in the file.
print(str_c("Latest available data: ",
            read_csv(file.path("raw_data","covidcases.csv"),
                     col_types = cols(.default = col_character()))%>%
              select(Date)%>%
              unlist()%>%
              ymd()%>%
              max()))

rm(list=c("todaysdate","url", "url_root"))


