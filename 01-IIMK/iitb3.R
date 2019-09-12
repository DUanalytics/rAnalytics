women
?women
names(women)
str(women)

model1 = lm(weight ~ height, data = women)
summary(model1)

y = mx + c
height= c(1)
weight <- 3.45 * height - 87
weight
ndata1 = data.frame(height=c(63,66, 68 ))
p1= predict(model1, newdata = ndata1, type='response')
cbind(ndata1, p1 )
range(women$height)

head(mtcars)
str(mtcars)

model2 = lm(mpg ~ wt + hp + disp, data=mtcars)
summary(model2)

model3 = lm(mpg ~ wt + hp , data=mtcars)
summary(model3)


#clustering
kmeans
mtcars$mpg
dim(mtcars)
str(mtcars) #structure
nrow(mtcars)
ncol(mtcars)
class(mtcars)
?mtcars
summary(mtcars)
str(mtcars)
model3=kmeans(mtcars$mpg, centers=3) 
model3
model3$cluster
cbind(mtcars$mpg, model3$cluster)
model3$centers

model4=kmeans(mtcars[,c('mpg','wt')], centers=3) 
model4
model4$cluster
df2= cbind(mtcars[,c('mpg','wt')], cluster2= model4$cluster)
head(df2)
library(dplyr)
df2 %>% arrange(cluster2)
df2 %>% group_by(cluster2) %>% summarise(n())
model4$centers


df = mtcars
df
head(df)
df$cyl = factor(df$cyl)
str(df)
df$cyl

# decision trees using rpart

install.packages(c('rpart','rpart.plot'))
library(rpart)
library(rpart.plot)

head(mtcars)


