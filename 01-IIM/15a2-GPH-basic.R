# Basic plots
#plot, histogram, pie, boxplot, linechart, correlation plot

#plot
women
plot(women)

(x= seq(1,10))
(x =c(1,2,3,4,5,6,7,8,9,10))
y= seq(11,20)
plot(x,y)

plot(x=women$height, y=women$weight)
plot(women)
plot(mtcars)
pairs(mtcars[,1:3])
?plot

plot(women, type='p', pch=4, col='blue')
plot(women, type='l')
plot(women, type='b')
plot(women, type='b', pch=18, lty=1, col=2, lwd=4)
plot(women, xlim=c(30,100), ylim=c(min(women$weight)-10, 200), pch=10)

#more features with plot
plot(x=women$weight, y=women$height, pch=15, xlab='Weight', ylab='Height', col='red', cex=2, type='b')
title(main='Main Title', sub='Sub Title')
#see cheat sheet on base graphs
mtcars$cyl
#plot(x=mtcars$wt, y=mtcars$mpg, col=mtcars$gear, pch=c(4,6,8), cex=c(1,2))
#as.numeric(levels(as.factor(mtcars$cyl)))
plot(women)
abline(lm(women$weight ~ women$height), col='red', lty=2, lwd=4)

#boxplot-----
str(women)
boxplot(women$height)
summary(women$height)

abline(h=c(58, 62,65,68,72))
text(x=1.2, y=c(58, 62,65,68,72) ,c('Min','1Q', 'Median','Mean','3Q','Max'), col='red' )

x= rnorm(100000, mean=40, sd=5)
boxplot(x, notch=T)
(sum1= as.vector(summary(x)))
abline(h=sum1)
text(x=1.3, y=sum1 ,c('Min','1Q', 'Median','Mean','3Q','Max'), col='red' )

hist(x)
range(x)
hist(x, breaks=c(0,40,50,60,100))
plot(density(x))

?hist
#draw lines on plot for number summary
summary(women)
quantile(women$height)
quantile(women$height, seq(0,1,.1))
quantile(women$height, seq(0,1,.01))
stem(women$height)
boxplot(women$height, col='green')
abline(h=quantile(women$height))
text(1, quantile(women$height), labels=c('min','1Q','median','3Q','max'))

#histogram
hist(women$height)
hist(women$height, breaks=10)
hist(women$height, breaks=5, col=1:5)

#histogram2
(x = rnorm(100,50,10))
hist(x)

hist(x, freq=F, col=1:10)
lines(density(x))

#density plot : shape of data
plot(density(x), col='red')

#pie
gender= sample(c('M','F'), size=100, replace=T)
table(gender)
pie(table(gender))
x = c(10,20,40,50)
pie(x)
xlabels = c('A ','B ','C ','D ')
x/sum(x)
(labels2 = paste(xlabels, round(x/sum(x),2) * 100 , sep='-'))
(labels3 = paste0(labels2,"%%"))
(labels2 = paste0(xlabels, round(x/sum(x),2) * 100, '%'))

pie(x, labels=labels2)
x
#barplot
barplot(x,col=1:4)
barplot(x,col=1:4, horiz = T)

#correlation plot
pairs(women)
cor(women$height,women$weight)
cov(women$height, women$weight)
head(mtcars)
?mtcars

cor(mtcars)
names(mtcars)
pairs(mtcars)
pairs(mtcars[1:4])
options(digits=4)
pairs(mtcars[c('mpg', 'wt','hp')])

