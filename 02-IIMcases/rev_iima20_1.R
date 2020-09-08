#Revision Session - IIMA - Sep 2020

#vectors-----
x = 1:10000
class(x)
(marks = rnorm(n=100, mean=60, sd=10))

#matrices------
m1 = matrix(data = 1:100, ncol=10)
m1
colSums(m1)

#array--------

#list---------


#dataframe-----
rollno= 1:30
(sname = paste('IIM Student', 1:30))
(marks= rnorm(n=30, mean=60, sd=5))
df = data.frame(rollno, sname, marks)
head(df)
write.csv(df, './data/s1.csv', row.names = F)
#factors-------
sex = c('M','F')
(gender = sample(sex, size=30, replace=T))
df$gender = gender
head(df)
df$gender
summary(df)
df$gender = factor(df$gender)
summary(df)
#read/write - CSV, googlesheets

