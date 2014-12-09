library("mvtnorm")
library("ggplot2")
r
mu <- c(2,5)
S <- matrix(nrow=2, c(4,-3,-3,9) )
S
solve(S)
eigen(S)

x <- rmvnorm(500, mu, S)
head(x)
x[23,1]
x[,1]

b <- qplot(x[,1], x[,2])
b

b + geom_hline(yintercept=5)

b + geom_hline(yintercept=5) +
  geom_vline(xintercept=2)

g <- b + geom_hline(yintercept=5) +
  geom_vline(xintercept=2)
g
g + geom_abline(slope=-0.75,
              intercept=6.5)

mean(x[,1])
mean(x[,2])

