
#base
data() # current available data sets

#
mtcars
iris
volcano



#packages
#M1
library(titanic)
titanic::titanic_train
#M2
data('titanic_train', package='titanic')
titanic_train
data('titanic_test', package='titanic')
titanic_test

lapply(list(titanic_train,titanic_test), dim )



## Create dummy variables for categorical variables
library(dummies)
titanic_data <- dummy.data.frame(titanic_train, names=c("Pclass","Sex","Embarked"), sep="_")
