# ui.R
shinyUI(pageWithSidebar(
        # Application title 
        headerPanel("MPG Prediction for Cars"),
        sidebarPanel( 
                h3('Input of predictors'), 
                checkboxInput("am", "Manual Transmission", FALSE),
                numericInput('wt', 'Weight (lb/1000) Range: 1.0 to 6.0', 3.5, 
                             min = 1, max = 6, step = .1),
                numericInput('qsec', '1/4 mile time (sec) Range: 10 to 30', 20, 
                             min = 10, max = 30, step = 1), 
                submitButton('Submit'),
                br(),
                h3('Help'),
                p('This shiny application tries to predict the MPG for automobiles, a number indicating fuel economy. The prediction is based on fitting linear regression model on the training dataset mtcars in R. Based on previous course project, the final linear model is finalized on including only three predictors, am, wt and qsec.'),
                tags$ul(
                        tags$li("am: Transmission (0 = automatic, 1 = manual)"), 
                        tags$li("wt: Weight (lb/1000)"), 
                        tags$li("qsec: 1/4 mile time")
                ),
                p('You have to specify these three predictors in above fields to get an MPG prediction on the right.')
        ), 
        mainPanel(
                h3('Results of prediction'),
                h4('Is Manual Transmission?'), 
                verbatimTextOutput("oam"),
                h4('Weight (lb/1000) you entered'), 
                verbatimTextOutput("owt"), 
                h4('1/4 mile time (sec) you entered'), 
                verbatimTextOutput("oqsec"), 
                h4('Predicted MPG based on your input is:'), 
                verbatimTextOutput("mpg")
        ) 
))
