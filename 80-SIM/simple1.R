#Simulation

#Simple
#https://it.unt.edu/simple-data-simulationshttps://it.unt.edu/simple-data-simulations

x <- rnorm(n = 10000, mean = 10, sd = 1.5)
hist(x)
mean(x)
sd(x)

#without mean & sd
x <- rnorm(10000)
hist(x)
mean(x)
sd(x)


# other theoretical distributions; such as: 'rbeta' (Beta distribution), 'rexp' (Exponential distribution), 'rchisq' (non-central Chi-Squared distribution), 'rpois' (Poisson distribution), 'rf' (F distribution), 'rt' (Student's t distribution), etc. Each of the distribution functions create random realizations of a theoretical distribution, given the parameters for each distribution (e.g. mean and standard deviation for Normal distributions). Each distribution also has three other functions which provide density, distribution function, and quantile. So, for the Normal distribution(s) there are four standard functions: 'rnorm', 'dnorm' (density), 'pnorm' (distribution function), and 'qnorm' (for quantiles).


#Common Regression-style simulation
x <- rnorm(100, 10, 1.5)
Zx <- scale(x)
Zy <- .8*Zx + rnorm(100, 0, sqrt(1 - (.8^2)))
cor(Zx, Zy)
summary(lm(Zy ~ 0 + Zx))
