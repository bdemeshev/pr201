library("mvtnorm") # для многомерного нормального
library("ggplot2") # для графиков

shinyServer( function(input, output) {
  update_x <- reactive({
    mu <- c(10, 15)
    A <- matrix(
      c(4, input$corr*6, input$corr*6, 9), nrow = 2)
    X <- rmvnorm(input$n_obs, mean = mu, sigma = A)
    X
  })
  output$histogram <- renderPlot({
    X <- update_x()
    qplot(X[, 2])
  })
  output$dotplot <- renderPlot({
    X <- update_x()
    qplot(x = X[, 1], y = X[, 2])
  })
})


