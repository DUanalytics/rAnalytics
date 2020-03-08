# Clustering

set.seed(1234)
subject1 = trunc(rnorm(30, mean=60, sd=15))
range(subject1)
subject1
marks = data.frame(subject1)
head(marks)
marks
sort(marks$subject1)
k2 = kmeans(marks, centers=2)
k2
k2$size
k2$iter
cbind(marks, k2$cluster) #which data row into which cluster
length(marks[k2$cluster==1,])
marks[k2$cluster==2,]
marks[k2$cluster==1,]

mean(marks[k2$cluster==1,])
mean(marks[k2$cluster==2,])
k2$centers

k2a = kmeans(marks, centers=c(50,70))
k2a
k2a$centers

#create marks of students
#perform clustering to group students with similar marks

head(iris)
head(mtcars)
marks
subject
subject1 = trunc(rnorm(30, mean=60, sd=15))
subject1
scale(subject1)
cbind(subject1, scale(subject1))
?scale

scale(mtcars)
