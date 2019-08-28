#Modeling
#linear Regression - Simple, Multiple
#y ~ x1 (SLR); y~ x1 + x2 ... (MLR)
#y - Dependent Variable, x - Independent

head(women)
#y - weight, x = height
cor(women$height, women$weight)
#strength and direction of relationship
cov(women$height, women$weight) #direction +ve
#height increases, weight increases
plot(women$height, women$weight)
#perform linear modeling
fit1 =lm(weight ~ height, data=women)
summary(fit1)
#F Stats Pvalue << 0.05 : Linear Model exist
#at least one IV is significant in predicting DV
#Multiple Rsquare = .991 Coeff of Determination
#Multiple when you have one IV, otherwise take Adj Rsq
#99% of the variation in Y is explained by Xs
#y = mx + C : y = -87 + 3.45 * height
range(women$height)
#only do interpolation not exterpolation 
women$weight
women$height
(y = -87 + 3.45 * women$height) 
#predicted weights for actual heights
fitted(fit1) 
residuals(fit1) #difference between predicted and acutal weights
summary(fit1) #summary of the model
summary(residuals(fit1))
summary(students[,5:6])
(newdata1 = data.frame(height=c(60.4,59.9,77)))
?predict
(p1 =predict(fit1, newdata = newdata1, type='response'))
cbind(newdata1, p1)
#
#check for assumptions of Linear Regression
plot(fit1)


fit2 = lm(weight ~ height, data=women)
summary(fit2)
predict(fit2, newdata=data.frame(height=c(61,72)), type='response')
