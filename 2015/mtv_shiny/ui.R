library("shiny")
shinyUI(pageWithSidebar(
  headerPanel("Многомерное нормальное и Винни-Пух:"),
  sidebarPanel(
    sliderInput("n_obs", "Число точек",
      min = 50, max = 500, step = 10, value = 100,
      animate = TRUE),
    sliderInput("corr", "Корреляция",
                min = -1, max = 1, step = 0.1, value = 0.5,
                animate = TRUE)
  ),
  mainPanel(
    plotOutput("histogram"),
    plotOutput("scatter")
  )
))
