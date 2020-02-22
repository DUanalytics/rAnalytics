#IIM - Bodh Gaya
#Feb 2020

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
df= mtcars
df[,c('cyl','vs','am','gear','carb')] = lapply(df[,c('cyl','vs','am','gear','carb')], factor)
str(df)
#find mean mpg & wt wrt to each gear & cyl type
df %>% group_by(cyl, gear) %>% summarise(meanWt = mean(wt, na.rm=T), meanMPG = mean(mpg, na.rm=T), maxHP = max(hp), min(wt), max(wt), n())
df %>% filter(mpg > 25)
df %>% filter(mpg > 25 & gear %in% c(4))

df
#ggplots
ggplot(df, aes(x=wt, y=mpg)) + geom_point()
ggplot(df, aes(x=wt, y=mpg)) + geom_point(aes(color=am))
ggplot(df, aes(x=wt, y=mpg)) + geom_point(aes(color=am, size=hp))
ggplot(df, aes(x=wt, y=mpg)) + geom_point(aes(color=am, size=hp, shape=carb))

df %>% group_by(cyl, gear)  %>% summarise(CNT = n())
ggplot(df %>% group_by(cyl, gear)  %>% summarise(CNT = n()), aes(x=cyl, y=CNT, fill=gear)) + geom_bar(stat='identity')
ggplot(df %>% group_by(cyl, gear)  %>% summarise(CNT = n()), aes(x=cyl, y=CNT, fill=gear)) + geom_bar(stat='identity', position= position_dodge2(.7)) + geom_text(aes(label=CNT), position=position_dodge2(.7))

ggplot(df %>% group_by(cyl, gear, carb, am)  %>% summarise(CNT = n()), aes(x=cyl, y=CNT, fill=gear)) + geom_bar(stat='identity', position= position_dodge2(.7)) + geom_text(aes(label=CNT), position=position_dodge2(.7)) + facet_grid(carb ~ am, scale='free')


ggplot(df, aes(x='', y=mpg)) + geom_boxplot()
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_boxplot()
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_boxplot() + facet_grid(am ~ cyl)

#simple linear regression

women
head(women)
plot(women)
cor(women)
cov(women$height, women$weight)
cor(women$height, women$weight)

model = lm(weight ~ height, data = women)
model
summary(model)
range(women$height)
residuals(model)
plot(model)

predict(model, new=data.frame(height=77))
-87 + 3.45 * 77

#mtcars
head(mtcars)
model2 = lm(mpg ~ wt + hp + qsec, data = mtcars)
summary(model2)
model3 = lm(mpg ~ wt , data = mtcars)



#load the data
#missing Values
#correlation between IV
#form Linear Model
#Check for Model Summary - F Stats, R2, Coeff P value
#check for assumptions
#predict & find accuracy
summary(model3)


#missing values

x = c(3,5,4,5)
x
mean(x)
x1 = c(4,5, ,6)
x2 = c(5,5,NA,20)
x2
mean(x2)
mean(x2, na.rm=T)
is.na(x2)
sum(is.na(x2))

x2[is.na(x2)] = mean(x2, na.rm=T)
x2
library(VIM)
data(sleep)
str(sleep)
summary(sleep)
names(sleep)
is.na(sleep$Dream)
sum(is.na(sleep$Dream))
colSums(is.na(sleep))
rowSums(is.na(sleep))
complete.cases(sleep)
sleep[complete.cases(sleep),]


#---

mtcars ; proportion of am to be maintained
train_MTC  - 70%
test_MTC  - 30%

set.seed(34)
library(caret)
split1 <- ...
train_MTC  <-  ....
test_MTC <- ....
table(train_MTC$am)
table(test_MTC$test)


x3
