# известно, что X ~ N(5, 12)

# Найдите P(X<4)
pnorm(4, mean=5, sd=sqrt(12))

# Найдите P(2 < X < 7)
# она равна P(X<7) - P(X<2) и получаем:
pnorm(7, mean=5, sd=sqrt(12)) - 
  pnorm(2, mean=5, sd=sqrt(12))

