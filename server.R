library(shiny)
library(ggplot2)
library(datasets)



#Value1 =  (1+(Interest/100)^years * Amount

#K = The Value of the Amount at the end.
#A = The Amount invested
#i = The Interest percentage divided by 100 (5% / 100 = 0,05)
#n = The number of years, 1998 - 1991 = 8 years

Value1 <- function(Amount, Interest, Years) ((1 + (Interest/100)) ^ Years )  * Amount
      
Value2 <- function(Market, Amount, HDD, TLD, HDF, TLF, TLC, HDC, TLS, HDS){ 
        if (Market == "DAX") return((TLD / HDD) * Amount)
        if (Market == "FTSE") return((TLF / HDF) * Amount)
        if (Market == "CAC") return((TLC / HDC) * Amount)
        if (Market == "SMI") return((TLS / HDS) * Amount)
}
        


shinyServer(function(input, output) {
        output$oMarket <- renderPrint({input$Market})
        output$oAmount <- renderPrint({input$Amount})
        output$oInterest <- renderPrint({input$Interest})
        output$HDD <- renderPrint({input$HDD})
        output$TLD <- renderPrint({input$TLD})
        output$HDF <- renderPrint({input$HDF})
        output$TLF <- renderPrint({input$TLF})
        output$TLD <- renderPrint({input$TLC})
        output$HDF <- renderPrint({input$HDC})
        output$HDS <- renderPrint({input$HDS})
        output$TLS <- renderPrint({input$TLS})
        output$oYears <- renderPrint({input$Years})
        output$prediction1 <- renderPrint({Value1(input$Amount,input$Interest,input$Years)})
        output$prediction2 <- renderPrint({Value2(input$Market, input$Amount, input$HDD, input$TLD, input$HDF, input$TLF, input$TLC, input$HDC, input$HDS, input$TLS)})
}
)