#missing values

rm(list = ls())
is.na(x) # returns TRUE of x is missing
x <- NA
is.na(x) # returns TRUE of x is missing

y <- c(1,2,3,NA)
is.na(y) # returns a vector (F F F T)

#Recoding Values to Missing
mt = mtcars
mt$v1 = 99
head(mt)
# recode 99 to missing for variable v1
# select rows where v1 is 99 and recode column v1
mt$v1[mt$v1==99] <- NA
mt

#Excluding Missing Values from Analyses
x <- c(1,2,NA,3)
mean(x) # returns NA
mean(x, na.rm=TRUE) # returns 2
mt
mt[c(1,4,10,15,30), 'v1'] = 100
mt
mt[complete.cases(mt),]

library(VIM)
sleep
is.na(sleep)
summary(sleep)
sum(is.na(sleep))
colSums(is.na(sleep))
rowSums(is.na(sleep))
complete.cases(sleep)
sleep[complete.cases(sleep),]

aggr(sleep, prop = F, numbers = T)


library(visdat)
vis_miss(sleep)
