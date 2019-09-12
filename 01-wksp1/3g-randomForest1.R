# Random Forests
#http://rpubs.com/Jeffery/titanic

#import data from online site
path = 'https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_csv.csv'
titanic <- read.csv(path)
head(titanic)
names(titanic)
str(titanic)

#Random Forest
#Random forests are based on a simple idea: 'the wisdom of the crowd'. 

# In Decision Tree you learned how to use it to make a binary prediction. 
# To improve our technique, we can train a group of Decision Tree classifiers, 
# each on a different random subset of the train set. To make a prediction, 
# we just obtain the predictions of all individuals trees, 
# then predict the class that gets the most votes. 
# This technique is called Random Forest.

#Import Data
library(dplyr)

data_train <- read.csv("https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_train.csv")
head(data_train)
#ignore first column
data_train <- select(data_train,-1)

###Or

#data_train <- read.csv("https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_train.csv") %>%  select(-1)

#data_test <- read.csv("https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_test.csv")
#data_test <- select(data_test,-1)



#Cross Validation
#One way to evaluate the performance of a model is to train it on a number of different smaller datasets 
#and evaluate them over the other smaller testing set.


# RandomForest(formula, ntree=n, mtry=FALSE, maxnodes = NULL)
# Arguments:
# - Formula: Formula of the fitted model
# - ntree: number of trees in the forest
# - mtry: Number of candidates draw to feed the algorithm. By default, it is the square of the number of columns.
# - maxnodes: Set the maximum amount of terminal nodes in the forest
# - importance=TRUE: Whether independent variables importance in the random forest be assessed

#Grid Search definition
#the model will be evaluated over all the combination you pass in the function, using cross-validation.


#In order to lower the computational cost.
#Use Random Search Definition

#install.packages(c("randomForest","caret","e1071"))
library(randomForest)
library(caret)
library(e1071)


# trainControl(method = "cv", number = n, search ="grid")
# arguments
# - method = "cv": The method used to resample the dataset. 
# - number = n: Number of folders to create
# - search = "grid": Use the search grid method.


trControl <- trainControl(method = "cv", number = 10, search = "grid")

# train(formula, df, method = "rf", metric= "Accuracy", trControl = trainControl(), tuneGrid = NULL)
# argument
# - `formula`: Define the formula of the algorithm
# - `method`: Define which model to train. Note, at the end of the tutorial, there is a list of all the models that can be trained
# - `metric` = "Accuracy": Define how to select the optimal model
# - `trControl = trainControl()`: Define the control parameters
# - `tuneGrid = NULL`: Return a data frame with all the possible combination

set.seed(1234)
# Run the model
rf_default <- train(survived~., data = data_train,method = "rf", metric = "Accuracy",  trControl = trControl)
# Print the results
print(rf_default)

#Search best mtry

tuneGrid <- expand.grid(.mtry = c(1: 10))
tuneGrid
rf_mtry <- train(survived~.,  data = data_train, method = "rf", metric = "Accuracy", tuneGrid = tuneGrid, trControl = trControl, importance = TRUE,   nodesize = 14, ntree = 300)

print(rf_mtry)

#The best value was stored in 
rf_mtry$bestTune$mtry

best_mtry <- rf_mtry$bestTune$mtry 
best_mtry


store_maxnode <- list()
tuneGrid <- expand.grid(.mtry = best_mtry)
for (maxnodes in c(5: 15)) {
  set.seed(1234)
  rf_maxnode <- train(survived~.,
                      data = data_train,
                      method = "rf",
                      metric = "Accuracy",
                      tuneGrid = tuneGrid,
                      trControl = trControl,
                      importance = TRUE,
                      nodesize = 14,
                      maxnodes = maxnodes,
                      ntree = 300)
  current_iteration <- toString(maxnodes)
  store_maxnode[[current_iteration]] <- rf_maxnode
}
results_mtry <- resamples(store_maxnode)
summary(results_mtry)



store_maxtrees <- list()
for (ntree in c(250, 300, 350, 400, 450, 500, 550, 600, 800, 1000, 2000)) {
  set.seed(5678)
  rf_maxtrees <- train(survived~.,
                       data = data_train,
                       method = "rf",
                       metric = "Accuracy",
                       tuneGrid = tuneGrid,
                       trControl = trControl,
                       importance = TRUE,
                       nodesize = 14,
                       maxnodes = 24,
                       ntree = ntree)
  key <- toString(ntree)
  store_maxtrees[[key]] <- rf_maxtrees
}
results_tree <- resamples(store_maxtrees)
summary(results_tree)

####For optimised result
# 
# ntree =800: 800 trees will be trained
# mtry=4: 4 features is chosen for each iteration
# maxnodes = 24: Maximum 24 nodes in the terminal nodes (leaves)

fit_rf <- train(survived~.,
                data_train,
                method = "rf",
                metric = "Accuracy",
                tuneGrid = tuneGrid,
                trControl = trControl,
                importance = TRUE,
                nodesize = 14,
                ntree = 800,
                maxnodes = 24)

prediction <-predict(fit_rf, data_test)


confusionMatrix(prediction, data_test$survived)

#accuracy of 80%

varImp(fit_rf)