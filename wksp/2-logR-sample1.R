#generic LogRegession


#load data
data <- read.csv(....)
data = mtcars

#create training and validation data from given data
install.packages('caTools')
library(caTools)

set.seed(88)
#which category to be predicted: transmission 0/1
data$am = factor(data$am)
table(data$am)

split <- sample.split(data$am, SplitRatio = 0.75)
split
#get training and test data
train <- subset(data, split == TRUE)
test <- subset(data, split == FALSE)
table(train$am); table(test$am)


#logistic regression model (remove ID coln if any)
model <- glm (am ~ ., data = train, family = binomial)
summary(model)
predict <- predict(model, type = 'response')
#confusion matrix
table(train$am, predict > 0.5)

#ROCR Curve
library(ROCR)
ROCRpred <- prediction(predict, train$am)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2,1.7))

#plot glm with any xvar and class 
library(ggplot2)
ggplot(train, aes(x=mpg, y=am)) + geom_point() +   stat_smooth(method="glm", family="binomial", se=FALSE)
