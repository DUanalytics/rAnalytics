# Data Frame Split / Partition
#https://www.rdocumentation.org/packages/caret/versions/6.0-80/topics/createDataPartition

library(caret)
df=mtcars

?createDataPartition
# considering response variable as strata
(partition1= createDataPartition(y = factor(df$am), p = 0.75))
#this will return list type of object : set1 for train
length(partition1$Resample1)/32  #approx 0.75

# y :a vector of outcomes. 
# times :the number of partitions to create
# p : the percentage of data that goes to training
# list : logical - should the results be in a list (TRUE) or a matrix with the number of rows equal to floor(p * length(y)) and times columns.
# groups : for numeric y, the number of breaks in the quantiles (see below)

(partition2= createDataPartition(y = factor(df$am), p = 0.75, list=F))  #this will print index no of rows selected
(trainset = df[partition2,])  #train set  
(testset = df[-partition2,])  #test set  

nrow(trainset); nrow(testset)
table(trainset$am);table(testset$am)
#similar proportions of df$am : this should be a factor

#--------

# No of equal partitions for vector
createDataPartition(df$mpg, times=2)
createDataPartition(df$hp, times=3)
