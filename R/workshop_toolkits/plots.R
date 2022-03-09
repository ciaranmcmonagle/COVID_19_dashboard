
require(ggplot2)
require(dplyr)



covidrates = read_csv("analysis_outputs/covid/covidrates.csv") %>%
  mutate(Date = ymd(Date))
# Plots for each measure:
plot = ggplot2::ggplot()+
  geom_line(data = covidrates, aes(x = Date, y = DailyPositive, group = HBName, colour = HBName))+
  theme_minimal()+
  ggtitle("Daily COVID-19 Case Rate in Healthboards")+
  scale_y_continuous("Daily Rate (per 100,000) of COVID-19 Cases")+
  scale_color_discrete("Healthboard")


plot = ggplot2::ggplot()+
  geom_line(data = covidrates, aes(x = Date, y = CumulativePositive, group = HBName, colour = HBName))+
  theme_minimal()+
  ggtitle("Cumulative COVID-19 Case Rate in Healthboards")+
  scale_y_continuous("Cumulative Rate (per 100,000) of COVID-19 Cases")+
  scale_color_discrete("Healthboard")


plot = ggplot2::ggplot()+
  geom_line(data = covidrates, aes(x = Date, y = DailyDeaths, group = HBName, colour = HBName))+
  theme_minimal()+
  ggtitle("Daily COVID-19 Death Rate in Healthboards")+
  scale_y_continuous("Daily Rate (per 100,000) of COVID-19 Deaths")+
  scale_color_discrete("Healthboard")


plot = ggplot2::ggplot()+
  geom_line(data = covidrates, aes(x = Date, y = CumulativeDeaths, group = HBName, colour = HBName))+
  theme_minimal()+
  ggtitle("Cumulative COVID-19 Death Rate in Healthboards")+
  scale_y_continuous("Cumulative Rate (per 100,000) of COVID-19 Deaths")+
  scale_color_discrete("Healthboard")


plot = ggplot2::ggplot()+
  geom_line(data = covidrates, aes(x = Date, y = ICUAdmissions, group = HBName, colour = HBName))+
  theme_minimal()+
  ggtitle("Daily COVID-19 COVID-19 ICU Admissions in Healthboards")+
  scale_y_continuous("Daily Rate (per 100,000) of COVID-19 ICU Admissions")+
  scale_color_discrete("Healthboard")


plot = ggplot2::ggplot()+
  geom_line(data = covidrates, aes(x = Date, y = HospitalAdmissions, group = HBName, colour = HBName))+
  theme_minimal()+
  ggtitle("Daily COVID-19 COVID-19 Hospital Admissions in Healthboards")+
  scale_y_continuous("Daily Rate (per 100,000) of COVID-19 Hospital Admissions")+
  scale_color_discrete("Healthboard")



# Make plots with tooltips, to view data on a plot:
### DOWNLOAD PLOTLY IF YOU DONT HAVE IT!

require(plotly)
plot=ggplot2::ggplot()+
  geom_line(data = covidrates, aes(x = Date, y = CumulativePositive, group = HBName, colour = HBName))+
  theme_minimal()+
  ggtitle("Cumulative COVID-19 Case Rate in Healthboards")+
  scale_y_continuous("Cumulative Rate (per 100,000) of COVID-19 Cases")+
  scale_color_discrete("Healthboard")

plotly::ggplotly(plot)

# Colour scales!
# The library "RColorBrewer" contains loads of really useful colour palettes and you can pick ones suited to colour-blindness
require(RColorBrewer)

# All palettes
display.brewer.all()

#Colour blind friendly!
display.brewer.all(colorblindFriendly = TRUE)

my_palette = c(brewer.pal(8,"Set2"),brewer.pal(8,"Dark2"))


plot=ggplot2::ggplot()+
  geom_line(data = covidrates, aes(x = Date, y = CumulativePositive, group = HBName, colour = HBName))+
  theme_minimal()+
  ggtitle("Cumulative COVID-19 Case Rate in Healthboards")+
  scale_y_continuous("Cumulative Rate (per 100,000) of COVID-19 Cases")+
  scale_colour_manual("Healthboard", values = my_palette)

plotly::ggplotly(plot)


