# day4 - MAR - Munaz
#plan - Modeling

#What is Linear Regression ? , What does it do ?, How do we run the model in R ? How do we check if the model is good ?
#general eq : y = c + mx  ; y = c + b1x1 + b2x2 ....
#x's are IV, y is IV, c - constant/intercept; m/b1/b2 - slope/coeficients

women
?women
head(women)
#Does height depent on weight or vice-versa ?
#create relation ship between height & weight
lm1 = lm(weight ~ height, data=women)
summary(lm1)
print(lm1)
plot(weight ~ height, data=women, main='Height & Weight of Women')
abline(lm1)  #line of prediction
#as height increase, weight increases almost linearly
predict(lm1, newdata = data.frame(height = c(50, 65.5, 75.5, 100)))

#prediction for ranges beyond IV is wrong
range(women$height)


#multiple Linear Regression ------
df = mtcars[, c('mpg', 'wt','hp', 'drat')]
head(df)
lm2 = lm(mpg ~ wt + hp + drat, data=df)
print(lm2)
summary(lm2)
sapply(df, range)
(df1A = data.frame(wt= c(2,3), hp=c(100, 200), drat = c(3,4)))
predict(lm2, newdata = df1A)  #mpg predicted
cbind(df1A, mpgPredicted = predict(lm2, newdata = df1A))

library(car)
avPlots(lm2)
#about plot
#angle of the line in each plot matches the sign of coef from estimate equation
coef(lm2)
#x- single IV, y - DV (mpg)
#blue line - association bet IV & DV, keeping other IVs constant
#labelled points (2) - largest residuals & largest partial leverage (contribution of individual IV to total leverage/change)

#summary
summary(lm2)
#R2, Adjs R2, Coeff & their p value, FStat p Value
lm2$residuals   # diff betw predicted and actual DV
(lm2_residuals = residuals(lm2))
hist(lm2_residuals)   #it should look like normal
qqnorm(lm2_residuals)  #it should be straight line
qqline(lm2_residuals)   #few portions around the straight line

#multi-collinearity
library(ggcorrplot)
df_subset = df[, c('wt', 'hp', 'drat')]
(corr_matrix= round(cor(df_subset),2))
ggcorrplot(corr_matrix, hc.order=T, type='lower', lab=T)
#there is strong corr (< .8) , then keep only 1

#compare model----
anova(lm2)
#anova(model1, model2)  #if pvalue < .05, choose model1

#another way to check assumptions
plot(lm2)

par(mfrow=c(2,2))
plot(lm2)
#5key assumptions-----
#linear relationship, Multivariate normality, Little or no Multicollinearity, No Auto Correlation, Homoscedasticity

library(ggfortify)
autoplot(lm2)
par(mfrow=c(1,1))
#residual vs Fitted - Linear Relationship
plot(lm2, 1)
#Normal Q-Q : Normally Distributed Residuals
plot(lm2, 2)
#Scale-Location (Spread) : Homoeneity of variance of residuals. it should b horizontal line
plot(lm2, 3)
#Residuals vs Leverage : Influential cases (outliers)
plot(lm2, 5)
#Cooks Distance
plot(lm2, 4)  #3 extreme
plot(lm2, 4, id.n=5)   #top 5 extreme values

