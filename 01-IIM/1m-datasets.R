#data sets in R
#https://lgatto.github.io/IntroMachineLearningWithR/example-datasets.html#edgar-andersons-iris-data

#Iris
data(iris)
data(mtcars)
#
source("http://www.bioconductor.org/biocLite.R")
biocLite(c("MSnbsase", "pRoloc")) ## software
biocLite("pRolocdata") ## date

library("ggplot2")
data(diamonds)

library("mlbench")
data(Sonar)

#housing values
library("MASS")
data(Boston)

#customer churn
library("C50")
data(churn)
dim(churnTrain)
