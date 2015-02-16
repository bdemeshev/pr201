library("maxLik")

x <- c(0.7, 1, 0.8)
x

# demo function
pikachu <- function(a) {
  answer <- sum(a)^2
  return(answer)
}

pikachu(x)

# log likelihood for 12.3c
log_f <- function(theta, data) {
  n <- length(data)
  answer <- n*log(theta) - theta^2/2*sum(1/data)
  return(answer)
}

log_f(1, x)

result <- maxLik(log_f, start=7, data=x)
summary(result)
str(result)

theta_hat <- result$estimate
theta_hat
