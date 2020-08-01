#All Case Studies

#linear Regression - Marketing

#https://medium.com/x8-the-ai-community/linear-regression-in-r-example-in-code-a84af29222fb
#data --------
data('marketing', package='datarium')
?marketing
head(marketing)
write.csv(marketing, 'E:/8-datasets/marketing.csv', row.names = F)
#https://github.com/kassambara/datarium
#it is a dataset containing the impact of three advertising medias (youtube, facebook and newspaper) on sales. The first three columns are the advertising budget in thousands of dollars along with the fourth column as sales. The advertising experiment has been repeated 200 times. Hence, it has 200 rows.

#Loading and understanding the dataset
#Preparing the data
#Building the model
#Model accuracy analysis

pacman::p_load(datarium, caTools, ggplot2, GGally)

#dataunderstanding 
summary(marketing)
dim(marketing)
names(marketing)

##Pairwise plotting technique 1
plot(marketing, col="purple", main="Plotting Pairs Against Each Other")
#Pairwise plotting technique 2
GGally::ggpairs(marketing)

# preparation----

splitRatio = 0.75
#Splitting The Data
set.seed(101)# Set Seed so that same sample can be reproduced in future also
#Now Selecting 75% of data as sample from total 'n' rows of the data
sample = sample.split(marketing$youtube, SplitRatio = splitRatio)
train = subset(marketing, sample == TRUE)
test = subset(marketing, sample == FALSE)
train_size = dim(train)
test_size = dim(test)

#creating the model
Model <- lm(sales ~ youtube + facebook + newspaper, data = marketing)
summary(Model)

summary(Model)$r.squared
attributes(summary(Model))
summary(Model)$adj.r.squared
summary(Model)$fstatistic
summary(Model)$coefficients

#Predicting
pred <- predict(Model, test)
#compare
cbind(test$sales, pred) 

#rmse
original = test$sales; predicted=pred
d = original-predicted
(mse = mean((d)^2))
(mae = mean(abs(d)))
(rmse = sqrt(mse))
R2 = 1-(sum((d)^2)/sum((original-mean(original))^2))

#---
pacman::p_load(Metrics, DescTools)
Metrics::mse(actual=original, predicted=predicted)
Metrics::rmse(actual=original, predicted=predicted)
Metrics::mape(actual=original, predicted=predicted)

DescTools::RMSE(x=predicted, ref=original)
DescTools::MAPE(x=predicted, ref=original)

#Plotting the predicted values against the actual values
(seqNos = seq(1, nrow(test)))
plotValues = data.frame(seqNos, actual=test$sales, predicted=pred, diff=pred - test$sales)
head(plotValues)

colors = c("actual" = "blue", "predicted" = "red")

ggplot(data=plotValues, aes(x=seqNos)) + geom_point(aes(y=actual, color='actual')) + geom_line(aes(y=actual, color= 'actual')) + geom_point(aes(y=predicted, color='predicted')) + geom_line(aes(y=predicted, color='predicted')) + labs(title ='Compare Actual and Predicted Values with differences',  x='Serial No', y='Actual(Blue), Predicted(Red)') + geom_text(aes(label=round(diff,1) , y=predicted))  + scale_color_manual(values = colors)


#predict
newdata = data.frame(youtube =c(50,60,70), facebook=c(20, 30, 40), newspaper = c(70,75,80))
newdata
predict(Model, newdata=newdata)
head(marketing)




#logistic Regression
#https://www.rdocumentation.org/packages/ISLR/versions/1.2/topics/Smarket
pacman::p_load(Amelia,mlbench, ISLR)
data(Smarket)
missmap(Smarket, col=c("blue", "red"), legend=FALSE)

#data description
?Smarket
head(Smarket)
dim(Smarket) # 2001 and 2005.
summary(Smarket)
sum(is.na(Smarket))  #no missing values

#visualise
head(Smarket)
par(mfrow=c(1,1))
hist(Smarket[,2])
boxplot(Smarket[,2])

round(cor(Smarket[,1:8]),2)
library(corrplot)
correlations <- cor(Smarket[,1:8])
corrplot(correlations, method="circle")
#no correlation

pairs(Smarket[, 1:8])

library(caret)
x <- Smarket[,1:8]
y <- Smarket[,9]
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)


#model
# Logistics Regression
glm.fit <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data = Smarket, family = binomial)

glm.fit
summary(glm.fit) #none are significant
glm.probs <- predict(glm.fit,type = "response")
glm.probs[1:5]
glm.pred <- ifelse(glm.probs > 0.5, "Up", "Down")
table(glm.pred,Smarket$Direction)
