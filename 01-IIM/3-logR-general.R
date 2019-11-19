#generic LogRegession


#load data
data <- read.csv(....)

#create training and validation data from given data
install.packages('caTools')
library(caTools)

set.seed(88)
split <- sample.split(data$class, SplitRatio = 0.75)

#get training and test data
train <- subset(data, split == TRUE)
test <- subset(data, split == FALSE)

#logistic regression model (remove ID coln if any)
model <- glm (class ~ ., data = train, family = binomial)
summary(model)
predict <- predict(model, type = 'response')
#confusion matrix
table(train$class, predict > 0.5)

#ROCR Curve
library(ROCR)
ROCRpred <- prediction(predict, train$class)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2,1.7))

#plot glm with any xvar and class 
library(ggplot2)
ggplot(train, aes(x=xvar, y=class)) + geom_point() + 
  stat_smooth(method="glm", family="binomial", se=FALSE)