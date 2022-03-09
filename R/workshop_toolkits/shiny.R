

### SHINY DASHBOARD WITH VARIABLE PLOT DISPLAY



library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Scottish COVID-19 Dashboard"),
  sidebarPanel( selectInput("selector", h3("Measure"), 
                            choices = list("Daily Case Rate" = "dcr",
                                           "Cumulative Case Rate" = "ccr",
                                           "Daily Death Rate" = "ddr",
                                           "Cumulative Death Rate" = "cdr",
                                           "ICU Admission Rate" = "icu",
                                           "Hospital Admission Rate" = "har"), selected = "dcr")),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotly::plotlyOutput("distPlot")
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  source("R/data_downloads/download_covidcases.R")
  source("R/data_downloads/download_healthboard_pops.R")
  source("R/data_processing/process_healthboard_pops.R")
  source("R/data_processing/process_covidcases.R")
  source("R/analysis/calculate_covidrates.R")
  source("R/outputs_plotting/plot_caserates.R")
  covidrates = read_csv("analysis_outputs/covid/covidrates.csv") %>%
    mutate(Date = ymd(Date))
  
  output$distPlot <- plotly::renderPlotly({
    if(input$selector == "dcr"){
      plot = ggplot2::ggplot()+
        geom_line(data = covidrates, aes(x = Date, y = DailyPositive, group = HBName, colour = HBName))+
        theme_minimal()+
        ggtitle("Daily COVID-19 Case Rate in Healthboards")+
        scale_y_continuous("Daily Rate (per 100,000) of COVID-19 Cases")+
        scale_color_discrete("Healthboard")}
    if(input$selector == "ccr"){
      plot = ggplot2::ggplot()+
        geom_line(data = covidrates, aes(x = Date, y = CumulativePositive, group = HBName, colour = HBName))+
        theme_minimal()+
        ggtitle("Cumulative COVID-19 Case Rate in Healthboards")+
        scale_y_continuous("Cumulative Rate (per 100,000) of COVID-19 Cases")+
        scale_color_discrete("Healthboard")}
    if(input$selector == "ddr"){
      plot = ggplot2::ggplot()+
        geom_line(data = covidrates, aes(x = Date, y = DailyDeaths, group = HBName, colour = HBName))+
        theme_minimal()+
        ggtitle("Daily COVID-19 Death Rate in Healthboards")+
        scale_y_continuous("Daily Rate (per 100,000) of COVID-19 Deaths")+
        scale_color_discrete("Healthboard")}
    if(input$selector == "cdr"){
      plot = ggplot2::ggplot()+
        geom_line(data = covidrates, aes(x = Date, y = CumulativeDeaths, group = HBName, colour = HBName))+
        theme_minimal()+
        ggtitle("Cumulative COVID-19 Death Rate in Healthboards")+
        scale_y_continuous("Cumulative Rate (per 100,000) of COVID-19 Deaths")+
        scale_color_discrete("Healthboard")}
    if(input$selector == "icu"){
      plot = ggplot2::ggplot()+
        geom_line(data = covidrates, aes(x = Date, y = ICUAdmissions, group = HBName, colour = HBName))+
        theme_minimal()+
        ggtitle("Daily COVID-19 COVID-19 ICU Admissions in Healthboards")+
        scale_y_continuous("Daily Rate (per 100,000) of COVID-19 ICU Admissions")+
        scale_color_discrete("Healthboard")}
    if(input$selector == "har"){
      plot = ggplot2::ggplot()+
        geom_line(data = covidrates, aes(x = Date, y = HospitalAdmissions, group = HBName, colour = HBName))+
        theme_minimal()+
        ggtitle("Daily COVID-19 COVID-19 Hospital Admissions in Healthboards")+
        scale_y_continuous("Daily Rate (per 100,000) of COVID-19 Hospital Admissions")+
        scale_color_discrete("Healthboard")}
    plotly::ggplotly(plot)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
