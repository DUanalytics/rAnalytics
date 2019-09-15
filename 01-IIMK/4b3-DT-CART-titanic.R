# Decision Tree - Classification
#we want predict for combination of input variables, is a person likely to survive or not

#import data from online site
path = 'https://raw.githubusercontent.com/DUanalytics/datasets/master/csv/titanic_train.csv'
titanic <- read.csv(path)
head(titanic)
names(titanic)
data = titanic[,c(2,3,5,6,7)]  #select few columns only
head(data)
dim(data)
#load libraries
library(rpart)
library(rpart.plot)
str(data)
#Decision Tree
names(data)
table(data$survived)
str(data)
fit <- rpart(survived ~ ., data = data, method = 'class')
fit
rpart.plot(fit, extra = 104, cex=.8,nn=T)  #plot
head(data)
printcp(fit) #select complexity parameter
prunetree2 = prune(fit, cp=.015)
rpart.plot(prunetree2, cex=.8,nn=T, extra=104)
prunetree2
nrow(data)
table(data$survived)
# predict for Female, pclass=3, siblings=2, what is the chance of survival

#Predict class category or probabilities
(testdata = sample_n(data,2))
predict(prunetree2, newdata=testdata, type='class')
predict(prunetree2, newdata=testdata, type='prob')
str(data)
testdata2 = data.frame(pclass=2, sex=factor('male'), age=5, sibsp=2)
testdata2
predict(prunetree2, newdata = testdata2, type='class')
predict(prunetree2, newdata = testdata2, type='prob')

#Use decision trees for predicting
#customer is likely to buy a product or not with probabilities
#customer is likely to default on payment or not with probabilities
#Student is likely to get selected, cricket team likely to win etc

#Imp steps
#select columns for prediction
#load libraries, create model y ~ x1 + x2 
#prune the tree with cp value
#plot the graph
#predict for new cases

#rpart, CART, classification model
#regression decision = predict numerical value eg sales