library("shiny")

shinyUI(pageWithSidebar(
  headerPanel("Параметры:"),

  sidebarPanel(
    sliderInput("n", "Число точек",
                min = 2, max = 200, value = 100, step = 5, animate = TRUE),

    sliderInput("rho", "Корреляция",
                min = -1, max = 1, value = 0, step = 0.05, animate = TRUE),

    sliderInput("sigma_2", "Стандартное отклонение 2",
                min = 1, max = 10, value = 1, step = 0.5, animate = TRUE)
  ),

  mainPanel(
    plotOutput("hist"),
    plotOutput("scatter")
  )
))
