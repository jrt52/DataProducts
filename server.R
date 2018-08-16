#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
data(iris)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    model1 <- lm(Petal.Length ~ Sepal.Length, data = iris)
   
    model1pred <- reactive({
            sepinput <- input$sliderSepalLength
            predict(model1, newdata = data.frame(Sepal.Length = sepinput))
    })
    
    output$plot1 <- renderPlot({
      sepinput <- input$sliderSepalLength 
      
      plot(iris$Sepal.Length, iris$Petal.Length, xlab = "Sepal Length",
           ylab = "Petal Length", bty = "n", pch = 1, 
           xlim = c(4, 8), ylim = c(0, 10))
      modellines <- abline(model1, col = "blue", lty = 2, lwd = 2)
      points(sepinput, model1pred(), col = "red", pch = 17, cex = 2)
    })
    output$pred1 <- renderText({
            model1pred()
    })
})
    