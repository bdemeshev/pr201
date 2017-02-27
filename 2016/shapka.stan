data {
 int<lower=0> N; // number of observations
 int<lower=0, upper=1> y[N]; // vector of observed coins
}
parameters {
  // proportion of golden coins in the hat
  real<lower=0, upper=1> p;
}
model {
  // prior
  p ~ uniform(0, 1);
  // model for observed data
  for (n in 1:N) {
    y[n] ~ bernoulli(p);
  }
}
