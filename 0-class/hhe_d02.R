# HHE Batch : Apr 2023

#D1 - git, r , rstudio, vectors, environment
#D2 - Hari
#day2------

#vectors-----
(rollNo = 1:100)
(name = paste('student', sprintf('%003d',1:100)))
set.seed(1234)
(gender = sample(x=c('M','F'), size=100, replace=T, prob=c(.6, .4)))
table(gender)
courses = c('BBA', 'MBA', 'PHD')
course = sample(x=courses, size=100, replace=T, prob = c(.5, .3, .2))
table(course)
prop.table(table(course))
(marketing  = round(rnorm(n=100, mean=65, sd=7)))
mean(marketing); sd(marketing)
hist(marketing)
(operations = round(runif(n=100, min = 55, max=90)))
range(operations)
grades = c('A','B','C')
(project = sample(x=grades, size=100, replace=T))
(project = factor(project, ordered=T, levels = c('C', 'B','A')))

varNames = list(rollNo, name, gender, course, marketing, operations, project)
sapply(varNames, length)

#matrix------
(m1 = matrix(data= 1:24, nrow=4, ncol=6))


#array -----
(a1 = array(data = 1:24, dim = c(4,6)))
(a2 = array(data = 1:24, dim = c(3,4,2)))

#factor-----
(course = factor(x=c('BBA', 'MBA', 'PHD')))
(likertScale = factor(x=c('Excellent','Good','Fair','Poor')))
(likertScale2 = factor(x=c('Excellent','Good','Fair','Poor'), ordered = T))
(likertScale2 = factor(x=c('Excellent','Good','Fair','Poor'), ordered = T, levels = c('Poor', 'Fair', 'Good','Excellent')))

#data frame-------

df = data.frame(rollNo, name, gender, course, marketing, operations, project)
head(df)
str(df)
summary(df)
df$gender = factor(gender)
df$course = factor(course)
summary(df)
tail(df)

library(dplyr)
#mean marks of subjects - gender wise
df %>%  group_by(gender) %>% summarise(meanMarketing  = mean(marketing, na.rm=T), meanOperations = mean(operations, na.rm=T), count = n())


df %>% group_by(gender, course)  %>% summarise(meanM = mean(marketing, na.rm=T), maxM = max(marketing), minM = min(marketing))

df %>% group_by(gender)  %>% summarise(across(.cols=marketing:operations, .fns=mean, .names='mean_{col}'))
df %>% group_by(gender) %>% summarise(across(.cols=c(marketing, operations), .fns = list(mean=mean, min=min, max=max), na.rm=T, .names="{col}_{fn}"))
df %>% group_by(gender) %>% summarise(across(where(is.numeric), .fns = list(mean=mean, max=max), na.rm=T, .names="{col}_{fn}"))
df %>% group_by(gender) %>% summarise(across(where(is.numeric), .fns = list(mean=mean, max=max), .unpack=T))
cols = c('marketing', 'operations')
df %>% mutate(across(all_of(cols), round,-1))
df %>% mutate(across(where(is.double) & !c('marketing'), round,-1))

#automatically unpack

#list --

