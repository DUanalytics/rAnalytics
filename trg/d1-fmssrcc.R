#my first r File
#comment by starting #
women
#control + enter to execute command
?women
?mean
#? before function to seek help
mtcars
#? before function to seek help
mtcars
mean(mtcars$mpg)
names(mtcars)
names(mtcars)
mean(mtcars$hp)
colMeans(mtcars)
rowMeans(mtcars)
head(mtcars)
head(mtcars,1)
head(mtcars,-1)
head(mtcars)
tail(mtcars)
tail(mtcars,1)  # last row
mean(mtcars$mpg)
names(mtcars)
mean(mtcars$hp)
colMeans(mtcars)
rowMeans(mtcars)
head(mtcars)
hist(mtcars$mpg)
hist(mtcars$mpg, breaks=8)
hist(mtcars$mpg, breaks=3)
x = c(1,2,5,7)
x
class(x)
x1 =c(2L, 8L)
class(x1)
class(mtcars)
x3 = c('a','B','dhiraj')
x3
x3 = c("a",'B','dhiraj')
x3
class(x3)
x4 = c(TRUE, FALSE, T, F)
x4
x5 = 1:100000
x5
(x5 = 1:100000)
x6 <- 2
x7 = rnorm(100)
(x7 = rnorm(100))
mean(x7)
sd(x7)
length(x7)
plot(density(x7))
hist(x7)
plot(density(x7))
hist(x7, freq=F)
points(density(x7))
hist(x7, freq=F)
points(density(x7))
(x8 = rnorm(100, mean = 60, sd=10))

library(e1071)
?kurtosis
kurtosis(x8)
skewness(x8)
hist(x8)
points(density(x8))
hist(x8, freq=F)
points(density(x8))
x9 = runif(100, 30, 90)
?runif
x9
trunc(x9)
round(x9,1)
floor(x9)
ceiling(x9)
x10 = ceiling(x9)
x10
x9
mean(x10)
median(x10)
sort(x10)
sort(x10, decreasing=T)
x10[x10 > 60]
x10
x10[1:10]
x10[20:30]
x10[ -1:20]
x10[ -c(1:20)]
x10[c(1,5,7)]
x10
x10
x10
#matrices
m1 = matrix(1:24 , nrow=6)
m1
dim(m1)
m2 = matrix(1:100, ncol=8) #error due non divisibility
m2 = matrix(1:56, ncol=8)
m2
m3 = matrix(1:24, ncol=6, byrow = T)
m3
colnames(m3)=month.abb[1:6]
m3
rownames(m3)= paste('Product',1:4, sep='_')
m3
rowMeans(m3)
m1
m1[ , 1:2]
m3
m3[ , 1:2]
m3[c(1,3), ]
colMeans(m3[c(1,3), ])
m3[ , 1:3]
m3[ , c('Apr',' Jun')]
m3[ , c('Apr','Jun')]
colMeans(m3[c(1,3), ])
m3[ , c('Apr','Jun')]
max(m3)
min(m3)
range(m3)

#data.frame----
n=30
rollno = 1:30
(rollno = paste('F',1:30,sep='-'))
(sname = paste('Student',1:30, sep='&'))

set.seed(1234)
(gender = sample(c('M','F'), size=n, replace=T, prob=c(.7,.3)))
table(gender)
(t1=table(gender))
prop.table(t1)

set.seed(12)
(college = sample(c('SRCC','FMS','IIM'), size=n, replace=T, prob=c(.4,.3,.3)))
(t2=table(college))
prop.table(t2)
n=30
(rollno = paste('F',1:30,sep='-'))
(sname = paste('Student',1:30, sep='&'))
set.seed(1234)
(gender = sample(c('M','F'), size=n, replace=T, prob=c(.7,.3)))
(t1=table(gender))
prop.table(t1)
set.seed(12)
(college = sample(c('SRCC','FMS','IIM'), size=n, replace=T, prob=c(.4,.3,.3)))
(t2=table(college))
prop.table(t2)

(marks1 = round(rnorm(n=n, mean=60,sd=10),0) )
(marks2 = round(rnorm(n=n, mean=55,sd=15),0) )
rollno; sname; gender; college;marks1;marks2
length(gender)
students = data.frame(rollno, sname, gender, college, marks1, marks2)
class(students)
students
head(students)
students$rollno
students[,5:6]
students[,c(2,5:6)]
students[,c('sname','marks1','marks2')]
str(students)
summary(students)
quantile(students$marks1)
quantile(students$marks1, probs=seq(0,1,.1))
seq(0,1,.1)

quantile(students$marks1)
quantile(students$marks1, probs=c(0,.25,.5,.75,1))
seq(1,100)
seq(1,100,2)
seq(1,100,3)
quantile(students$marks1, probs=seq(0,1,.1))
quantile(students$marks1, probs=seq(0,1,.01))
seq(from=1,to=100,by=3)
quantile(students$marks1, probs=seq(0,1,.25))
summary(students)
str(students)
students$rollno =as.character(students$rollno)
students$sname =as.character(students$sname)
str(students)
summary(students)
str(students)
head(students)
write.csv(students, 'fms.csv', row.names = F)
students2 = read.csv('fms.csv')
head(students2)
students3 = read.csv(file.choose())
head(students3)

#students
head(students)
library(dplyr)
head(students)
#querf - avg marks of females from SRCC
students[students$marks1 > 60 , ]
students[students$gender =='F' , ]
students[students$gender =='F' & students$college == 'SRCC' , ]
#highest from all college
#using dplyr
students %>% filter(gender=='M' & marks1 > 60)
#all students with gender = M, marks1> 60

students %>% group_by(gender) %>% summarise(mean(marks1), mean(marks2))
students %>% tally()
students %>% group_by(gender, college) %>% summarise(countTotal=n(), mean(marks1), max(marks2)) 
students %>% mutate(totalMarks = marks1 + 1.2 * marks2) %>% arrange(-totalMarks) %>% head(n=2)
students %>% mutate(totalMarks = marks1 + 1.2 * marks2) %>% filter(totalMarks == max(totalMarks))
head(students)
#
students %>% slice(seq(1,30,2))  #every alternate row
students %>% sample_n(5)  #random 5 rows
students %>% sample_frac(.2)  #random 20%

students %>% group_by(college) %>% summarise(max(marks1), max(marks2))
students %>% filter(college=='FMS') %>% select(marks1, marks2)

students
