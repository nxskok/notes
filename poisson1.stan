// Estimating Poisson mean

data {
int x[8];
}

parameters {
real<lower=0> lambda;
}

model {
// prior
lambda ~ chi_square(4);
// likelihood
x ~ poisson(lambda);
}

