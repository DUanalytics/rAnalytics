#topics ----
#factors, env, import/export. package install
#rep, recode, split, partition, subset, loops, cast & melt
#missing values. duplicates, apply
#graphs - bar, multiple line, pie, box, corrgram
# predict weight for certain height

women
head(women)
?women
dim(women)
dim(women)
plot(women)
cor(women)  #strength & direction of relations -1 to 0 to +1
cor(women$height, women$weight)
cov(women$height, women$weight)
#is height the cause of change in weight ???? - do linear regression
fit = lm(weight ~ height,data = women)
summary(fit)
range(women$height)
y = mx + c
weight = m * height + c
weight = 3.45 * height + - 87
#cannot do exterpoliation, only interpolate withing IV range

(ndata = data.frame(height = c(60.5, 70.5, 71.5)))
(predictedwt = predict(fit, newdata = ndata))
cbind(ndata, predictedwt)
3.45 * 60.5 + - 87
resid(fit)
fitted(fit)
cbind(women, fitted(fit), resid(fit))
#assumptions

plot(fit)

#multiple linear regression
head(mtcars)
df <- mtcars %>% select(mpg, wt, hp)
head(df)
fit2 = lm(mpg ~ wt + hp, data = df)
summary(fit2)
mpg = 37 + -3.87 * wt + - 0.03 * hp
37 + -3.87 * 2.620 + - 0.03 * 110
resid(fit2)
df$mpg
fitted(fit2)
cbind(df$mpg, fitted(fit2), resid(fit2), df$mpg - fitted(fit2))

#cpp, java.. object oriented - correlation
residuals(fit2)
df$mpg - fitted(fit2)  #predicted values
resid(fit2) == residuals(fit2)

plot(fit2)
women
df2 = women
df3 = rbind(df2, c(73, 500))
fit2b = lm(weight ~ height, data = df3)
summary(fit2b)
summary(fit)
plot(fit2b)
df3
