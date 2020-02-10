#MV Simulation

#Simulating multivariate data structures

#four multivariate normal variables with specified correlations (Sigma = sig), specified means (mu = 0 for all four), and use 'empirical = TRUE' to replicate the exact correlations among the simulated variables.

sig <- matrix(c(1.0, 0.8, 0.5, 0.2,
                0.8, 1.0, 0.5, 0.5,
                0.5, 0.5, 1.0, 0.5,
                0.2, 0.5, 0.5, 1.0), nrow = 4)
sig
library(MASS)
df.4 <- data.frame(mvrnorm(n = 1000, mu = rep(0, 4), Sigma = sig, empirical = TRUE))
detach("package:MASS")
summary(df.4)
ncol(df.4)
nrow(df.4)
head(df.4)
#see the original pattern
round(sig, 2)
round(cor(df.4), 2)
