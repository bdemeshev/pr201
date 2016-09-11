library("maxLik")
library("dplyr")
library("ggplot2")

setwd("~/Downloads/")

tsd <- read.csv("coal_accidents.csv")
tsd
glimpse(tsd)
tsd[3,2]
mean(tsd$count)
median(tsd$count)

y <- tsd$count
sum(y)
qplot(data=tsd, x=year, y=count)
qplot(data=tsd, x=year, y=count,
      geom="line")

y

# simple function, sonya

sonya <- function(x) {
  answer <- sum(x^2)
  return(answer)
}

sonya(y)
sonya(7)

# log likelihood, Poisson model

log_p <- function(lambda, data) {
  n <- length(data)
  answer <- -n*lambda + log(lambda)*sum(data)
  return(answer)
}

log_p(1, y)
log_p(2, y)

result <- maxLik(log_p, start=1, data=y)
summary(result)
lambda_hat <- result$estimate
lambda_hat

k <- 0:5
k

prognoz <- exp(-lambda_hat)*lambda_hat^k/factorial(k)
prognoz
dpois(k,lambda=lambda_hat) # built-in function


# artificial data
y_artificial <- rpois(112, lambda=1.75)
result_a <- maxLik(log_p, start=1, data=y_artificial)
summary(result_a)
lambda_hat_a <- result_a$estimate
lambda_hat_a


# log likelihood, geometric distribution model

log_pg <- function(p, data) {
  n <- length(data)
  answer <- log(1-p)*sum(data) + n*log(p)
  return(answer)
}

log_pg(0.5, y)
log_pg(0.2, y)

result_g <- maxLik(log_pg, start=0.5, data=y)
summary(result_g)
p_hat <- result_g$estimate
p_hat

k <- 0:5
k

prognoz_g <- (1-p_hat)^k*p_hat
prognoz_g



