library("shiny")
library("mvtnorm")
library("ggplot2")

shinyServer( function(input, output) {

  update_x <- reactive({
    mu <- c(0, 0)
    A <- matrix(c(1, input$rho * input$sigma_2,
                  input$rho * input$sigma_2,
                  input$sigma_2 ^ 2), nrow = 2)
    X <- rmvnorm(input$n, mu, A)
    X
  })

  output$hist <- renderPlot({
    X <- update_x()
    qplot(X[, 1])
  })

  output$scatter <- renderPlot({
    X <- update_x()
    qplot(x = X[, 1], y = X[, 2])
  })

})
