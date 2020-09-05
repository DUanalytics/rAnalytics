#Case in Vector in R
#Vector is single dim

#creations of Vectors------
#Vector values from 1 to 100
x1 = 1:100
x1

#vector of values 1, 5, 11, 30
x2 = c(1, 5, 11, 30)
x2

#vector with integer values starting from 5 to 60 with a step of 3
x3 = seq(from=5, to=60, by=3)
x3

#vector with following values using rep & times: 1 2 3 1 2 3 1 2 3
x4 = rep(c(1,2,3), times=3)
x4

#vector with following values using rep & each : 5 5 5 8 8 8 9 9 9
x5 = rep(c(5,8,9), each=3)
x5

#vector with following values using seq & length.out : 10.0 12.5 15.0 17.5 20.0
x6 = seq(from=10, to=20, length.out=5)
x6

#vector with values between 25 and 100 and number of values drawn from another vector 
x7a = 60:75
length(x7a)
x7b = seq(from=10, to=20, along.with = x7a)
x7b
length(x7b)

#multiple functions-------
#vector drawn randomly from seq of values from 10 to 50
#sort the data; print the data in reverse order
x8a = 10:50
x8a
x8b = sample(x8a)
x8b

sort(x8b)
rev(x8b)

#print the 5th to 10th element
x8b[5:10]
#print every alternate element between 4th and 12 element
x8b[seq(4,12,2)]
#print values between 30 & 40 and their location also
x8b[x8b >=30 & x8b <=40]
which(x8b >=30 & x8b <=40)
x8b

#basic stats - mean, median of values
mean(x8b)
median(x8b)
#min and max
min(x8b)
max(x8b)
#range of values
range(x8b)

#plots : histogram
hist(x8b)
#with 5 bars only
hist(x8b, breaks=5)

#vector of categorical values of Male(M) & Female(F)
y1 = c('M','F','M','M')
y1

#vector of 100 with M & F, randomly selected
y2a= c('M','F')
y2a

y2b = sample(x=y2a, size=100, replace=T)
y2b
table(y2b)  #count of M & F

# Male % approx 60%
y2c = sample(x=y2a, size=100, replace=T, prob=c(.6,.4))
y2c
table(y2c)  #count of M & F
prop.table(table(y2c))  #count in Proportion

#barplot & pie
barplot(table(y2c), col=1:2)
pie(table(y2c), col=1:2)

#list only males
y2c[y2c=='M']

#mode
library(modeest)
mlv(y2c, method = "mfv")

#other functions-----
#normal distribution values - 100000
n1 = rnorm(n=10000)
n1

#mean and std dev
mean(n1)
sd(n1)

#plot & histogram
hist(n1)
plot(density(n1))

hist(n1, freq=F); lines(density(n1), col='red')

#uniform distribution values - 100 students with marks between 62 and 90
n2 = runif(n=100, min=65, max=90)
n2
range(n2)

#round the marks to 1 decimal place
n2 = round(n2,digits=1)
n2

#mean and std dev, median, mode,summary, quantile
mean(n2)
sd(n2)
median(n2)
modeest::mlv(n2, method = "mfv")  #mode
range(n2)
summary(n2)
quantile(n2)  #4 quantiles
quantile(n2, p=c(.1, .7))  #10th & 70th percentile

library(moments)
moments::skewness(n2)
moments::kurtosis(n2)

#plot & histogram
hist(n2)
boxplot(n2)
plot(density(n2))
hist(n2, freq=F); lines(density(n2), col='red')

#how many values between 65 & 72
sum(n2 > 65 & n2 < 72)

#mean of marks of students who scored between 75 & 80
mean(n2[n2 > 75 & n2 < 80])

#class interval : 50-65, 65-75, 75-85, > 85
breaks1 = c(0,50,65,75,85,100)
n2cut = cut(n2, breaks= breaks1)
table(n2cut)

#increase marks by 5 for students who scored < 75
n2
n2[n2 < 75]
which(n2 < 75)
n2[n2 < 75] =   n2[n2 < 75] + 5
n2[n2 < 80]

#all of who have scored > 80, make them 82
n2[n2 > 80] =   82
n2
n2[n2 == 82]


#end
str(n2)
summary(n2)
length(n2)
range(n2)
class(n2)
?mean #help
