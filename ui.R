#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#Taylor Saunders 

library(shiny)

intro_panel <- tabPanel(
  "Introduction",
  titlePanel("Edgar Anderson's Iris Data"),
  p("'Iris' is a built-in data set in R Studio that 'gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.'"),
  p("The table provided in this page allows you to navigate between the sepal length/width and petal length/width for the three species."),
  p("The purpose is to compare the three species in terms of width and length of either sepal or petal.")
)

selected_values <- colnames(iris)
selected_values <- selected_values[! selected_values %in% c('Species')]

sidebar_content <- sidebarPanel(
  selectInput(
    "y_var",
    label = "Species Detail",
    choices = selected_values,
    #selected = selected_values[1] 
  )
)

main_content <- mainPanel(
  plotOutput("plot")
)

second_panel <- tabPanel(
  "Interactive Data Plot",
  titlePanel("Petal/Sepal L/W BarPlot"),
  sidebarLayout(
    sidebar_content, main_content
  )
)

ui <- navbarPage(
  "Measurements in cm of Species sepal L/W and petal L/W",
  intro_panel,
  second_panel
)

