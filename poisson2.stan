// Estimating Poisson mean

data {
  int<lower=1> n;
  real<lower=0> prior_df;
  int x[n];
}

parameters {
real<lower=0> lambda;
}

model {
// prior
lambda ~ chi_square(prior_df);
// likelihood
x ~ poisson(lambda);
}

