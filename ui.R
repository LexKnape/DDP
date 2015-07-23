library(shiny)
library(ggplot2)
library(datasets)


x <- data.frame(EuStockMarkets)

HDD <- head(x$DAX, n = 1)
TLD <- tail(x$DAX, n = 1)

TLF <- tail(x$FTSE, n = 1)
HDF <- head(x$FTSE, n = 1)

TLC <- tail(x$CAC, n = 1)
HDC <- head(x$CAC, n = 1)

TLS <- tail(x$SMI, n = 1)
HDS <- head(x$SMI, n = 1)

shinyUI(pageWithSidebar(
        # Application title
        headerPanel(h4("Stock market index or fixed Deposit Interest")),
        
        sidebarPanel(
                numericInput(inputId = "Amount", 'The amount of money you want to invest (USD)', 500, min = 500, max = 100000000, step = 500),
                sliderInput(inputId = "Years", label = "The number of investment years", 1, min = 1, max = 50, step = 1),
                sliderInput(inputId = "Interest", label = "Interest", .1, min = .1, max = 20, step = .1),
                radioButtons(inputId= "Market", label = "Stock market", choices = c("DAX","FTSE","CAC","SMI")),
                numericInput(inputId = "HDD", label = "DAX 1/1/1991", value = HDD, min = HDD, max = HDD),
                numericInput(inputId = "TLD", label = "DAX 31/12/1998", value = TLD, min = TLD, max = TLD),
                numericInput(inputId = "HDF", label = "FTSE 1/1/1991", value = HDF, min = HDF, max = HDF),
                numericInput(inputId = "TLF", label = "FTSE 31/12/1998", value = TLF, min = TLF, max = TLF),
                numericInput(inputId = "HDC", label = "CAC 1/1/1991", value = HDC, min = HDC, max = HDC),
                numericInput(inputId = "TLC", label = "CAC 31/12/1998", value = TLC, min = TLC, max = TLC),
                numericInput(inputId = "HDS", label = "SMI 1/1/1991", value = HDS, min = HDS, max = HDS),
                numericInput(inputId = "TLS", label = "SMI 31/12/1998", value = TLS, min = TLS, max = TLS),
                
                               submitButton('Submit')
                
        ),
        mainPanel(
                
                tabsetPanel(
                        tabPanel(h4('Results of prediction'),
                                h5('The stock market of your choice'),
                                verbatimTextOutput("oMarket"),
                                h5('The amount you invested (in USD)'),
                                verbatimTextOutput("oAmount"),
                                h5('The number of years'),
                                verbatimTextOutput("oYears"),
                                h5('The interest (in %)'),
                                verbatimTextOutput("oInterest"),
                                h5('Total amount invested including interest'),
                                verbatimTextOutput("prediction1"),
                                h5('Total amount if invested in stock market index'),
                                verbatimTextOutput("prediction2")
                                ),
                        tabPanel(h4('Documentation'),  
                                 h5('The application calculates the total amount of money invested either in savings or invested in the German, English or French stockmarket from  the period January 1th of 1991 till December 31th of 1998. The data used is the EuStockMarkets part of the R datasets. '),
                                 h5(' '),
                                 h5('There are four input variables:'),
                                 h5('1. The amount of money you want to invest (USD), a minimum of USD 500 being the start value, steps of USD 500 with a maximum of USD 100.000.000.'),
                                 h5('2.	The number of investment years, a minimum of 1 year, steps of 1 year with a maximum of 50 years. '),
                                 h5('3.	Interest, a minimum of 0.1% interest in percent, steps of 0.1% with a maximum of 20% interest. '),
                                 h5('4.	Stock market. The European stock market where you will invest your money. You can choose either the German (DAX), English (FTSE), French (CAC) or the Italian (SMI) stock market. The date that you will buy the index stocks of your choose is January 1th of 1991 and the date of selling your stocks is December 31th of 1998. '),
                                 h5(' '),
                                 h5('In the sidebarPanel also the labels: DAX 1/1/1911, DAX 31/12/1998, FTSE 1/1/1991, FTSE 31/12/1998, CAC 1/1/1991, CAC 31/12/1998 and SMI 1/1/1991, SMI 31/12/1998 are shown. These are the begin and end values of the European stock markets which can’t be changed.'),
                                 h5('By clicking the submit button the calculation will run and show the following output values:'),
                                 h5(' '),
                                 h5(' '),
                                 h5('There are six output variables:'),
                                 h5('1.	The stock market of your choice, showing the result of the input field as described in input field 4.'),
                                 h5('2.	The amount you invested (in USD), showing the result of the input field as described in input field 1.'),
                                 h5('3.	The number of years, showing the result of the input field as described in input field 2.'),
                                 h5('4.	The interest (%), showing the result of the input field as described in input field 3.'),
                                 h5('5.	Total amount invested including interest. This is a calculation field, interest is paid on an annual basis and is added each end of the year to the existing amount of money. For an exact formula see the tabPanel “The formulas”.'),
                                 h5('6.	Total amount if invested in stock market index. This calculation calculates the total value invested plus or minus the in or decrease of the chosen stock market index at the end date 31/12/1998. For an exact formula see the tabPanel “The formulas”.')
                                 ),
                        tabPanel(h4('The formulas'),  
                                 h4('Formula: Total amount invested including interest'),
                                 h5('Total amount invested including interest =  ( 1 + ( Interest / 100 ) ^ years * Amount'),
                                 h5('-----------------------------------------------------------------------------'),
                                 h5('Total amount invested including interest = The Value of the Amount of money invested including the interest (USD).'),
                                 h5('Interest = The Interest percent (%).'),
                                 h5('years = The number of years.'),
                                 h5('Amount = The Amount of money invested (USD).'),
                                 h5('.'),
                                 h5('.'),
                                 h4('Formula: Total amount invested in chosen stock market index.'),
                                 h5('Total amount if invested in stock market index.  =  ( Amount / Begin value ) * End value' ),
                                 h5('-----------------------------------------------------------------------------'),
                                 h5('Total amount invested in chosen stock market index = Total end value of invested amount of money in chosen stock market on 31/12/1998'),
                                 h5('Amount = The Amount of money invested (USD).'),
                                 h5('Begin value = value on 1/1/1991 of chosen stock market'),
                                 h5('End value = value on 31/12/1998 of chosen stock market.')
                                 )
                        )
                )
        )
)
