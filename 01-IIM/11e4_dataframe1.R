#Data Frame in R

#A data frame is a table or a two-dimensional array-like structure in which each column contains values of one variable and each row contains one set of values from each column. ... The data stored in a data frame can be of numeric, factor or character type.

mtcars
class(mtcars)

#lets us create a DF of 50 students
sizeN=50
#rollno, name, gender, grade, marks1, marks2
(rollno = 1:50)
(name = paste('Student', 101:150, sep='_'))
sex = c('M','F')
(gender = sample(x=sex, size=sizeN, replace=T, prob=c(.6,.4)))
table(gender)
(courses = c('BBA', 'MBA'))
(course = sample(x=courses, size=sizeN, replace=T, prob=c(.4,.6)))

(gradetypes = LETTERS[1:4])
(grades = sample(x=gradetypes, size=sizeN, replace=T, prob=c(.2,.3,.4, .1)))
table(grades)
(marks1 = trunc(rnorm(n=sizeN, mean=75, sd=5 ))) 
(marks2 = trunc(runif(n=sizeN, min=60, max=95 ))) 

vectorList = list (rollno, name, gender, course, grades, marks1, marks2)
mapply(length, vectorList)  #all are of length 50

#df
df1 = data.frame(rollno, name, gender, course, grades, marks1, marks2)
head(df1) #first 6
tail(df1,n=5)  #last 5 
class(df1)  #dataframe
summary(df1)  #summarys
str(df1)  #structure of data
attributes(df1)
names(df1) # names of cols
dim(df1) # dimensions 50 * 6
length(df1)  #no of columns

#selected 
df1[1:4, 1:5]
df1[1:5, c('rollno', 'name', 'gender')]
df1[df1$gender == 'M', c('rollno', 'name','gender')]
df1[df1$gender == 'M' & df1$marks1 > 80, c('rollno', 'name','gender')]
df1[df1$grades %in% c('A','C') & df1$marks2 > 80 & df1$marks1 < 75, c('rollno', 'name','gender', 'grades', 'marks1', 'marks2')]

#summary
aggregate(df1$marks1, by= list(df1$gender), FUN=max)
aggregate(cbind(marks1, marks2) ~ gender + course , data=df1, FUN=mean)

#other
df1[order(df1$marks1),] #sort by marks1
df1[order(df1$gender, df1$marks1),] #sort by gender marks1

#factors
(genderF = factor(gender))  #nominal data
(courseF = factor(course))  #course data
(gradesOF = factor(grades, ordered=T, levels = c('C','B','A','D')))
#D is highest

barplot(table(grades), col=1:4)
barplot(table(gradesOF), col=1:4)

summary(df1)

df2 = data.frame(rollno, name, genderF, courseF, gradesOF, marks1, marks2)
summary(df2)
#see the summary statistics
