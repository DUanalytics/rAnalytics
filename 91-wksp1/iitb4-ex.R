#exercise

#create a dataframe of these columns for 1000 students
#rollno, sname, gender, age, marks1, mark2, passfail
#passfail - 0 fail, 1 pass
n=1000
(rollno = 1:n)
(sname = paste('Student', 1:n, sep='_'))
(gender = sample(c('M','F'), size=n, replace=T, prob=c(.35, .65))   ) #M, F; 65% females
table(gender)
prop.table(table(gender))
(age =  trunc(runif(n, 20, 30)))    #between 20 and 30 , uniform distribution
(marks1 = round(rnorm(n, mean=65, sd=10))  ) #mean=65, sd=10 , normally distributed
(marks2 = round(rnorm(n, mean=70, sd=8),2))  # mean=70, sd=8, normally distributed
(course = sample(c('btech','mtech','phd'), size=n, replace=T, prob=c(.7, .2, .1)))
(passfail = sample(c(0,1), size=n, replace=T, prob=c(.4,.6)) )  #Pass, Fail on placement drive, 60% in pass
#give the data frame name as dataiitb 
dataiitb = data.frame(rollno, sname, gender, age, course, marks1, marks2, passfail)
head(dataiitb)
write.csv(dataiitb, './data/dataiitb.csv') #subdirectory data in current repository
#find properties of data like 
#first few and last few rows
head(dataiitb)
tail(dataiitb)
#dimensions
dim(dataiitb)
#no of rows and columns
nrow(dataiitb); ncol(dataiitb)
#summary
summary(dataiitb)
#structure
str(dataiitb)
#class of data
class(dataiitb)
#import from online csv
data2 = read.csv('https://raw.githubusercontent.com/dupadhyaya/hheanalytics/master/data/dataiitb.csv')
head(data2)

#find gender mean of marks1 and marks2
library(dplyr)
data2 %>% group_by(gender) %>% summarise(meanM1 = mean(marks1), meanM2 = mean(marks2))

sum1 <- data2 %>% group_by(gender, course) %>% summarise(meanM1= mean(marks1), minA = min(age), sdA = sd(age), count=n()) %>% arrange(gender, desc(sdA))
sum1

#arrange the data in the order of gender, sdA

#who are the top 2 students from each gender from marks of subject2
data2 %>% group_by(gender) %>% arrange(gender, marks2) %>% top_n(2, marks2)

#make a barplot gender distribution
barplot(height=c(10,20))
table(data2$gender)
barplot(height = table(data2$gender), col=1:2)
barplot(height = table(data2$course))
hist(data2$marks1, breaks=5, col=1:5)
plot(density(data2$marks1))
plot(density(data2$age))

?barplot
#create a linear model of predicting marks1 from age
fit1 = lm(marks2 ~ age + marks1, data=data2)
summary(fit1)

#create a logistic model to predict passfail from marks1, marks2, gender
fit2 = glm(passfail ~ marks1 + marks2 + gender + course, data=data2, family='binomial')
?glm
summary(fit2)
#clustering
fit5 = kmeans(data2[, c('age','marks1','marks2')], centers = 4)
fit5$centers

#create a decision tree using previous case of logistic model. Predict passfail for sample case of gender, marks1, marks2
fit3 = rpart(passfail ~ marks1 + marks2 + gender, data=data2,method='class' )
summary(fit3)library
rpart.plot(fit3)
#create a decision tree - regression model : predict age on gender, marks1, marks2
