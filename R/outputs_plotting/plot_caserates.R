
#plot_caserates.R

# Plot the COVID-19 case rates in Scottish Healthboards
library(readr)
library(dplyr)
library(lubridate)
library(ggplot2)

covidrates = read_csv("analysis_outputs/covid/covidrates.csv")


covidrates = covidrates %>%
  mutate(Date = ymd(Date))

png("figs/caserates/dailyrate.png")
print(ggplot()+
  geom_line(data = covidrates, aes(x = Date, y = DailyPositive, group = HBName, colour = HBName)))
dev.off()

png("figs/caserates/cumulativerate.png")
print(ggplot()+
  geom_line(data = covidrates,aes(x = Date, y = CumulativePositive, group = HBName, colour = HBName)))
dev.off()

