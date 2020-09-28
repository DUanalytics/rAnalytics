#Revision - IIM

#data Structures - vectors, matrix, dataframe, factors
(vector1  = c('a','b','E', 'Dhiraj', 'Vishnu', 'Aurshi', 'Kavita', 'Nayak'))
vector1[1:5]
(vector2 = trunc(rnorm(n=24, mean=60, sd=10)))
mean(vector2)
hist(vector2)
length(vector2)/5
(matrix1 = matrix(data=vector2, nrow=6))
dim(matrix1)
colSums(matrix1)
colMeans(matrix1)
rowSums(matrix1)
addmargins(matrix1, FUN=c(mean, sum))
#prop.table, margin.table, lapply, mapply, sapply, tapply

#dataframe 
(rollno = 1:5)
(name = paste('S',1:5, sep='_'))
(gender = factor(sample(x=c('M','F'), size=5, replace=T, prob=c(.5,.5))))
(marks = round(runif(n=5, min=50, max=90)))
(grades = factor(sample(x=c('A','B', 'C'), size=5, replace=T), ordered=T, levels = c('C','B','A')))
(df1 = data.frame(rollno, name, gender, marks, grades))
head(df1)
str(df1)
summary(df1)
dim(df1)

#summary with dplyr
library(dplyr)
df1 %>% group_by(gender) %>% summarise(count=n(), meanMarks = mean(marks, na.rm=T))

#graphs
hist(df1$marks)
barplot(table(df1$gender))
boxplot(x=df1$marks)

#import/export data - csv, excel, googlesheet
write.csv(df1, 'data/revision1.csv')
list.files('data')
#-----------------------------------------------------------
#Modeling - Linear, Logistic, Decision Tree, Clustering, 
#partitioning the data data
df2 = mtcars[,c('mpg','hp','wt','am')]
head(df2)
df2$am = factor(df2$am)

#predict mpg ~ hp + wt + am
#split the data into train(70%) and test(30%)
set.seed(1234)
index1 = sample(x=1:nrow(df2), size=.7 * nrow(df2), replace=F)
index1
train1 = df2[index1, ] ; dim(train1)
test1 = df2[-index1, ] ; dim(test1)
LM1 = lm(mpg ~ ., data=train1)
summary(LM1)
attributes(summary(LM1))
summary(LM1)$adj.r.squared

#am is not significant, remove it
LM2 = lm(mpg ~ . - am, data=train1)
summary(LM2)
#equation is mpg = 37 + - 0.033 * hp  +  - 3.74 * wt
predictedMPG = predict(LM2, newdata=test1, type='response')
originalMPG = test1$mpg

library(caret)  #library for accuracy
MAE(predictedMPG, originalMPG)
RMSE(predictedMPG, originalMPG)
R2(predictedMPG, originalMPG, form = "traditional")

#------------------------------------------
#predict prob of car being auto(0) or manual(1)
library(caret)
set.seed(1234)
index2 <- createDataPartition(y=df2$am, p=0.7, list=FALSE)
train2 <- df2[index2,] ; dim(train2)
test2 <-  df2[-index2,] ; dim(test2)
table(train2$am)
table(test2$am)
prop.table(table(train2$am))
prop.table(table(test2$am)) #approx same / similar, less if rows are less
str(train2)

LGM1 = glm(am ~ ., data=train2, family='binomial')
#error if data is less
summary(LGM1)
#here model is not good, as no variable is significant, still we will continue

(predictedAM = predict(LGM1, newdata = test2, type='response'))
((predictedAM_class = ifelse(predictedAM < 0.5, 0, 1)))

caret::confusionMatrix(data= factor(test2$am), factor(predictedAM_class))
#approx 75% accuracy

#decision tree 
#predict if car is auto or manual using DT
#partition similar to logistic regression
train2 ; test2

set.seed(1234)
DT1 = rpart(am ~ ., data=train2, method='class')
DT1
rpart.plot(DT1, extra=104, nn=T)
printcp(DT1)  #no pruning required here as tree is small

predictedAM_DT = predict(DT1, newdata = test2, type='class')

caret::confusionMatrix(data= test2$am, factor(predictedAM_DT))
#accuracy ~ 1 (100%)
cbind(original = test2$am, predicted=predictedAM_DT)

#regression tree
#predict mpg on other factors
set.seed(1234)
DT2 = rpart(mpg ~ ., data=train2, method='anova')
DT2
rpart.plot(DT2, nn=T)
printcp(DT2)  #no pruning required here as tree is small

(predictedMPG_DT = predict(DT2, newdata = test2, type='vector'))

caret::RMSE(test1$mpg, predictedMPG_DT)
cbind(original=test1$mpg, predicted=predictedMPG_DT)

#clustering
#group cars into 3 groups
df3 = mtcars[, c('mpg','hp','wt')]
lapply(df3, range)
df3_scaled = scale(df3)
head(df3_scaled)
?scale
head(df3)

km3A = kmeans(df3, centers=3)
km3A$cluster  
cbind(df3, cno = km3A$cluster) %>% arrange(cno)
km3A$centers

km3B = kmeans(df3_scaled, centers=3)
km3B$cluster  
cbind(df3, cno = km3B$cluster) %>% arrange(cno)
km3B$centers
df3 %>% group_by(cnoB= km3B$cluster) %>% summarise_all(mean)
km3A$centers 

#why scaling ----

#hierarchical clustering
head(df3_scaled)
(d=dist(df3_scaled))
as.matrix(dist(df3_scaled[1:5]))

HCLUST_avg = hclust(d, method = 'average')
HCLUST_avg
plot(HCLUST_avg, hang=-1, cex=.8, main='Average Linkage Clustering')
rect.hclust(HCLUST_avg, k=5, border='red')  #5 clusters

plot(HCLUST_avg, hang=-1, cex=.8, main='Average Linkage Clustering')
rect.hclust(HCLUST_avg, k=3, border='green')  #3 clusters

#using height
plot(HCLUST_avg, hang=-1, cex=.8, main='Average Linkage Clustering')
rect.hclust(HCLUST_avg, h=3, border='blue')

#dendrogram
library('dendextend')
## Example:
dend <- as.dendrogram(hclust(d, "ave"))
dcol1=color_branches(dend,k=3, col = c(3,2,1))
plot(dcol1) # selective coloring of branches :)


#no of clusters
library(NbClust)
nc = NbClust(df3_scaled, distance='euclidean', min.nc=2, max.nc=10, method='average')

km5_new = kmeans(df3_scaled, centers=5)

clusplot(x=df3_scaled, km5_new$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
cbind(rownames(df3), cno=km5_new$cluster) %>% as.data.frame() %>% arrange(cno)



#end here.
