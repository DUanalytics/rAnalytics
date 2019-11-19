# SLR Area vs Sales
#https://www.statisticshowto.datasciencecentral.com/excel-regression-analysis-output-explained/

#import from ggsheet
library(gsheet)
slr1 = "https://docs.google.com/spreadsheets/d/1qLHa5qFTyWacta8F-IGo6J3Zpf-BVR9OrlqONuJDqYc/edit#gid=2023826519"
df = as.data.frame(gsheet2tbl(slr1))
head(df)
#X-area in sqft, Y-sales in some unit currency
str(df)
linearmodel = lm(Y ~ X, data=df)
plot(df$X, df$Y)
abline(lm(Y ~ X, data=df), col='red')
cor(df$X, df$Y)
cov(df$X, df$Y)
summary(linearmodel)
#Ho: (F Test) : No relationship between Y and any X
#Ha:  There is relationship between Y and at least one X
# p < 0.05 Reject Ho in favour of Ha
coef(linearmodel)
#Y = 0.96 + 1.66 * X
range(df$X) #value of X to be betw this range : interpolation not extrapolation 
(new2 = data.frame(X=c(1.5,2,3,4,5)))

(p2sales= predict(linearmodel, newdata= new2))
cbind(new2, p2sales)

summary(linearmodel)
head(df)
#residual
(Y = 0.96 + 1.66 * 2.2)
(r = 5.6 - 4.61)
plot(df$X, df$Y)
abline(lm(Y ~ X, data=df), col='red')
abline(v=2.2,h=c(5.6, 4.61))
cbind(resid(linearmodel))
fitted(linearmodel) - df$Y

#assumptions
plot(linearmodel)


#second case
#for women dataset; make a linear model
#predict weight for ht=62.5 and 66.5
head(women)
names(women)
range(women$height)
df1 = women
head(df1)
model1 = lm(weight ~ height, data = df1)
summary(model1)
#F-stat pvalue < 0.05 : Lin Model Exists
#Coeff : Both are significant
#if ht is increased by 1 unit, wt incr 3.45 units
#Multiple r2 : 99% of variation in Wt is due to Ht
#Assumptions : plot ; linearity, normality, equal variance, outliers, no autocorrelation, no multi-collinearity
#predict
(ndata2 = data.frame(height=c(62.5, 66.5)))
(p2wt = predict( level=.95,interval= 'confidence', newdata= ndata2, object=model1))
cbind(ndata2, p2wt)
?predict


