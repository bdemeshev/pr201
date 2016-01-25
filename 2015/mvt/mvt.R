library("mvtnorm")
library("dplyr")
library("ggplot2")

sigma_2 <- 2
rho <- 0.5
n <- 100

mu <- c(0, 0)
A <- matrix(c(1, rho * sigma_2,
              rho * sigma_2, sigma_2^2), nrow = 2)
A

X <- rmvnorm(n, mu, A)

qplot(X[, 2])
qplot(x = X[, 1], y = X[, 2])


