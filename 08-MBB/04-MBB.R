#04-MBB 

#data structures
#vector-----
age = c(34, 25, 56, 25, 70)
age
mean(age)
length(age)
min(age)
max(age)
range(age)
median(age)

(gender = c(rep('F',5), rep('M',10), rep('O',3)))
table(gender)
barplot(table(gender), col=1:3)

#dataframe
#rollno, name, age, gender
(rollno = 1:5)
(name = paste('student',1:5, sep='_'))
(age = round(rnorm(n=5, mean=40, sd=3),0))
(gender = sample(c('M', "F"), size=5, replace=T))
(student = data.frame(rollno, name, age, gender))

str(student)
str(mtcars)

student$name
mean(student$age)
head(student,n=2)
nrow(student)
student

(history = round(rnorm(n=5, mean=50, sd=3),0))
(maths = round(rnorm(n=5, mean=60, sd=2),0))
(science = round(rnorm(n=5, mean=55, sd=5),0))
(marks = data.frame(rollno, history, maths, science))
marks
marks2 <- marks %>% filter(rollno !=5)
marks2
head(student)
head(marks)

(data1 <- merge(student, marks, by.x='rollno', by.y='rollno'))
(data2 <- merge(student, marks2, by.x='rollno', by.y='rollno', all.x=F))
(data2 <- merge(student, marks2, by.x='rollno', by.y='rollno', all.x=T))

#matrix, list, arrays
(matrix1 = matrix(c(1:24), nrow=4, ncol=6))
colSums(matrix1)
rowSums(matrix1)
colMeans(matrix1)
?apply

#dplyr
library(dplyr)

mtcars
?mtcars
head(mtcars)

mtcars %>% group_by(am) %>% summarise(meanMPG = mean(mpg, na.rm=T))
mtcars %>% group_by(am) %>% summarise(meanMPG = mean(mpg, na.rm=T), meanWT = mean(wt, na.rm=T), maxHP = max(hp), minDisp = min(disp), count = n())

mtcars %>% filter(mpg > 26)
mtcars %>% filter(mpg < 26, vs == 0)
mtcars %>% filter(mpg < 26, vs == 0) %>% mutate(newmpg = mpg * 1.1 )

quantile(mtcars$mpg)

boxplot(mtcars$mpg)
mtcars %>% group_by(am,gear, carb) %>% summarise(meanMPG = mean(mpg, na.rm=T), meanWT = mean(wt, na.rm=T), maxHP = max(hp), minDisp = min(disp), count = n())


