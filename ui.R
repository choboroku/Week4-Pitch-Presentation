
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

