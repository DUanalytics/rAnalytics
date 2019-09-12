
data5
#Linear Regression
model1 = lm(y ~ x1 + x2, data=data5)
#rmse

#logistic
model2 = glm(y ~ x1 + x2 , data = data5)
#confusion matrix

#classification DT
model3 = rpart( y ~ x1 + x2, data = data5, method='class') #class
#confusion matrix
model3b = rpart( y ~ x1 + x2, data =data5, method='anova') #num

#
predict( model, newdata = ndata1 , type = 'response'/'class')

