library(shiny)
library(mvtnorm)

shinyServer(function(input, output) {

  
  
  output$regplot <- renderPlot({
  dat <- rmvnorm(n=input$number,mean=c(input$ymean,input$xmean),sigma=matrix(c(5,input$correlation*sqrt(50),                                                                              
                                                                                 input$correlation*sqrt(50),10),2,2))
  dat <- data.frame(dat)
  names(dat) <- c("Out","In")
  model <- lm(dat$Out~dat$In)
  res <- signif(residuals(model), 5)
  pre <- predict(model)
  plot(dat$In,dat$Out)
  title(main="Visualizing a Linear Relationship Between Two Variables")
  abline(model)
  segments(dat$In,dat$Out,dat$In,pre,col="red")
  })
})
