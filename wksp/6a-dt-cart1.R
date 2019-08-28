#Decision Tree

#CART : Classification and Regression Tree
library(rpart)
library(rpart.plot)
library(dplyr)
#model= rpart(y  ~ ., method='class', data= , control=rpart.control(minsplit=4, cp=0.00001))  #method=anova for regression tree
rpart.plot()
#predict(model, newdata = ...., type='class' or 'prob')

#--------------------
#we want predict for combination of input variables, is a person likely to survive or not

#import data from online site
path = 'https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_csv.csv'
titanic = read.csv(path)
head(titanic)
names(titanic)
data1 = titanic[,c(2,3,5,6,7)]  #select few columns only
head(data1)
str(data1)
table(data1$pclass); table(data1$sex)
sapply(data1[c(1,2,3,5)], table)

#load libraries
library(rpart)
library(rpart.plot)
names(data1)
#Decision Tree- classification tree : predict survived 0 or 1
fit1 = rpart(survived ~ . , data = data1, method = 'class')
fit1
rpart.plot(fit1, cex=.8, nn=T)  #plot

printcp(fit1) #select complexity parameter
#which has least xerror 
prunetree1 = prune(fit1, cp=.014)
# here we select a different value, no of splits will reduce
par(mfrow=c(1,2))
rpart.plot(prunetree1, extra=104, cex=.8,nn=T)
rpart.plot(prunetree1, cex=.8,nn=T)
par(mfrow=c(1,1))
rpart.plot(prunetree1, extra=104, cex=.8,nn=T)
prunetree1
nrow(data1)
table(data1$survived)
809/1309
prunetree1$variable.importance
table(data1$sex, data1$survived)
#Predict class category or probabilities

(testdata1 = sample_n(data1,2))
predict(prunetree1, newdata=testdata1, type='class')
predict(prunetree1, newdata=testdata1, type='prob')

#Use decision trees for predicting
#customer is likely to buy a product or not with probabilities
#customer is likely to default on payment or not with probabilities
#Student is likely to get selected, cricket team likely to win etc

#Imp steps
#select columns for prediction
#load libraries, create model
#prune the tree with cp value
#plot the graph
#predict for new cases

#----------------
#regression Tree
#Predict Numerical Value
library(ISLR)
data(Carseats)
data2 = Carseats
head(data2)

#Libraries for Decision Tree
library(rpart)
library(rpart.plot)
library(dplyr)

#Model
fit2 = rpart(Sales ~ . , data=data2, method='anova' )
fit2
rpart.plot(fit2, cex=.8, nn=T)

#this is large tree, so prune it: check cp
printcp(fit2)
#cp value should be chosen such that xerror is least
prunetree2 = prune(fit2, cp=0.05)
#here we have selected a different value to simplify the tree

prunetree2
rpart.plot(prunetree2, nn=T)
#Interpretation
#if ShelveLoc=Good, and Price >= 109.5, sales predicted is 9.2

#improve the plot
rpart.plot(prunetree2, nn=T, cex=.8, type=4)
#read this document to improve the plot
#https://cran.r-project.org/web/packages/rpart.plot/rpart.plot.pdf
#http://www.milbo.org/rpart-plot/prp.pdf

#Predict for test value
(testdata2 = sample_n(data2,2))
testdata2
(predictedSales=predict(prunetree2, newdata=testdata2, type='vector'))
cbind(testdata2, predictedSales)
#next line will show error because we have to predict numerical value instead of class/ category, so type of response reqd is vector not class
(predict(prunetree2, newdata=testdata2, type='class'))

#End of DT : 
#other libraries to DT - CHAID, ctree - rparty
#Read applications of DT in Business
#https://www.quora.com/What-are-some-practical-business-uses-of-decision-trees
#https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4466856/
#https://hbr.org/1964/07/decision-trees-for-decision-making
#https://www.researchoptimus.com/blog/uses-of-decision-trees-in-business-data-mining/