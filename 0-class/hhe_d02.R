# HHE Batch :  MA with R ;  Munaz
#day2------

#vectors-----
(rollNo = 1:100)
paste('student',1:100)
(name = paste('student', sprintf('%003d',1:100)))
set.seed(1234)
(gender = sample(x=c('M','F'), size=100, replace=T, prob=c(.6, .4)))
table(gender)
prop.table(table(gender))
courses = c('BBA', 'MBA', 'PHD')
course = sample(x=courses, size=100, replace=T, prob = c(.5, .3, .2))
course
table(course)
prop.table(table(course))
#marketing, operations
(marketing  = round(rnorm(n=100, mean=65, sd=7)))
mean(marketing); sd(marketing)
?distributions
hist(marketing)
(operations = round(runif(n=100, min = 55, max=90)))
range(operations)
hist(operations)
grades = c('A','B','C')
(project = sample(x=grades, size=100, replace=T))
(project = factor(project, ordered=T, levels = c('C', 'B','A')))

varNames = list(rollNo, name, gender, course, marketing, operations, project)
sapply(varNames, length)
?sapply(varNames, IQR)
sapply(varNames, length)

?apply
#matrix------
(m1 = matrix(data= 1:24, nrow=4, ncol=6))


#array -----
(a1 = array(data = 1:24, dim = c(4,6)))
(a2 = array(data = 1:24, dim = c(3,4,2)))

#factor-----
(courses = factor(x=c('BBA', 'MBA', 'PHD')))
(likertScale = factor(x=c('Excellent','Good','Fair','Poor')))
(likertScale2 = factor(x=c('Excellent','Good','Fair','Poor'), ordered = T))
(likertScale2 = factor(x=c('Excellent','Good','Fair','Poor'), ordered = T, levels = c('Poor', 'Fair', 'Good','Excellent')))

#data frame-------
sapply(list(rollNo, name, gender, course), length)
df = data.frame(rollNo, name, gender, course, marketing, operations, project)
head(df)
str(df)
summary(df)
df$name
df$gender = factor(gender)
df$course = factor(course)
df$project
summary(df)
tail(df)

library(dplyr)
#mean marks of subjects - gender wise
df %>%  group_by(gender) %>% summarise(meanMarketing  = mean(marketing, na.rm=T), meanOperations = mean(operations, na.rm=T), count = n())


df %>% group_by(gender, course)  %>% summarise(meanM = mean(marketing, na.rm=T), maxM = max(marketing), minM = min(marketing))
names(df)
df %>% group_by(gender)  %>% summarise(across(.cols=marketing:operations, .fns=mean, .names='mean_{col}'))
df %>% group_by(gender) %>% summarise(across(.cols=c(marketing, operations), .fns = list(mean=mean, min=min, max=max), na.rm=T, .names="{fn}_{col}"))

df %>% group_by(gender) %>% summarise(across(where(is.numeric), .fns = list(mean=mean, max=max), na.rm=T, .names="{col}_{fn}"))
df %>% group_by(gender) %>% summarise(across(where(is.numeric), .fns = list(mean=mean, max=max), .unpack=T))

cols = c('marketing', 'operations')
df
df %>% mutate(across(all_of(cols), round,-1))
df %>% mutate(across(where(is.double) & !c('marketing'), round,-1))
x=1234566677.999
round(x,0)
trunc(x,2)
floor(x)
ceiling(x)
?grepl
gsub('4','99999999',x)
#automatically unpack
x='munaz'
gsub('z','j',x)
#list --

#ggplot-------
library(ggplot2)
head(mpg)
?mpg
?ggplot
ggplot(mpg, aes(x=displ, y=hwy, colour = class)) + geom_point() 
head(mtcars)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point(color='red')
ggplot(mtcars, aes(x=wt, y=mpg, color=factor(gear), shape=factor(cyl), size=hp)) + geom_point()

ggplot(mtcars, aes(x=wt, y=mpg, color=factor(gear), shape=factor(cyl), size=hp)) + geom_point() + geom_text(aes(label=paste0('(',wt,',',mpg,')')), hjust=1.5, size=3)  + facet_wrap(am ~ vs, labeller = label_both)
?facet_wrap

#end of day2---------