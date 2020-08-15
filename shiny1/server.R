#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    

    model <- lm(mpg~ wt+ hp+ am,data =mtcars)
    
    prediction_r <- reactive({
        wtInput <-input$weight
        hpInput <-input$hp
        predict(model, newdata = data.frame(wt=wtInput,hp=hpInput,am=ifelse(input$manual==TRUE,1,0)))
    })
   
    
    

    output$prediction <- renderText({
        prediction_r()

    })

})
