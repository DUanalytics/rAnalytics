# autoreg

library(autoReg)


library(survival)
fit=coxph(Surv(time,status)~rx+logWBC,data=anderson)
adjustedPlot(fit)
adjustedPlot(fit,xnames="rx",se=TRUE,type="plot")
adjustedPlot(fit,xnames="rx",se=TRUE)
