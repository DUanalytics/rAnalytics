#Linear Model : Sales - TV, Radio, Newspaper

library(dplyr)
df = read.table("https://online.stat.psu.edu/onlinecourses/sites/stat508/files/lesson01/Advertising.data", header = T)
df
head(df)
cor(df)
cov(df)
plot(df$TV, df$Sales)
plot(df$Radio, df$Sales)
plot(df$Newspaper, df$Sales)

linModel = lm(Sales ~ TV + Radio + Newspaper, data=df)
summary(linModel)
#Newspaper is not significant
linModel2 = lm(Sales ~ TV + Radio, data=df)
summary(linModel2)
#all are significant; Adjust R2 > .89

anova(linModel, linModel2)
AIC(linModel, linModel2)

s1 <- sample_n(df,2)
predict(linModel2, newdata=s1, type='response')
df
