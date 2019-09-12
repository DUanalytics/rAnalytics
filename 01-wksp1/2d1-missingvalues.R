# Missing values
#missing values are indicate NA  keyword
x = c(1, ,3)
x = c(NA, 1, NA, 2,3, NA)
x1=x
x
is.na(x)
sum(is.na(x))
sum(c(T,F,T,F,F))
x
mean(x)

?mean
mean(x, na.rm=T)
sum(x,na.rm=T)/3
x
x[is.na(x)]
x[is.na(x)] = mean(x, na.rm=T)
x
cbind(x,x1)
x1 = c(4,6,8,9)
length(x1[x1 >= 6])
sum(x1 >= 6)
x1 >= 6

x2 = rnorm(100000, mean=50, sd=5)
x2
length(x2)
posn=sample(100000, size=30)
posn
x2[posn] = NA
summary(x2)
is.na(x2)
sum(is.na(x2))
mean(x2)
mean(x2, na.rm=T)
x2[is.na(x2)] = mean(x2, na.rm=T)
sum(is.na(x2))

?read.csv
#install this library
library(VIM)
?sleep
data(sleep, package='VIM')
head(sleep) #first few rows of sleep
dim(sleep)  #dimensions of sleep data
complete.cases(sleep)  # which row have complete data in T/ F
sum(complete.cases(sleep))  # no of rows have which no missing data
sum(!complete.cases(sleep))  # no of rows which have missing data
sleep[complete.cases(sleep),]  #rows which are complete
sleep[!complete.cases(sleep),] #rows which have missing values
summary(sleep)
colSums(is.na(sleep))  #which column how many data missing
rowSums(is.na(sleep))  #which row how many data missing

df= sleep #make a copy of sleep data
complete.cases(df) #complete cases
mean(df$Dream, na.rm=T) #mean of Dream Col
summary(df)
df[ , 4:5]; df[ ,c(1,3,5)]
df[is.na(df$Dream), 'Dream'] #missing values in Dream Column
df[is.na(df$Dream), 'Dream'] = mean(df$Dream, na.rm=T)

#use mice package
library(mice)

#https://www.analyticsvidhya.com/blog/2016/03/tutorial-powerful-packages-imputing-missing-values/
#MICE, Amelia, missForest, Hmisc, mi