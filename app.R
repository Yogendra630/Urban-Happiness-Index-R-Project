
library(shiny)
library(ggplot2)
library(dplyr)

data <- read.csv("urban_happiness.csv")

ui <- fluidPage(
  titlePanel("Urban Happiness Index Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("city","Select City:",choices = data$City)
    ),
    mainPanel(
      h3("City Happiness Details"),
      tableOutput("cityData"),
      h3("Income vs Happiness"),
      plotOutput("incomePlot"),
      h3("Pollution vs Happiness"),
      plotOutput("pollutionPlot")
    )
  )
)

server <- function(input, output) {

  output$cityData <- renderTable({
    data %>% filter(City == input$city)
  })

  output$incomePlot <- renderPlot({
    ggplot(data, aes(Income, Happiness)) +
      geom_point(size=3, color="blue") +
      ggtitle("Income vs Happiness")
  })

  output$pollutionPlot <- renderPlot({
    ggplot(data, aes(Pollution, Happiness)) +
      geom_point(size=3, color="red") +
      ggtitle("Pollution vs Happiness")
  })
}

shinyApp(ui = ui, server = server)
