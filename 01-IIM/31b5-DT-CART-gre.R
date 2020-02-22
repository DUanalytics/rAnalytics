#Decision Tree -  GRE
library(dplyr)
library(rpart)
library(rpart.plot)
library(ggplot2)

#https://stats.idre.ucla.edu/r/dae/logit-regression/
#A researcher is interested in how variables, such as GRE (Graduate Record Exam scores), GPA (grade point average) and prestige of the undergraduate institution, effect admission into graduate school. The response variable, admit/don’t admit, is a binary variable

df1 <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
## view the first few rows of the data
head(df1)
dim(df1)
data = df1
data[, c('admit','rank')] = lapply(data[, c('admit','rank')], as.factor)
str(data)
table(data$admit)
table(data$rank)
table(data$rank, data$admit)
prop.table(table(data$rank, data$admit))
prop.table(table(data$admit))
#68% dont get admitted

#Model-1 -----
#Stage1------
library(caret)
index = createDataPartition(y=data$admit, p=.75, list=F)
train = data[ index, ]
test = data[-index, ]
sapply(list(train, test), dim)  #rows & cols

dtree1 <- rpart(admit ~ ., data=train)
dtree1
rpart.plot(dtree1, cex=.8, nn=T, extra=104)

#variable importance
dtree1$variable.importance
#An overall measure of variable importance is the sum of the goodness of split measures for each split for which it was the primary variable…

#predict on test----
Pdtree1 <- predict(dtree1, type='class', newdata=test)
Pdtree1  #class predicted
sum1 <- table(Pdtree1, test$admit, dnn=c('Predicted','Actual'))
caret::confusionMatrix(sum1)

#M1:Stage2------
printcp(dtree1)
dtree1prune = prune(dtree1, cp=.010417)
dtree1prune
rpart.plot(dtree1prune, cex=.8, nn=T, extra=104)
dtree1prune$variable.importance

Pdtree1B <- predict(dtree1prune, type='class', newdata=test)
Pdtree1B  #class predicted
(sum1B <- table(Pdtree1B, test$admit, dnn=c('Predicted','Actual')))
caret::confusionMatrix(sum1B)  #some improvement
caret::confusionMatrix(sum1)

#better plot----
rpart.plot(dtree1prune, branch.lty=3, nn=T, type=4, cex=.8)

prp(dtree1prune, extra=6, branch.col = 'green')
#?prp for more details

library(rattle)
fancyRpartPlot(dtree1prune)

#printing rules----
rpart.plot::rpart.rules(dtree1prune)
rpart.utils::rpart.subrules.table(dtree1prune)
rattle::asRules(dtree1prune)

#Stage-3 ----
#68% dont get admitted
dtree2 <- rpart(admit ~ ., data=train, parms=list(prior=c(.7,.3)))
dtree2
rpart.plot(dtree2)
printcp(dtree2)
dtree2$variable.importance
dtree2prune = prune(dtree2, cp=.010213)
Pdtree2B <- predict(dtree2prune, type='class', newdata=test)
Pdtree2B  #class predicted
(sum2B <- table(Pdtree2B, test$admit, dnn=c('Predicted','Actual')))
caret::confusionMatrix(sum2B)  #is there improvement
caret::confusionMatrix(sum1B)


#links to read----
#https://www.gormanalysis.com/blog/decision-trees-in-r-using-rpart/
  