#Logistic Regresion : GRE
#https://stats.idre.ucla.edu/r/dae/logit-regression/
#A researcher is interested in how variables, such as GRE (Graduate Record Exam scores), GPA (grade point average) and prestige of the undergraduate institution, effect admission into graduate school. The response variable, admit/don’t admit, is a binary variable


inputData <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
## view the first few rows of the data
head(inputData)
dim(inputData)
inputData
summary(inputData)
#sd of all columns 
sd(inputData$admit)
sd(inputData[,1])
sd(inputData[,2])
sd(inputData[,3])
sd(inputData[,4])

for (i in 1:4) { print(sd(inputData[,i]))}
#use apply functions
sapply(inputData, sd)
lapply(inputData, sd)
lapply(inputData, quantile)
sapply(inputData, quantile)

?sapply

str(inputData)
data= inputData  # make a copy for futher analysis
data$rank = as.factor(data$rank)
data$admit = factor(data$admit)
str(data)
str(data)
## 2way contingency table of cat outcome and predictors we want
## to make sure there are not 0 cells
table(data$rank, data$admit)
#which rank of institute are more successful (in nos/ %) in getting admitted - 2 /1
(t1= xtabs(~ admit + rank, data = data))
addmargins(t1)
prop.table(t1,2)
?prop.table
#xtabs(~ gear + cyl + am , data=mtcars)
#create Logistic Model
head(data)
mylogit = glm(admit ~ gre + gpa + rank, data = data, family = "binomial")

summary(mylogit)
#gre,gpa, rank are statistically significant, Star in each variable rows
#For every one unit change in gre, the log odds of admission (versus non-admission) increases by 0.002.
#For a one unit increase in gpa, the log odds of being admitted to graduate school increases by 0.804. (keeping others constants)
#The indicator variables for rank have a slightly different interpretation. For example, having attended an undergraduate institution with rank of 2, versus an institution with a rank of 1, changes the log odds of admission by -0.675.

## odds ratios only
exp(coef(mylogit))
library(dplyr)
set.seed(1234)
(ndata1 = sample_n(data, 3))
(p1=predict(mylogit,newdata=ndata1, type=c("response")))

#Predict admit for input data
(ndata2 = data.frame(gre=c(600, 700), gpa=c(2,3), rank=factor(c(1,1))))
(p2= predict(mylogit,newdata=ndata2, type=c("response")))

cbind(ndata1, p1, predict=ifelse(p1 < .5, 0, 1))
cbind(ndata2, p2, predict=ifelse(p2 < .5, 0, 1))

#predict for original values
(p3 = predict(mylogit, newdata=data, type='response'))
nrow(data)
(predicted3 = factor(ifelse(p3 < .5, 0, 1)))
(actual = data$admit)
df = data.frame(predicted3, actual)
#cutoff value
head(df)
df %>% mutate(same = predicted3 == actual)
caret::confusionMatrix(df$predicted3, df$actual)
(254+30)/(19+97+254+30)
?confusionMatrix

## view data frame
library(dplyr)
sample_n(data,size=1)
(newdata1 = data.frame(gre=450, gpa=3.7, rank=factor(3) ))
(newdata1$admitPredicted <- predict(mylogit, newdata = newdata1, type = "response"))
(newdata1$admitClass = ifelse(newdata1$admitPredicted > .46,1,0))
newdata1  #b=not admitted to institute

#End of Logistic Regression
#also check for assumptions of residues, VIF, Multi-collinearity
#Parition the data into train and test



library(caret)
Index <- createDataPartition(y=data$admit, p=0.70, list=FALSE)
head(Index)  #rownumbers for T
Index ; length(Index)
length(Index)/ nrow(data)

nrow(data)
trainData = data[Index , ]
nrow(trainData)
testData = data[-Index, ]
nrow(testData)
nrow(trainData) ; nrow(testData); nrow(trainData) + nrow(testData)
table(data$admit); prop.table(table(data$admit)) #original table
prop.table(table(trainData$admit))
prop.table(table(testData$admit))
summary(trainData$admit); summary(testData$admit)
#proportion of Admit (0 and 1) are same/similar in train and test set
#this is partition of data
#trainData & testData
log1 = glm(admit ~ gre + gpa + rank, data=trainData, family='binomial')
summary(log1)

car::vif(log1)
#we will use all variables 
#predict on test set 
(testData$predictNew = predict(log1, newdata = testData, type='response'))

library(InformationValue) #finds optimal cutoff values
(optCutOff <- optimalCutoff(testData$admit, testData$predictNew)[1] )
str(testData)

#find class with optimal & .5 cutoff value
testData2 = cbind(testData, predictClass1 = factor(ifelse(testData$predictNew < optCutOff, 0, 1)) , predictClass2 = factor(ifelse(testData$predictNew < .5, 0, 1)))
caret::confusionMatrix(testData2$admit, testData2$predictClass1)  #better
caret::confusionMatrix(testData2$admit, testData2$predictClass2)

head(testData2)

misClassError(testData2$admit, testData2$predictNew, threshold = optCutOff)
plotROC(testData2$admit, testData2$predictNew)
Concordance(testData2$admit, testData2$predictNew)

#now construct a model with train and then test on testdata
#http://r-statistics.co/Logistic-Regression-With-R.html
#logistic Regression



library(InformationValue)
(optCutOff <- optimalCutoff(data$admit, prob)[1] ) #.46
confusionMatrix(data$admit, prob, threshold = optCutOff)
(accuracy = (247+38)/ (sum(247+38+89+26))) # .715
confusionMatrix(data$admit, prob, threshold = .7)
(accuracy = (272+2)/ (sum(272+2+125+1))) #.685

confusionMatrix(data$admit, prob, threshold = .2)


print(summary(am.data))
