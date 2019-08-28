#first file - comment
#day 1 and day2
mtcars
colSums(mtcars)
barplot(table(mtcars$gear), col=1:4)

#to execute a line - Control + Enter
mtcars
?mtcars
#?  # this context sensitive help
?table
mean(mtcars$mpg) #mean mpg of all cars
table(mtcars$cyl) #no of cars with different gears
colMeans(mtcars)  #mean of all features

#libraries enhance the features of Base R
#install and then load
#install can be done GUI or by command
#GUI - Bottom Right Pane - Packages - Install - give the name of package
#command : install.packages(dplyr)
library(dplyr)  #loading a package / library : control + enter
#all functions in the library gets available for use
#no of cars of each cylinder type
mtcars %>% group_by(cyl) %>% count()
mtcars %>% group_by(cyl) %>% tally()
mtcars %>% group_by(cyl) %>% summarise(n=n())


#student properties
#marks, gender, rollno
marks = c(70,60,73.6)  # continuous
marks
mean(marks)
gender = c('M','F','M')  #category
?c
#mean(gender)
table(gender)
rollno = c(100, 101, 102) #character/ number
length(rollno)
#scales of measurement

#-----

#student data-----
x=10 #assign
x #print
(y=20) #assign and print
#rollno, name, age, gender, course, marks1, marks2
(n=100)  #assign and print in the screen
(rollno = c(100:(n+100-1)))
length(rollno)
(sname = paste('Student ', 1:n, sep='- '))
set.seed(1234) #gets the same pattern, any positive no
(age = runif(n=n, min=19, max=24))
plot(density(age))
mean(age)

set.seed(1234)
(gender = sample(c('M','F'), size=n, replace=TRUE, prob=c(.7,.3)))
table(gender)
prop.table(table(gender))

set.seed(1234)
(course = sample(c('BBA','BA','BTECH'), size=n, replace=T, prob=c(.6,.25,.15)))
table(course)

set.seed(1234)
(marks1 = rnorm(n=n, mean=65, sd=10))
mean(marks1); sd(marks1)
?distributions
set.seed(1234)
(marks2 = rnorm(n=n, mean=60, sd=12))
mean(marks2); sd(marks2)

#see the output
rollno; sname; gender; course ; age; marks1 ; marks2
length(rollno)

students = data.frame(rollno, sname, gender, course, age, marks1, marks2)
head(students)

library(dplyr) #using pipe 
students %>% group_by(gender) %>% tally()
students %>% group_by(course, gender) %>% tally()
students %>% group_by(course) %>% summarise(mage = mean(age), mmarks1 = min(marks1), Mmarks1 = max(marks2)) %>% arrange(mage)

#Day2 : Bennett
