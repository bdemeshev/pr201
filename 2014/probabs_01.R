# we generate 10^6 observations
n <- 10^6

# exponential random variable with lambda=2
x <- rexp(n,rate = 2)
# rexp, rbinom, rpois, rgeom, runif

# look at x_5
x[5]

# look at x_1, x_2, ..., x_7
x[1:7]

# estimate E(X^3)
mean(x^3)

# estimate (E(X))^3
(mean(x))^3

# create vector z of 0 and 1
# z_i = 1 if x_i  > 3
# z_i = 0 if x_i <= 3
z <- x>3

# estimate P(X>3)=E(Z)
mean(z)
# or just
mean(x>3)

# conditional...

# select all x > 1
xx <- x[x>1]

# look at xx_1, ..., xx_{10}
xx[1:10]

# E(X^3|X>1)
mean(xx^3)

# ... P(X>3|X>1)
# in two steps:
zz <- xx > 3
mean(zz)
# in one step:
mean(xx>3)

