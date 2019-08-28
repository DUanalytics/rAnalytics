#Bennett3

#import from csv-----
head(mtcars) # first 6 rows
dim(mtcars) #rows and columns
write.csv(mtcars, 'cardata.csv')  #writing data to csv file
read1 = read.csv('cardata.csv')
head(read1)
head(women)
write.csv(women, 'women.csv', row.names = F)
read1a = read.csv('women.csv')
head(read1a)

read2 = read.csv(file=file.choose())
head(read2)

#import from google sheet----
#install.packages('gsheet')
library(gsheet)

readgg = "https://docs.google.com/spreadsheets/d/1QogGSuEab5SZyZIw1Q8h-0yrBNs1Z_eEBJG7oRESW5k/edit#gid=107865534"

read3 = as.data.frame(gsheet2tbl(readgg))
head(read3)


#linear regression----
#DV ~ IV : y = b0 + b1x1 + b2x2 .....
women
?women
head(women)
#weight proportional to height 
cor(women)  #strength and direction of relationship +/-,0-1
cov(women)  #direction 

lm1 = lm( weight ~ height, data=women)
summary(lm1)
anova(lm1)
#does the model exist : F Stats p value - < .05 (yes)
#there is linear relationship between Ht & Wt
#strength : Rsq or AdjRsq : SLR -Multiple Rsq - .991
#99% variation in Wt is due to variations in Ht
#https://statisticsbyjim.com/regression/interpret-f-test-overall-significance-regression/ y = mx + c : m slope, c -intercetp
# weight = -87 + 3.4 * height
range(women$height)
head(women)
women[c(1,5),]
-87.51 + 58 * 3.45
plot(women)
abline(lm1, col='red')
abline(v=c(63,70), h=c(129, 135, 140))
ndata1 = data.frame(height=c(63.5, 67.6))
ndata1
p1 = predict(lm1, newdata = ndata1)
cbind(ndata1, p1)
women

#multiple linear regression
lm2 = lm(mpg ~ hp + disp, data = mtcars)
summary(lm2)
library(dplyr)
mtcars %>% sample_n(2)
ndata2 = data.frame(hp=210, disp= 400)
predict(lm2, newdata = ndata2)


#logistic regression----
library(ISLR)
head(Default)
?Default
dim(Default)
# How many people actual default?
(tmp = table(Default$default))
333/10000

#what is the probability of default for a certain case ?

#Multiple Logistic Regression
logit1 = glm(default ~ income + balance + student, family='binomial', data=Default)
summary(logit1)
logit2 = glm(default ~ balance + student, family='binomial', data=Default)
summary(logit2)

library(dplyr)
slice(Default,c(1,500,1000))
seq(from=1,to=10000,by=500)
(ndata = (slice(Default, seq(1,n(),500))))
ndata
(fitted.results = predict(logit2, newdata=ndata,type='response'))
(fitted.results = round(fitted.results,4))
ndata
(ifelse(fitted.results < .5, 'No','Yes'))
p2 <- ndata %>% mutate(predictnew = ifelse(fitted.results < 0.5, 'No','Yes'))
cbind(p2,fitted.results)
ifelse(fitted.results < 0.05, 0,1)
xtabs( ~ default + student, data=Default)
table(Default$default, Default$student)
ftable(Default$default, Default$student)
#-----
#Accuracy of Model
library(caret)
set.seed(3456)
str(Default)
trainIndex <- createDataPartition(Default$default, p = .67, list = FALSE,   times = 1)

Train <- Default[ trainIndex,]
Test  <- Default[-trainIndex,]
head(Train)
head(Test)

# Logistic Regression Model
model = glm(default ~ student, data=Default, family='binomial')
Test$model_prob <- predict(model, Test, type = "response")
head(Test)
Test <- Test  %>% mutate(default_pred = ifelse(model_prob > .5,'Yes','No'))
head(Test)
Test <- Test %>% mutate(accurate = 1*(default == default_pred))
sum(Test$accurate)/nrow(Test)                         
#96% Accuracy


#decision tree-----

library(rpart)
library(rpart.plot)

#DataSet
str(iris)
head(iris)

table(iris$Species)

library(dplyr)
sample_n(iris, 3)
sample_frac(iris, .1)

# Classification Tree
summary(iris)
set.seed(1234)
#Predict Species
names(iris)
ctree = rpart(Species ~ ., method='class', data=iris)
ctree
rpart.plot(ctree, main='Classification Tree', nn=T, type=4, cex=1,extra=104)
printcp(ctree)
ctreeprune = prune(ctree, cp=0.44)
ctreeprune
rpart.plot(ctreeprune, main='Classification Tree', nn=T, type=4, extra=104)
# Regression Tree - Predict Continuous Value Length
#Predict Sepal.Length
rtree = rpart(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species, method="anova", data=iris )
rtree
rpart.plot(rtree, main='Regression Tree', nn=T, type=2, cex=1)

#another way to plot
plot(rtree, uniform=TRUE, main="Regression Tree for Sepal Length")
text(rtree, use.n=TRUE, cex = 1)
rtree

#CP
printcp(rtree)
rsq.rpart(rtree)  #r2 on anova only

rtreeprune = prune(rtree, cp=0.023)
rpart.plot(rtreeprune, main='Pruned Regression Tree', nn=T, type=2, cex=1)



#clustering
#segmentation
#group by similarities 
#student group themselves
#eating habits, study, games, humour, financial status, introvert, extrovert
marks1 = c(6,7,8,2,3,5,3,6,3,7)
marks2 = c(16,15,18,18,13,19,13,16,13,17)

student = data.frame(marks1, marks2)
student
km1 = kmeans(student, centers=3)
km1
km1$cluster
cbind(student, km1$cluster)
#student grouping
#market segmentation , customer segmentation

