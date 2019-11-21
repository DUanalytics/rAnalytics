#factors

(colorset = c('Red','Green', 'Blue'))
set.seed(1234)
tshirts = sample(colorset, size=50, replace=T, prob=c(.5, .3,.2)) 
table(tshirts)
prop.table(table(tshirts))
class(tshirts)
summary(tshirts)
#convert to Factors
FactorTshirts = factor(tshirts, ordered=F)
FactorTshirts
class(FactorTshirts)
summary(FactorTshirts)

likertScale = c('Excellent','Good','Satisfactory','Poor')
feedback = sample(likertScale, size=50, replace=T, prob=c(.4, .3,.2,.1))
feedback
summary(feedback)
table(feedback)
barplot(table(feedback))
#convert to ordered Factor
FactorFeedback = factor(feedback, ordered=T, levels = c('Excellent', 'Good','Satisfactory','Poor'))
barplot(table(FactorFeedback))
summary(FactorFeedback)
