
iris
str(iris)
#numerical - length, width
#cat - species

library(rpart)
library(rpart.plot)
#classification
fitclass = rpart(Species ~ ., data = iris)
fitclass
rpart.plot(fitclass, nn=T)
printcp(fitclass)
head(iris)
ndata1 = data.frame(Sepal.Length= 4, Sepal.Width=3, Petal.Length=2.7, Petal.Width=.3)
ndata1
predict(fitclass, newdata = ndata1, type='prob')

#regression
fitregr = rpart(Petal.Length ~ . , data = iris, method='anova')
fitregr
rpart.plot(fitregr)
ndata2 = data.frame(Sepal.Length= 4, Sepal.Width=3, Species='versicolor', Petal.Width=.3)
ndata2
predict(fitregr, newdata = ndata2, type='vector')
