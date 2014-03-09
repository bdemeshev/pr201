z.cr <- qnorm(0.9)
z.cr

2-z.cr*sqrt(3/50)
2+z.cr*sqrt(3/50)
6-z.cr*sqrt(18/25)
6+z.cr*sqrt(18/25)

lnL <- function(theta) {
  a <- theta[1]
  b <- theta[2]
  return(-50*log(2*pi*b)-
           1/2/b*(1000-400*a+100*a^2))  
}

lnL(c(2,6))
lnL(c(6,2))

require(maxLik)
mod <- maxLik(lnL,start=c(1,1))
summary(mod)

# get coefficients
coeftest(mod)[,1]

# get standard errors
coeftest(mod)[,2]






