#monte carlo Simulation

#basics of a Monte Carlo simulation are simply to model your problem, and than randomly simulate it until you get an answer

#Normal distribution with a mean of 1 and a standard deviation of 10.
runs <- 100000
sims <- rnorm(runs,mean=1,sd=10)
#write a simulation that samples from this distribution 100,000 times and see how many values are between 3 and 6.
mc.integral <- sum(sims >= 3 & sims <= 6)/runs
mc.integral
#approx 11 %

#Approximating the Binomial Distribution
#We flip a coin 10 times and we want to know the probability of getting more than 3 heads. Now this is a trivial problem for the Binomial distribution, but suppose we have forgotten about this or never learned it in the first place. We can easily solve this problem with a Monte Carlo Simulation. We'll use the common trick of representing tails with 0 and heads with 1, then simulate 10 coin tosses 100,000 times and see how often that happens. 

runs <- 100000
#one.trail simulates a single round of toss 10 coins
#and returns true if the number of heads is > 3
one.trial <- function(){
  sum(sample(c(0,1),10,replace=T)) > 3
}
#now we repeat that trial 'runs' times.
mc.binom <- sum(replicate(runs,one.trial()))/runs
mc.binom
#For our ad hoc Binomial distribution we get mc.binom = 0.8279

#Which we can compare to R's builtin Binomial distribution function
pbinom(3,10,0.5,lower.tail=FALSE) #= 0.8281
