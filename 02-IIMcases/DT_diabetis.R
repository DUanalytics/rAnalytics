#Decision Tree : Similar eg in Python
#https://www.kaggle.com/aungpyaeap/diabetes-test-using-decision-tree

url='https://raw.githubusercontent.com/DUanalytics/datasets/master/csv/diabetes.csv'

pacman::p_load(rpart, rpart.plot, dplyr)
data = read.csv(url)
head(data)
summary(data)
data %>% group_by(Outcome)  %>% summarise(meanAge = mean(Age, na.rm=T), max(Glucose), max(BloodPressure))

names(data)
table(data$Outcome)
 500/(500 + 268)
str(data)

data$Outcome = factor(data$Outcome)

fit <- rpart(Outcome ~ ., data = data, method = 'class')
print(fit)

rpart.plot(fit)
rpart.plot(fit, extra = 104, cex=.6, nn=T)  #plot

printcp(fit) #select complexity parameter
prunetree2 = prune(fit, cp=.017)
rpart.plot(prunetree2, cex=.5,nn=T, extra=104)
prunetree2

(testdata = sample_n(data,2))
predict(prunetree2, newdata=testdata, type='class')
predict(prunetree2, newdata=testdata, type='prob')
str(data)

testdata2 = data.frame(Pregnancies=2, Glucose=130, BloodPressure=80, SkinThickness=30, Insulin=20, BMI=30, DiabetesPedigreeFunction=.6, Age=40)
testdata2

predict(prunetree2, newdata = testdata2, type='class')
predict(prunetree2, newdata = testdata2, type='prob')



#divide data into train and test-----
library(caret)
index = createDataPartition(y=data$Outcome, p=.75, list=F)
train = data[ index, ]
test = data[-index, ]
sapply(list(train, test), dim)  #rows & cols

dtree1 <- rpart(Outcome ~ ., data=train)
dtree1
rpart.plot(dtree1, cex=.8, nn=T, extra=104)
dtree1$variable.importance

#predict on test----
Pdtree1 <- predict(dtree1, type='class', newdata=test)
Pdtree1  #class predicted
length(Pdtree1)
cbind(test$Outcome, Pdtree1)
(summary1 <- table(Pdtree1, test$Outcome, dnn=c('Predicted','Actual')))
caret::confusionMatrix(summary1)
(102+38)/192


#revise
#data import
#partition/ split data
#create model
#predict model on test
#confusion matrix
#accuracy
#predict on unknown IVs
#visual plot