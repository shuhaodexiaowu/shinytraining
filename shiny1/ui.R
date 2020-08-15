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
    titlePanel("This app is designed to predict your car's miles per gallon with the mtcars dataset. 
               You need to type weight and gross horsepower,moreover you need choose whether it is automatic or manual."),

    # input necessary values for prediction
    sidebarLayout(
        sidebarPanel(
            helpText("Provide information about car's weight, horsepower and automatic or not"),
            numericInput("weight","your car's weight(1000lbs)",3.00, min=0, max=10),
            numericInput("hp","your car's gross horsepower",100,min =40,max=300),
            checkboxInput("manual","manual or not(transmission)", value =TRUE),
            submitButton("please confirm your input")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("predicted mpg from dataset mtcars: "),
            textOutput("prediction")
        )
    )
))
