library("maxLik")
library("ggplot2")
library("dplyr")

# download file
# http://goo.gl/TKgzBk

# Session - Set working directory - Choose
setwd("~/Downloads/")

h <- read.csv("coal.csv")
h
head(h)
y <- h$count
y




# help(maxLik)

# poisson model for data
log_f <- function(lambda, data) {
  n <- length(data)
  answer <- -lambda*n+log(lambda)*sum(data)
  return(answer)
}

log_f(1, y)
log_f(2, y)

result <- maxLik(log_f, start=2, data=y)
summary(result)

lambda_hat <- result$estimate
lambda_hat

# geometric distribution model for data
log_f2 <- function(p, data) {
  n <- length(data)
  answer <- sum(data)*log(1-p)+log(p)*n
  return(answer)
}

log_f2(0.5, y)

result2 <- maxLik(log_f2, start=0.2, data=y)
summary(result2)
p_hat <- result2$estimate
p_hat

# forecast of P(Y=1)
(1-p_hat)*p_hat
exp(-lambda_hat)*lambda_hat

# forecast of P(Y=f) for f=0,1...5
f <- 0:5
f

prognoz_1 <- exp(-lambda_hat)*
  lambda_hat^f/factorial(f)
prognoz_2 <- (1-p_hat)^f*p_hat
prognoz_1
prognoz_2
