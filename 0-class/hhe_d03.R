#day 3
library(dplyr)

#with and within-----

df = mtcars

#with(DF, expr) : new Col
#within(DF, newCol <- expr) : new DF

(newMPG <- with(df, mpg * 1.5))
class(newMPG)
(DF2 <- within(df, newMPG2 <- mpg * 1.5))
class(DF2)

#table-----


#mutate------
df %>% mutate(gear = factor(gear)) %>% summary()

df %>% mutate_at(c('cyl','vs', 'am','carb'), as.factor) %>% summary()
df %>% mutate(across(c(cyl, vs, am, carb), .fns= as.factor))  %>% str()
df %>% mutate(across(c(2,8:11), .fns= as.factor))   %>% summary()

df %>% mutate(across(c(mpg, wt, hp), .fns= round)) %>% head()

cols = c('mpg', 'hp')  #list of cols
df %>% mutate(across(all_of(cols), .fns= round)) %>% head()

#only numeric & mpg & wt
df %>% mutate(across(where(is.double) & c(mpg, wt), .fns= round)) %>% head()

#summarise----purr style
df %>% group_by(gear)  %>% summarise(across(all_of(cols), ~mean(.x, na.rm=T)))
df %>% group_by(gear)  %>% summarise(across(all_of(cols), list(mean=mean, sd=sd)))

#names of output-----
df %>% group_by(gear)  %>% summarise(across(all_of(cols), list(mean=mean, sd=sd), .names = '{.col}.{.fn}'))
df %>% group_by(gear)  %>% summarise(across(all_of(cols), list(mean=mean, sd=sd), .names = '{.fn}.{.col}'))

df %>% filter(if_any(.cols = c(1:11), .fns= is.character))
df %>% filter(if_any(.cols = c(1:11), .fns= is.integer))
df %>% filter(if_any(.cols = c(1:11), .fns= is.numeric))

df %>% filter(if_all(.cols = c(1,3,4,5), .fns= is.numeric))

df %>% select_if(is.numeric)  %>% names()
df %>% select_if(where(is.numeric))  %>% names()
df %>% purrr::discard(~is.numeric(.))  %>% names()
df %>% purrr::discard(~ !is.numeric(.))  %>% names()
df %>% purrr::keep(~ is.numeric(.))  %>% names()
df %>% purrr::keep(~ is.factor(.))  %>% names()
df %>% mutate_at(c('cyl','vs', 'am','carb'), as.factor) %>% purrr::keep(~ is.factor(.))  %>% names()
df %>% select_if(is.integer)

#groupby-------
df %>% select(gear, mpg, hp, disp) %>% group_by(gear)  %>% summarise(across(everything(), mean))
df  %>% group_by(gear)  %>% summarise(across(c(mpg, hp, disp, qsec), mean), .groups = 'drop')

#arrange-------



#missingValues------
v1 = c(1, NA, 3, 4, NA, 6)
v1
sum(is.na(v1))
mean(v1)
mean(v1, na.rm=T)

v1[is.na(v1)] = 99
v1


df2 = df
df2[sample(1:32, size=10), 'mpg'] = NA
df2[sample(1:32, size=10), 'hp'] = NA
colSums(is.na(df2))
str(df2)

df2 %>% select(mpg, hp, gear)
df2 %>% mutate(mpg = ifelse(is.na(mpg), mean(mpg, na.rm=T), mpg))  %>% select(mpg, hp, gear)


#statistics-----
summary(df)
names(df)
numCols = c('mpg','hp','disp','qsec', 'wt')
cor(df[numCols])
cor(df$wt, df$mpg)

sapply(df[,numCols], sd)
sapply(df[,numCols], mean)
sapply(df[,numCols], quantile)
sapply(df[,numCols], fivenum)
fivenum(df$wt)  #min, lowerHinge, median, upperHinge, max
boxplot(df$wt, main=paste('Five Number Summary Box Plot \n min, lowerHinge, median, upperHinge, max \n', paste(fivenum(df$wt), collapse=',')))
abline(h=fivenum(df$wt))
boxplot(wt ~ am, data=df, ann=T, col=c('red','green'))

library(e1071)
skewness(df$wt)
kurtosis(df$wt)


library(Rfast)
colkurtosis(as.matrix(df[,numCols]))

#devtools::install_github('smin95/smplot')
#devtools::install_github('smin95/smplot2', force=T)

library(smplot2)
?smplot2
