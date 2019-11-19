
mtcars
n=1000
(rollno = 1:n-1)
(name = paste('Student',1:n,sep=''))
(gender = c(rep('M',n/2), rep('F',n/2)))
(marks = rnorm(n, mean=50, 10))
(area = sample(c('Mktg','Fin',"HR","Ops"), size=n, replace=T))

df = data.frame(rollno, name, gender, marks, area)
df

table(df$gender)
table(df$area)
barplot(table(df$gender))
barplot(table(df$area), col=1:4)
table(df$area, df$gender)
mean(df$marks)

df
df[df$gender == "M",]
df[df$gender == "M","marks"]
mean(df[df$gender == "M","marks"])

library(dplyr)
df %>% group_by(gender, area) %>% summarise(MM = mean(marks, na.rm=T), n())

df[df$name == 'Student100',]
hist(df$marks)
h=hist(df$marks,5)
h
