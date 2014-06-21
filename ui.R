library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Visualizing The Relationship of Correlation on Linear Fit and Residuals"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("number",
                  "Sample Size:",
                  min = 10,
                  max = 1000,
                  value = 50),
    sliderInput("correlation",
                   "How correlated do you want your data to be?",
    min = -.99,
    max = .99,
    value = .5),
    sliderInput("xmean",
                "What do you want the mean of your right hand side data to be?",
                min = 10,
                max = 1000,
                value = 50), 
    sliderInput("ymean",
                "What do you want the mean of your left hand side data to be?",
                min = 10,
                max = 1000,
                value = 50)),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("regplot")
    )
  )
))