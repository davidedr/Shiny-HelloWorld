#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
if (!require(shiny)) install.packages('shiny')
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Hello world with Shiny! Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput('bins', label = 'Number of bins:',
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput(outputId = "distPlot")
         
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      
      # generate bins based on input$bins from ui.R
      #x    <- faithful[, 2]
      x    <- faithful$waiting
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = '#75AADB', border = 'white', xlab = 'Waiting time to next eruption (mins)', main = 'Histogram of waiting times')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

