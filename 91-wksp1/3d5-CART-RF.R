# Classification using DT and RF

#load libraries
library(ggplot2)
library(randomForest)
library(rpart)
library(rpart.plot)
library(pander)
library(caTools)
#library(rattle)
#library(RColorBrewer)
library(plyr)


#import data from online site
path = 'https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_csv.csv'
titanic <- read.csv(path)
head(titanic)
names(titanic)
data1 = titanic[,c(2,3,5,6,7)]  #select few columns only
head(data1)
dim(data1)
str(data1)
summary(data1)

#split data - Train and Test : equal proportion of survived
set.seed(1234)
split1 <- sample.split(data1$survived, SplitRatio = 0.75)
train1 <- subset(data1,split1==TRUE)
test1 <- subset(data1,split1==FALSE)
dim(train1); dim(test1); dim(data1)

#Visualise data
ggplot(train1, aes(x=survived, fill=sex)) + geom_bar(width=.85, colour='darkgreen') + scale_fill_brewer() + labs(x='Survived-Y/N', y='Survived Count - Genderwise') + ggtitle("Titanic : Gender Vs Survived")

#CART
names(data)
dtree1 = rpart(survived ~ . , data=train1, method='class')
dtree1

#Performance on Training Data
predict_train1 = predict(dtree1, newdata=train1, type='class')
confmatrix_train1 = table(train1$survived, predict_train1)
confmatrix_train1
accuracy_train1 = (confmatrix_train1[1,1] + confmatrix_train1[2,2]) / sum(confmatrix_train1)
accuracy_train1  # 81%

#Performance on Test Data
predict_test1 = predict(dtree1, newdata=test1, type='class')
confmatrix_test1 = table(test1$survived, predict_test1)
confmatrix_test1
accuracy_test1 = (confmatrix_test1[1,1] + confmatrix_test1[2,2]) / sum(confmatrix_test1)
accuracy_test1  # 82%

#plot the tree
prp(dtree1)
rpart.plot(dtree1, extra=104,nn=T)


#using RF-----
#remove missing values
data2= data1  #copy of data1
sum(is.na(data2))
dim(data2)
colSums(is.na(data2))
#age has 263 missing values : Remove column age or impute
knitr::kable(colSums(is.na(data2))) #another view

#use rpart to predict age through anova method
predictageModel = rpart(age ~ . ,data=data2[!is.na(data2$age),], method='anova') #uses 1046 rows 
predictageModel
data2[is.na(data2$age), 'age'] <- predict(predictageModel, newdata = data2[is.na(data2$age),], type='vector')
colSums(is.na(data2)) #missing values of age removed
summary(data2)

#check for class: survived should be a factor
sapply(data2, class)
data2$survived = as.factor(data2$survived)

#split data
#split data - Train and Test : equal proportion of survived
set.seed(1234)
split2 <- sample.split(data2$survived, SplitRatio = 0.75)
train2 <- subset(data2,split2==TRUE)
test2 <- subset(data2,split2==FALSE)
dim(train2); dim(test2); dim(data2)
#check for class: survived should be a factor
sapply(train2, class)
sapply(test2, class)


#Model
rf1 = randomForest(survived ~ . , data=train2, importanct=TRUE, ntree =2000)
# error - DV to be factors , ntree ~ 500 (Less) to create unique trees.
importance(rf1) #sex is most significant
varImpPlot(rf1)
rf1
##Out of Bag(OOB) error is the overall classification error in the above model : > 15%
plot(rf1)
legend('topright', colnames(rf1$err.rate), col=1:3, fill=1:3)
#he black line shows the overall error rate which falls below 20%. The red and green lines show the error rate for ‘died’ and ‘survived’ respectively. We can see that right now we’re much more successful predicting death than we are survival.


#Predict
predict_test2 = predict(rf1, newdata=test2, type='class')
confmatrix_test2 = table(test2$survived, predict_test2)
confmatrix_test2
accuracy_test2 = (confmatrix_test2[1,1] + confmatrix_test2[2,2]) / sum(confmatrix_test2)
accuracy_test2  # 85%




#------
library(mice)
summary(data1)
data3 = data1
set.seed(1234)
names(data3)
mice_mod <- mice(data3[, !names(data3) %in% c('survived')], method='rf') 
mice_output <- complete(mice_mod)
mice_output
data3$age <-  mice_output$age
summary(data3)


#plot RF
#https://stats.stackexchange.com/questions/41443/how-to-actually-plot-a-sample-tree-from-randomforestgettree
devtools::install_github('araastat/reprtree')
library(reprtree)
reprtree:::plot.getTree(model)
getTree(rf1, 1, labelVar=TRUE)
rf1$forest$treemap
