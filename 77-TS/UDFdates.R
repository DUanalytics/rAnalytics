# date sequence as required
#https://cran.r-project.org/web/packages/bizdays/bizdays.pdf

library(lubridate)
library(bizdays)
#calendar year
from1 = as.Date('2019-01-01') ; to1 = as.Date('2019-12-31')

#all days
d1 = seq(from1, to1, by="1 day")
d1
length(d1)
weekdays(d1)

#only working days
d1 <- seq(from1, to1, by="1 day")
wkd1 <- d1[ ! weekdays(d1) %in% c('Saturday','Sunday') ]
wkd1
length(wkd1)
weekdays(wkd1)
table(weekdays(wkd1))

#------------------------
#last day of week
wkd1= seq(from2, to1, by="1 week")
wkd1
weekdays(wkd1)

#month- last date
m1 = seq(from1, to1, by="1 month")
m1
ceiling_date(m1, "month") - days(1)
weekdays(ceiling_date(m1, "month") - days(1))

#quarter - last date
q1 = seq(from1, to1, by="1 quarter")
q1

diff(q1)
interval(dmy(01112018), today()) %/% months(1) #months between a date and today

#half year - last date
from1; to1
h1 = seq(from1, to1 , by="6 month")
h1

#year 
y1 = seq(from1, to1, by="year")
y1

# all dates
d1
wd1
wd1
m1
q1
h1
y1

D1 <- expand.grid(c('D'), d1)
WD1 <- expand.grid(c('WD'), wd1)
M1 <- expand.grid(c('M'), m1)
Q1 <- expand.grid(c('Q'), q1)
H1 <- expand.grid(c('H'), h1)
Y1 <- expand.grid(c('H'), y1)
rbind(D1, WD1, M1, Q1, H1, Y1)



#https://rdrr.io/cran/lubridate/man/round_date.html
#https://davidcarslaw.github.io/openair/reference/selectByDate.html
library(openair)

kc1 <- importAURN(site = "kc1", year = 2018:2019)
head(kc1)
selectByDate(kc1, day = "weekday", year = 2018, month = 6:9, hour = 7:19)
openair::selectByDate(d1, day='weekday', year=2019, month=3:4)

library(timeDate)
isBizday(d1, holidays = holidayNYSE(), wday = 1:5)
?isBizday()

holidayNYSE()
isBizday(ts(d1), holidayNYSE())
tS[isBizday(tS, holidayNYSE())]


#------------- custom periods
# date sequence as required
#https://cran.r-project.org/web/packages/bizdays/bizdays.pdf

library(lubridate)
library(bizdays)


from1 = as.Date('2019-01-01') ; to1 = as.Date('2019-12-31')
from1 = as.Date('2018-09-01') ; to1 = as.Date('2019-08-31')

#all days
d1 = seq(from1, to1, by="1 day")
d1
length(d1)
weekdays(d1)

#only working days
d1 <- seq(from1, to1, by="1 day")
wkd1 <- d1[ ! weekdays(d1) %in% c('Saturday','Sunday') ]
wkd1
length(wkd1)


#------------------------
from2 = as.Date('2018-12-30')
from2 = as.Date('2018-08-30') + 3

#weekend
wkd1= seq(from2, to1, by="1 week")
wkd1
weekdays(wkd1)

#month- last date
m1 = seq(from1, to1, by="1 month")
m1
ceiling_date(m1, "month") - days(1)

#quarter - last date
q1 = seq(from1, to1, by="1 quarter")
q1

(q2 <- seq(from1, to1 , by="3 month"))
(q2 <- ceiling_date(q2 - days(1), "month"))

#half year - last date
from1; to1
h1 = seq(from1, to1 , by="6 month")
h2 <- h1 + months(5)
h2 <- ceiling_date(h2, 'month') - days(1)

#year 
y1 = seq(from1, to1, by="year")
y1
ceiling_date(y1, "year") - days(1)

(y2 = from1 + months(12) - days(1)) 

# all dates
d1
wd1
wd1
m1
q2
h2
y2

expand.grid(c('D'), d1)
expand.grid(c('WD'), wd1)
expand.grid(c('M'), m1)
expand.grid(c('Q'), q2)
expand.grid(c('H'), h2)
expand.grid(c('H'), y2)


#https://rdrr.io/cran/lubridate/man/round_date.html
#https://davidcarslaw.github.io/openair/reference/selectByDate.html
library(openair)

kc1 <- importAURN(site = "kc1", year = 2018:2019)
head(kc1)
selectByDate(kc1, day = "weekday", year = 2018, month = 6:9, hour = 7:19)
openair::selectByDate(d1, day='weekday', year=2019, month=3:4)

library(timeDate)
isBizday(d1, holidays = holidayNYSE(), wday = 1:5)
?isBizday()

holidayNYSE()
isBizday(ts(d1), holidayNYSE())
tS[isBizday(tS, holidayNYSE())]