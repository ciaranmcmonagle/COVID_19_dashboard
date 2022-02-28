

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



