
# Download COVID-19 case data
source("R/data_downloads/download_covidcases.R")

# Download Healthboard population data
source("R/data_downloads/download_healthboard_pops.R")

# Process each dataset into analysis read format
source("R/data_processing/process_healthboard_pops.R")
source("R/data_processing/process_covidcases.R")

# Calculate COVID-19 case, death, ICD admission and hospitalisation rates
source("R/analysis/calculate_covidrates.R")

