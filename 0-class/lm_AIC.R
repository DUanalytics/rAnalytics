# AIC Linear Regression

#https://bookdown.org/steve_midway/DAR/model-selection.html

mtcars.lm1 <- lm(mpg ~ disp, data=mtcars)
summary(mtcars.lm1)
broom::glance(mtcars.lm1)

mtcars.lm2 <- lm(mpg ~ disp + wt, data=mtcars)
broom::glance(mtcars.lm2)


mtcars.lm3 <- lm(mpg ~ disp + wt + hp, data=mtcars)
broom::glance(mtcars.lm3)

mtcars.lm4 <- lm(mpg ~ disp + wt + hp + cyl, data=mtcars) 
broom::glance(mtcars.lm4)

mtcars.lm5 <- lm(mpg ~ disp + wt + hp + cyl + gear, data=mtcars)
broom::glance(mtcars.lm5)

AIC(mtcars.lm1, mtcars.lm2, mtcars.lm3, mtcars.lm4, mtcars.lm5)
sapply(list(mtcars.lm1, mtcars.lm2, mtcars.lm3, mtcars.lm4, mtcars.lm5), broom::glance)
#http://www.sthda.com/english/articles/38-regression-model-validation/158-regression-model-accuracy-metrics-r-square-aic-bic-cp-and-more/
library(MASS)
data(mtcars)
summary(car_model <- lm(mpg ~., data = mtcars))
step_car <- stepAIC(car_model, trace = TRUE, direction= "both")
#The goal is to have the combination of variables that has the lowest AIC or lowest residual sum of squares (RSS).
step_car
#The last line is the final model that we assign to step_car object.
library(stargazer)
stargazer(car_model, step_car, type = "text")

#----
library(olsrr)
step_plot <- ols_step_both_aic(car_model)

plot(step_plot)
?ols_step_both_aic
