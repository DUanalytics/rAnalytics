#MA

library(s20x)
?s20x
apples.df
data(airpass.df)
airpass.df

## STATS20x data:
data(course.df)
## Single variable summary
with(course.df, summaryStats(Exam))
## Using a formula
summaryStats(Exam ~ Stage1, course.df)

## Using a matrix
X = cbind(rnorm(50), rnorm(50))
summaryStats(X)
## Saving and extracting the information
sumStats = summaryStats(Exam ~ Degree, course.df)
sumStats
## Just the BAs
sumStats['BA', ]
## Just the means
?sumStats



#data 
url = 'https://raw.githubusercontent.com/PacktPublishing/Jupyter-for-Data-Science/master/Chapter01/grapeJuice.csv'

df = read.csv(url)
df
head(df)
boxplot(df$sales, horiz=T, xlab='sales')
hist(df$sales, main ='', xlab='sales' , prob=T)
lines(density(df$sales), lty='dashed',  lwd=2.5, col='red')

(sales_ad_nature = subset(df, ad_type == 0))
(sales_ad_family = subset(df, ad_type == 1))

hist(sales_ad_nature$sales, main= '', xlab ='sales with nature production theme ad', prob=T)
lines(density(sales_ad_nature$sales), lty='dashed', lwd=2.5, col='red')

#test Ho
shapiro.test(sales_ad_nature$sales)
shapiro.test(sales_ad_family$sales)
t.test(sales_ad_nature$sales, sales_ad_family$sales)

pairs(df, col='blue', pch=20)
pairs20x(df)

sales.reg <- lm(sales ~ price + ad_type + price_apple + price_cookies, data=df)
summary(sales.reg)

library(regclass)
regclass::VIF(sales.reg)

(inputData <- data.frame(price=10, ad_type=1, price_apple = 7.6, price_cookies = 9.738))
predict(sales.reg, inputData, interval='p')
