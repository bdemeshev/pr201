h <- function(a) {
  probability <- pnorm((a - 150) / sqrt(60)) -
           pnorm((100 - a) / sqrt(60))
  return(probability)
}
h(168)

delta2 <- function(a) {
  answer <- (h(a) - 0.99)^2
  return(answer)
}

nlm(f = delta2, p = 150)
pnorm(3) - pnorm(-3)
qnorm(0.99) *  sqrt(60) + 150

(100 - 168)/ sqrt(60)
pnorm(-8)
