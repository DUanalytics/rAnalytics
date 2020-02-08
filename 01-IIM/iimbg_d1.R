#iimbg

#vectors ----
(x = rnorm(100, mean=60,sd=15))
x[ seq(1,100,2)]
hist(x)
hist(x, breaks=10)
hist(x, breaks=c(10,40,80,100))
plot(x)
plot(density(x))

#matrices
(data = round(rnorm(24, mean=40,sd=3)))
trunc(34.6)
floor(c(15.4, 15.7, -15.4))
trunc(c(15.4, 15.7, -15.4))
ceiling(c(15.4, 15.7, -15.4))
round(c(15.4, 15.7, -15.4))
data
(m1 = matrix(data, nrow=4))
(m2 = matrix(data, nrow=4, byrow=T))
m1
m2
colSums(m1)
rowSums(m1)
colMeans(m1)
rowMeans(m1)
m1[,c(1,4)]
m1[c(3,2),c(1,4)]

#DF
mtcars
str(mtcars)
summary(mtcars)
df = mtcars
names(df)
?mtcars
df$cyl = factor(df$cyl)
str(df)
df[,c('cyl','vs','am','gear','carb')] = lapply(df[,c('cyl','vs','am','gear','carb')], factor)
str(df)
summary(df)
table(df$cyl)
barplot(table(df$cyl), col=1:3)
pie(table(df$cyl), col=1:3)

table(df$gear, df$am, dnn=c('gear','am'))
table(df$gear, df$am, df$cyl, dnn=c('gear','am', 'cyl'))
?aggregate()
aggregate(cbind(mpg , wt) ~ cyl, data = df, mean)
aggregate(cbind(mpg , wt) ~ cyl + gear, data = df, mean)
#mean mpg & wt for each gear and cyl type

#factors
#without order
set.seed(1234)
(gender = sample(c('M','F'), size=100000, replace=T, prob=c(.7,.3)))
table(gender)
prop.table(table(gender))
barplot(table(gender))
pie(table(gender))

#grades
set.seed(1234)
(grades = sample(c('E','G','S','P'), size=100000, replace=T, prob=c(.4,.3,.2,.1)))
table(grades)
prop.table(table(grades))
pie(table(grades))
barplot(table(grades))
grades2 = factor(grades, ordered=T, levels =c('E','G','S','P'))
str(grades2)
barplot(table(grades2))


#dplyr----
library(dplyr)
df
