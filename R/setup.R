rm(list=ls())

if(require(readr)==TRUE&
   require(dplyr)==TRUE&
   require(ggplot2)==TRUE&
   require(lubridate)==TRUE&
   require(shiny)==TRUE){print("All packages installed!")}else{
     print("Missing a package! Try installing the packages mentioned here or ask Ciaran for help!")}


dir.create("R")
dir.create("R/data_downloads")
dir.create("R/data_processing")
dir.create("R/analysis")
dir.create("R/outputs_plotting")
dir.create("R/run_files")

dir.create("raw_data")
dir.create("processed_data")
dir.create("figs")
dir.create("results")
dir.create("analysis_outputs")
