library("mvtnorm") # для многомерного нормального
library("ggplot2") # для графиков

n_obs <- 200
corr <- 0.9

mu <- c(10, 15)
# ковариационная матрица
#   4   corr * 2 * 3
#   ?   9
A <- matrix(
  c(4, corr*6, corr*6, 9),
  nrow = 2)

X <- rmvnorm(n_obs, mean = mu, sigma = A)
# goo.gl/Lxd4yL

qplot(X[, 2])
qplot(x = X[, 1], y = X[, 2])



