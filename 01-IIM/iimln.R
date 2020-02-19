#IIMLN
#day1

mtcars
?mtcars   #help on mtcars
class(mtcars)
x= 1:5
class(x)
x
y=c(1, 3.5,5)
y
class(y)
class(as.integer(y))
as.integer(y)
z=c(1L, 3L, 5L)
z
class(z)
str(mtcars)
?str
summary(mtcars)

#vectors----
x = 1:5
x
x1 = c(1,2,3,4,5)
x1
(x3 = c(2,4,36,3))
x3
print(x3)
x3
x3[2]
plot(x3)
(x4 = rnorm(n=100, mean=60, sd=10))
plot(x4)
plot(density(x4))
hist(x4)
hist(x4, breaks=10, col=1:10)
range(x4)
min(x4); max(x4)
mean(x4) ; median(x4)
boxplot(x4)
sort(x4)
sort(x4, decreasing = TRUE)
plot(sort(x4), type='b') #line and point
plot(x4, type='l')
x4[x4>65]
mean(x4[x4 > 65])  #mean of values more than 65
x4
x4[1:10]
x4[91:100]
x4[-c(1:10)]
x4[x4 > 65]
length(x4[x4 > 65])
sum(x4 > 65)
rev(x4)
sum(x4[x4 > 65])
x4[x4 > 60 & x4 < 70]
sum(x4)
#
#matrices----
(data = c(10,30,40,44,22,55))
(m1 = matrix(data = data, nrow=2))
(m2 = matrix(data = data, nrow=2, byrow=T))
rownames(m1) = c('R1','R2')
m1
colnames(m1) = c('C1','C2','C3')
m1
m1[1,]
m1['R1', ]
m1[,3]
m1
m1[,2:3]
m1[, c('C1','C3')]
colSums(m1)
rowSums(m1)
colMeans(m1)
rowMeans(m1)
apply(m1, 1, FUN=min)
m1
apply(m1[, 'C2', drop=F], 2, FUN=max)

#dataframe----
(rollno = paste('IIMLN', 1:13, sep='-'))
(name = paste('Student',1:13, sep=' & '))
(age = round(runif(13, min=24, max=32),2))
(marks = trunc(rnorm(13, mean=60, sd=10)))
set.seed(34)
(gender =  sample(c('M','F'), size=13, replace=T, prob=c(.7, .3)))
table(gender)
prop.table(table(gender))
(x=c(-14.35, 14.35, -14.55, 15.35))
floor(x) ;  ceiling(x) ; trunc(x)
set.seed(55)
(grade =  sample(c('Ex','Good','Sat'), size=13, replace=T, prob=c(.6, .3,.1)))
table(grade)
prop.table(table(grade))
sapply(list(rollno, name, age, marks, gender, grade), length)
(students = data.frame(rollno, name, age, marks, gender, grade, stringsAsFactors = F ))

write.csv(students,'data/students.csv' , row.names = F )

df1 = read.csv('data/students.csv')
df1

df2 = read.csv('https://raw.githubusercontent.com/DUanalytics/rAnalytics/master/data/students.csv')
df2

df3 = read.csv(file.choose())
df3

students
#install.packages("dplyr")


class(students)
summary(students)
str(students)
students$gender = factor(students$gender)
str(students)
students$grade = factor(students$grade, ordered=T, levels=c('Ex','Sat','Good'))
str(students)
table(students$gender)
table(students$grade)

students
library(dplyr)  #loading library

students %>% group_by(gender)  %>% tally()
students %>% group_by(gender)  %>% summarise(mean(age), n(), min(marks), max(marks))
students %>% group_by(gender, grade)  %>% summarise(mean(age))



#dplyr - mtcars
library(dplyr)
#library(tidyverse)
#Filter----
mtcars
filter(mtcars, cyl == 8)
filter(mtcars, cyl < 6)

# Multiple criteria
filter(mtcars, cyl < 6 & vs == 1)
filter(mtcars, cyl < 6 | vs == 1)

# Multiple arguments are equivalent to and
filter(mtcars, cyl < 6, vs == 1)


filter(mtcars, row_number() == 1L)
filter(mtcars, row_number() == n())
filter(mtcars, between(row_number(), 5, n()-2))
