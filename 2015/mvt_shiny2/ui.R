library("shiny")

shinyUI(pageWithSidebar(
  headerPanel("Винни-Пух и многомерное нормальное"),
  sidebarPanel(
    sliderInput("n_obs", "Количество наблюдений",
        min = 50, max = 500, step = 10, value = 100,
        animate = TRUE),
    sliderInput("corr", "Привет Таисии от Корреляции",
        min = -1, max = 1, step = 0.1, value = 0.5,
        animate = TRUE)
  ),
  mainPanel(
    plotOutput("histogram"),
    plotOutput("dotplot")
  )
))
