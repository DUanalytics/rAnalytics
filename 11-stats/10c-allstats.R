#Basic Stats Tests


#binomial distribution------
#MCQ - 1 out 5 correct; Prob of having <= 4 correct ans : 12 Questions

#exactly 4 answers
dbinom(x=4, size=12, prob=.2)

#which is sum of 0,1,2,3,4 right ans
(pl4 <- dbinom(x=0, size=12, prob=.2)+ dbinom(x=1, size=12, prob=.2) + dbinom(x=2, size=12, prob=.2) + dbinom(x=3, size=12, prob=.2) + dbinom(x=4, size=12, prob=.2))

#another method
pbinom(q=4, size=12, prob=.2)
#prob is .92 for ans 4 or less right answers
#------------------------------------------
#Poission Distribution-----
#12 cars cross bridge / min on an avg; Find prob of having >= 17 cars/ min

#prob of <=16 cars
p16Lcars <- ppois(q=16, lambda=12, lower.tail = T)
1- p16Lcars

#another method
(p17Mcars <- ppois(q=16, lambda=12, lower.tail = F))
#approx p=.10 that 17 or more cars cross/ min

#------------------------------
#uniform Distribution-------
#10 random nos from uniform distribtion
runif(n=10, min=50, max=100)


