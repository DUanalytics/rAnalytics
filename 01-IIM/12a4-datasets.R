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


pacman::p_load(datarium)
data(package='datarium')
data('marketing', package='datarium')
marketing
#it is a dataset containing the impact of three advertising medias (youtube, facebook and newspaper) on sales. The first three columns are the advertising budget in thousands of dollars along with the fourth column as sales. The advertising experiment has been repeated 200 times. Hence, it has 200 rows.