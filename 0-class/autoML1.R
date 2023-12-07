# Auto ML in R

pacman::p_load(caret, randomForest)
set.seed(123)
n = 100

sData <- data.frame(X1=rnorm(n), X2= rnorm(n), Y = rbinom(n, 1, 0.5))
sData

target <- 'Y'
#hyper parameters
ctrl <- trainControl(method='cv', number=5)
tune_grid <- expand.grid(.mtry = 2.5)

aModel1 <- train(sData[, setdiff(names(sData), target)], sData[, target], method='rf', trControl = ctrl, tuneGrid = tune_grid)

aModel1
#predictions
new_data = data.frame(X1=0.1, X2 = -0.2)
predictions = predict(aModel1 , newdata = new_data)
print(aModel1)

#---------
library(lares)

# The data we'll use is the Titanic dataset
data(dft)
df <- subset(dft, select = -c(Ticket, PassengerId, Cabin))
df

r <- h2o_automl(df, y = Survived, max_models = 1, impute = FALSE, target = "TRUE")



#H2o----
library(h2o)
library(caTools)
mt = mtcars

index_mt = sample.split(Y = mt$mpg, SplitRatio = .7)
index_mt
train_mt = mt[index_mt, ]
test_mt = mt[!index_mt, ]
sapply(list(train_mt, test_mt), dim)

y <- 'mpg'
x <- setdiff(names(train_mt), y)
x; y

aModel2 <- h2o.automl(x=x, y = y, training_frame = train_mt, max_models = 5, seed=1)
