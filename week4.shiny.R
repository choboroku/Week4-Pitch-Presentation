library(shiny)
library(lubridate)
library(ggplot2)

# Define UI for app that draws stock price
ui <- fluidPage(

  # App Title
  titlePanel("Shopify Stock Price History"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    # Sidebar Panel for Input
    sidebarPanel(
      sliderInput('date', 'Year', min = 2015, max = 2021,
                  value = 1000, step = 1, round = 0)
    ),

    # Main Panel
    mainPanel(
      tableOutput('tbl'),
      plotOutput(outputId = "valuePlot")
    )
  )
)

# Define server logic required to draw the requested plot
server <- function(input, output) {

  dataset <- reactive(
    {
     main.web <- "https://query1.finance.yahoo.com/v7/finance/download/"
     stock <- "SHOP?period1=1432080000&period2=1600041600&interval=1d&events=history"
     raw.data <- read.csv(url(paste(main.web, stock, sep="")))
     shop.data <- data.frame(date=decimal_date(as.Date(raw.data$Date)), value=raw.data$High)    
     shop.data[shop.data$date<input$date,]
    }
  )
    
  output$valuePlot <- renderPlot(
    {
     ggplot(dataset(), aes(x=date, y=value)) + geom_point()
    }
  )
  
  output$tbl <- renderTable(
    {
     data.frame(
        Quantile=c("0%",  "25%",  "50%",  "75%",  "100%"),
        Value=quantile(dataset()$value)
     )
    }
  ) 
}

shinyApp(ui, server)
