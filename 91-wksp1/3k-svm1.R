#SVM using caret package
#http://dataaspirant.com/2017/01/19/support-vector-machine-classifier-implementation-r-caret-package/

library(caret)

#data Import / Properties
heart_df <- read.csv("./data/heart_tidy.csv", sep = ',', header = FALSE)
str(heart_df)
head(heart_df)
dim(heart_df)
anyNA(heart_df) #no missing values
summary(heart_df)
#convert target variable to category - factor
heart_df[["V14"]] = factor(heart_df[["V14"]])

#Partition data : 14th col is DV
set.seed(3033)
intrain <- createDataPartition(y = heart_df$V14, p= 0.7, list = FALSE)
training <- heart_df[intrain,]
testing <- heart_df[-intrain,]
dim(training); dim(testing)

#model
#setting model parameters
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3233)
svm_Linear <- train(V14 ~., data = training, method = "svmLinear",   trControl=trctrl,preProcess = c("center", "scale"), tuneLength = 10)

svm_Linear

#Predict
test_pred <- predict(svm_Linear, newdata = testing)
test_pred
confusionMatrix(test_pred, testing$V14 )
