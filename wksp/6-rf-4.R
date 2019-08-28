#https://lgatto.github.io/IntroMachineLearningWithR/supervised-learning.html#random-forest

library("mlbench")
data(Sonar)
datatable(Sonar)


library("rpart") ## recursive partitioning
m <- rpart(Class ~ ., data = Sonar,
           method = "class")
library("rpart.plot")

#RF
library(caret)
set.seed(12)
model <- train(Class ~ .,  data = Sonar, method = "ranger") 
print(model)
rpart.plot(m)
p <- predict(m, Sonar, type = "class")
table(p, Sonar$Class)
plot(model)
