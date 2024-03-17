#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#Taylor Saunders

library(rsconnect)
##rsconnect::deployApp('path/to/your/app')
library(shiny)
library(ggplot2)  


server <- function(input, output) {
  output$plot <- renderPlot({
    req(input$y_var)  # Require that input$y_var is not empty, else can get an object object error
    
    ggplot(data = iris, aes_string(x = 'Species', y = input$y_var)) +
      geom_col(width = 0.8, fill = "blue") +
      labs(x = "Species", y = input$y_var) 
  })
}


