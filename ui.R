#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Petal Length from Sepal Length"),
  
  # Sidebar with a slider
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderSepalLength",
                   "What is the sepal length?",
                   min = 4,
                   max = 8,
                   value = 16)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted Petal Length"),
       textOutput("pred1")
        )
  )
))
