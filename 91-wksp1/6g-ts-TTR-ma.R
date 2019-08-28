#Time Series - SMA
#packages used - TTR and forecast

library(forecast)
#MA
#https://www.rdocumentation.org/packages/forecast/versions/8.4/topics/ma
head(wineind)
?wineind
wineind
class(wineind)
str(wineind)
plot(wineind)
sma3 <- ma(wineind,order=3)
?ma  #function of forecast
sma3
head(wineind,n=3)
head(sma3, n=3)
sum(head(wineind,n=3)) / 3

lines(sma3,col="red")
sma3F <- ma(wineind,order=3, centre=F)
head(sma3F)


#centered
(v1 = runif(25,50,80))
(x = ts(v1)) #convert to Time Series Objects without any date
forecast::ma(x, order=2, centre=T)

plot(wineind)
csma12 <- ma(wineind,order=12, centre=T)
csma12
lines(csma12,col="red")



#method1
#https://rpubs.com/ajaydecis/ts5
kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)
kings
kingstimeseries <- ts(kings)
kingstimeseries
plot.ts(kingstimeseries)
#install.packages("TTR")
library("TTR")
(kingstimeseriesSMA8 <- SMA(kingstimeseries,n=8))
?SMA
plot.ts(kingstimeseriesSMA8)

library(forecast)
fit <- HoltWinters(kingstimeseries, beta=FALSE, gamma=FALSE)
fit1<- ets(kingstimeseries)
?ets
forecast(fit, 3)
plot(forecast(fit, 3)) 

forecast(fit1, 3)
plot(forecast(fit1, 3)) 




#Method2
#https://cran.r-project.org/web/packages/smooth/vignettes/sma.html
require(smooth)
require(Mcomp)
sma(M3$N2457$x, h=18, silent=FALSE)
sma(M3$N2568$x, h=18)
