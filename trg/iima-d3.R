
fit = lm(weight ~ height, data = women)
summary(fit)

#R2
#coefficients
#does linear model exists between Y & Xs
#pvalue of Stats : Exists < 0.05

#R2 : Multiple & Adjusted
#here we used Multiple becos of 1 IV ie height
#.991 what does it mean - Good Model  : > .6/ .7

#coefficients
#y = mx + c : c=-87, m=3.45, 
x=0; y = 3.45 * x + -87; y
range(women$height)
x=58 
(y = 3.45 * x + -87)
women [ women$height < 60, ]
#Pr value < 0.05  : Then coeff are significant : used in the model

#residual = actual - predicted
women$weight
fitted(fit)
cbind(women, fitted(fit), resid(fit))
#y = 3.45 * x - 87
resid(fit)
summary(resid(fit))

#predict : height = 60.5
women
ndata = data.frame(height=c(60.5, 70.5))
p1=predict(fit, newdata= ndata)
cbind(ndata, p1)

#assumptions of linear regression
#linearity, autocollinearity, multicollinearity, normality, homosodescity (equal variance), outliers 
#linked with residuals.... 
plot(fit)


plot(density(resid(fit)))
plot(fit, which=2)

par(mfrow=c(2,2))
plot(fit)


#normality
#autocollinearity
#multicollinarrity
#outliers



#cor
#plot
#linear model
#R2, F-pvalue, coeff
#predict for unknown input
#assumptions using plots
