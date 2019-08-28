#IIM Kpv -6th Day

#Review
#R, RStudio, Git
#R Env
#Data Structures
(v1 = c(77,4,5,6,8,4,11,15,7,32,55,23)) ; length(v1)
(m1 = matrix(v1, ncol=4))
m1[,2:3]
(df1 = data.frame(product=c('Maggi','Top Ramen','Cadbury'), sales=c(100,120,68), type=c('T1','T1','T2')))
head(df1)
df1$type = factor(df1$type)
#list and array as HW
#dplyr package
library(dplyr)
df1 %>% group_by(type) %>% summarise(mean(sales))
#import & export data
df1
write.csv(df1,'mydata.csv', row.names = F)
mydf = read.csv('mydata.csv')
mydf1 = read.csv(file.choose())
head(mydf)
head(mydf1)


mydf = read.csv('mydata.csv', header=F, skip=2)
head(mydf)
is.na(mydf)
sum(is.na(mydf))
?read.csv
str(mydf)
#-------------
#linear Regression
fit = lm(y ~ x1 + x2, data=...)
summary(fit)
predict(fit, newdata=.. )
plot(fit)

#logistic Regression
fit2 = glm(y ~ x1 + x2 + ... data = .., family='binomial')
summary(fit2)
predict(fit2, newdata=..., type='response')
ifelse(p > .5, 0,1)
confusionmatrix

#partition data into train and test
index=sample(length(df), size= , replace=F)
train = df[index,]
test = df[-index,]


#Decision Tree
#what type of tree - classification or regression
#choose relevant algo or packages
#check of missing values in target variable Y
#divide dataset into train and test
#create decision tree model using train set
#rpart : use cp to prune the tree
#ctree : cp not reqd, auto pruning
#predict for test set
#confusion matrix for classification tree
#rmse value for regression
sqrt(mean(actual_Y - predictedY)^2)

index = sample(nrow(women), size=.7 * nrow(women))
train = women[index,]
test = women[-index,]
fit = lm(weight ~ height, data=train)
summary(fit)
(pwt = predict(fit, newdata=test))
cbind(test, pwt)
library(ModelMetrics)
rmse(test$weight, pwt)  

(test$weight-pwt)^2
sqrt(mean((test$weight-pwt)^2))


#Clustering
#kmeans
#noofclusters
#---------

#Types - Classification & Regression Trees
#algo - CART and ctree
#classification : predict a class / category
#regression : predict a continuous value eg. Sales
#CART - gini/ entropy / rin variance to select most important variable
#ctree - stats significance ie. pvalue
#CART - cp for pruning : to avoid growing the tree very large
#cp should be such that xerror is the least

#clustering
#group /segmentation 
#kmeans : no of clusters : optimal no of clusters NbClust


#Last Class - AR 
#data to be transcation format Tnos and items in each Tr
#libraries - arules, arulesviz
#finding frequent itemset 
#finding association rules - minconf, minsp, minlength and maxlength
#interpret the rules
#