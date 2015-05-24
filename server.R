# server.R
library(shiny)

data(mtcars)
mtcars <- transform(mtcars, cyl = factor(cyl), am = factor(am))
fit1 <- lm(mpg ~ am + wt + qsec + am*wt, data = mtcars)

shinyServer(
        function(input, output) {
                output$oam <- renderPrint(input$am)
                output$owt <- renderPrint(input$wt) 
                output$oqsec <- renderPrint(input$qsec) 
                output$mpg <- renderPrint(unname(predict(fit1, 
                                newdata=data.frame(am=as.factor(as.numeric(input$am)), 
                                                   wt=input$wt, qsec=input$qsec))))
        } 
)