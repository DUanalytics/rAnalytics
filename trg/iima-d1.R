# Title: DataStructures in R
#IIMA

#vectors----
cv = c('dhiraj','a', 'Arun')
nv = c(12,45,26)
lv = c(TRUE, FALSE, T)
cv
nv
(x = 1:100000)
set.seed(100)
(x = trunc(rnorm(100000, mean=60, sd=15)))

x
(x1=sort(x))
x1
x
# values between 60 and 70
x[ x >= 60 & x <= 70]
length(x)
length(x[ x >= 60 & x <= 70])
x
mean(x)
median(x)
mode(x)  #this is not the actual mode
xt = table(x)
xt
sort(xt, decreasing = T)[1:2]
summary(x)
quantile(x)
quantile(x, c(0,.25, .5,.75,.1))

quantile(x, c(.1,.5,.9))
quantile(x, seq(0,1,.01))
seq(0,1,.01)

#boxplot - 5 no summary
boxplot(x, notch=T)
?boxplot
text(1,30, labels='Dhiraj')

x3 = rnorm(50,mean=20,sd=3)
stem(x3)
hist(x3, breaks=12, col=1:5)
hist(x3, freq=F)
lines(density(x3))


x2 = rnorm(1000, mean=10, sd=2)
plot(density(x2))
abline(v=10, h=.1)

x3=seq(1, 100, by=2)
x3
(x3=seq(1, 100, by=2))

#

#matrix----
(m1 = matrix(c(1:24), nrow=6, byrow=F))
m1[1]; m1[10:14]
x=1:24
(m2 = matrix(x, ncol=4, byrow=T))
m2[1]; m2[10:14]
m1; m2
m3=cbind(m1,m2)
rbind(m1,m2)
m3
colSums(m1); rowSums(m1)
colMeans(m1); rowMeans(m1)
#subset col/ row, combination of R & C
m1
m1[1,] ; m1[,2] ; m1[1,2]
m1[1:2,3:4] ; m1[c(1,4), c(2,3)]
m1[m1 > 10 & m1 < 15]
m1 > 10 & m1 < 15
m1-m2
m1 + m2

t(m1) # transpose
m1
sweep(m1, MARGIN = 1, STATS = c(2,3,4,5,6,7), FUN="+" ) #rowise
sweep(m1, MARGIN = 2, STATS = c(2,3,4,5), FUN="*" ) #colwise
sweep(m1, MARGIN = 2, STATS = c(5,1,1,1), FUN="*" ) #colwise
sweep(m1[,c(1,2)], MARGIN = 2, STATS = c(5), FUN="*" ) #colwise
#

#dataframe----
#like excel, every col can of different data type
n=30
(rollno = paste('A',1:n,sep=''))
(name = paste('Student',1:n, sep='@'))
set.seed(101)
(gender = sample(c('M','F'), size=n, replace=T, prob=c(.7,.3)))
table(gender)
?rnorm
set.seed(104)
(marks1 = round(rnorm(n=n,mean=70, sd=7),2))
set.seed(105)
(marks2 = round(rnorm(n=n, mean=65, sd=10),2))
set.seed(106)
(marks3 = sample(c('A','B','C','D'), size=n, replace=T, prob=c(.3,.2,.3,.2)))
table(marks3)
#df = data.frame(rollno, name, gender, marks1, marks2, marks3)

df = data.frame(rollno, name, gender, marks1, marks2, marks3, stringsAsFactors = F)
df
summary(df)
str(df)
df$gender = factor(df$gender)
df$mark3 = factor(df$marks3)
df$rollno
df
#queries  ?
#filter
df[1:5, 1:2]
df[1:5, c('rollno','name','marks1')]
df[df$marks1 > 70 & gender=='M', c('rollno','name', 'gender', 'marks1')]
df$course = sample(c('MBA','BBA'),size=n, replace=T, prob=c(.6,.4))
head(df)
tail(df)
str(df)
#factors-----

df$marks3 = factor(df$marks3,ordered=T, levels=c('B','D','C','A'))
df$course = factor(df$course)
str(df)
boxplot(marks2 ~ marks3, data=df)
boxplot(marks2 ~ (course + gender), data=df)

aggregate(marks2 ~ course, data=df, FUN=mean)
aggregate(marks2 ~ course + gender, data=df, FUN=mean)
aggregate(marks2 ~ course + gender + marks3, data=df, FUN=mean)

#dplyr
#install.packages('dplyr')
library(dplyr)
#x %>% f(y); f(x, y)

df %>% count() ; count(df)

#group by course, mean of mark2
aggregate(marks2 ~ course, data=df, FUN=mean)
df %>% group_by(course) %>% summarise(mean(marks2))
df %>% group_by(course, gender) %>% summarise(mean(marks2), mean(marks1))
df %>% group_by(course) %>% select(marks1) %>% top_n(2)
df %>% filter(gender=='F' & marks3=='A') %>% tally()
df %>% filter(gender=='F' & marks3=='A') %>% summarise(n())
df %>% sample_frac(.2)
df %>% sample_n(3)
