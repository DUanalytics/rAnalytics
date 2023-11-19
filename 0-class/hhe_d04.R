# HHE Day-4 : 19 Nov 2023 : Munaz
# Supervised and Non-Supervised Learning
# Hypothesis Testing
# Linear & Logistic Regression
# Market Basket & Clustering
# Missing Values
# Customer Churn & Customer Purchase Probability
# autoML

#SLM--------
women
?women
head(women)
cov(women)
cor(women)
plot(women)

?lm
lm1 <- lm(formula = weight ~ height, data=women)
lm1
# weight = coeff + slope * height
# wt = -87.52 + 3.45 * ht
# y = c + mx
range(women$height)
library(dplyr)
women %>% arrange(height)
hist(women$height)
colMeans(women)
head(women)
-87.52 + 3.45 * 58
plot(lm1)
summary(lm1)
residuals(lm1)
nrow(women)
cbind(women, residuals(lm1), fitted.values(lm1))


#MLM-----
head(mtcars)
?mtcars
#predict mpg(DV) on other IVs(wt, hp, gear)
mt2 = mtcars %>% mutate(gear = factor(gear))  %>% select(mpg, wt, hp, gear)
summary(mt2)
lm2 = lm(formula = mpg ~ wt + hp + gear, data = mt2)
lm2
# mpg = 34.87 - 3.2 * wt + -0.034 * hp  #G3
# mpg = 34.87 - 3.2 * wt + -0.034 * hp + 1.26 * gear #G4
# mpg = 34.87 - 3.2 * wt + -0.034 * hp + 1.86 * gear #G5

mt3 = mtcars %>% select(mpg, wt, hp, disp)
head(mt3)

lm3 <- lm(formula = mpg ~ wt + hp + disp, data = mt3)
lm3
summary(lm3)

lm4 <- lm(formula = mpg ~ wt + hp, data = mt3)
lm4
summary(lm4)
plot(mt3$mpg, mt3$hp)

lm5 <- lm(mpg ~ ., data=mtcars)
summary(lm5)



#train & Test ----
noYes = sample(x=c('No','Yes'), size=100, replace=T, prob=c(.6, .4))
noYes = sample(x=c(0,1), size=100, replace=T, prob=c(.6, .4))

table(noYes)

prop.table(table(noYes))

salary = round(rnorm(n=100, mean=60, sd=10),0)
salary

df = data.frame(salary, noYes)
df
#df$noYes = factor(df$noYes)
summary(df)
# Splitting dataset
library(caTools)
library(ROCR)
#split DF into 70% and 30% rows
?sample.split
split <- sample.split(df$noYes, SplitRatio = 0.7)
split
prop.table(table(split))

train_reg <- subset(df, split == "TRUE")
test_reg <- subset(df, split == "FALSE")
dim(train_reg)
dim(test_reg)
train_reg
prop.table(table(train_reg$noYes))
prop.table(table(test_reg$noYes))

# Training model
logistic_model <- glm(noYes ~ salary, data = train_reg,  family = "binomial")
logistic_model

# Summary
summary(logistic_model)
#https://www.geeksforgeeks.org/logistic-regression-in-r-programming/

predict_reg <- predict(logistic_model, test_reg, type = "response")
test_reg

#https://www.statology.org/logistic-regression-in-r/
#practise this-----
#https://www.geeksforgeeks.org/automated-machine-learning-for-supervised-learning-using-r/
predict_reg
cbind(test_reg, predict_reg)
# Changing probabilities
predict_reg2 <- ifelse(predict_reg > 0.5, 1, 0)
cbind(test_reg, predict_reg, predict_reg2)

library(caret)
confusionMatrix(factor(test_reg$noYes), factor(predict_reg2))
(13+5)/30
