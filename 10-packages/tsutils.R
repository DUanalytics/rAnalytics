#tsutils

#https://cran.r-project.org/web/packages/tsutils/tsutils.pdf
#https://kourentzes.com/forecasting/2019/01/14/r-package-tsutils/
#https://kourentzes.com/forecasting/2016/10/15/abc-xyz-analysis-for-forecasting/
library(tsutils)

x <- abs(matrix(cumsum(rnorm(5400,0,1)),36,150))
x
z <- abc(x)
print(z)
plot(z)

abc(x, prc = c(0.2, 0.3, 0.5))

abcxyz(abc(x),xyz(x,type="cv"))

referrals
cmav(referrals,outplot=TRUE)

coxstuart(referrals)

decomp(referrals)

decomp(AirPassengers)

x1 <- rnorm(10)
lagmatrix(x1,c(0,1,-1,2))
lagmatrix(AirPassengers,c(0,1,2))


x2 <- c(rep(0,5),rnorm(100),rep(0,5))
x2
leadtrail(x2, rm=NULL, lead=c(T,T), trail=c(T,T))

?plotSthief(AirPassengers)
plotSthief(AirPassengers, labels=c(T,T,T))          

seasplot(referrals,outplot=1)
Sthief(AirPassengers)
trendtest(referrals,TRUE)

wins(x, p = 0.05)

z2 <- xyz(x,m=12)
print(z2)
plot(z2)

cma(x)

x5 = rnorm(n=50, mean=50, sd=5)
x5
abc(x5)

x6 = c(1:10)
x6
dim(x6)
dim(x6) = c(2,5)
x6
abc(x6)
plot(abc(x6))

cmav(referrals)
