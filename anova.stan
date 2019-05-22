model {
  // priors
  mu ~ normal(600, 50);
  // likelihood
  density ~ normal(mu[group_no], sigma);
}