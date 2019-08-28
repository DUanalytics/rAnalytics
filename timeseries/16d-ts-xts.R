#xts time series

#Time Series
class(AirPassengers)
head(AirPassengers,10)
AirPassengers
#subset
window(AirPassengers, start=c(1950,3), end=c(1954,5))

#XTS series-----
airp.xts = as.xts(AirPassengers)
class(airp.xts)
#subset - looks at index values
airp.xts["1954-03/1954-09"] # range month-year
airp.xts["1954"]  #only 1954 year
airp.xts["/1954-09"] # start to  month-year
airp.xts["1954-09"] # for a particular period

airp.xts['1954-03/']  # March 1954 to the end of the data set
airp.xts['1954-03/1954']  # March 1954to the end of 1954
airp.xts['/'] # the whole data set
airp.xts['/1954'] # the beginning of the data through 1954
airp.xts['1954-01-03'] # just the 3rd of January 1954
#above will not work since it is monthly ts: create daily ts for this

#daily XTS 
(daily.xts = xts(x=1:40, order.by=Sys.Date()+1:40))
daily.xts["2018-10-28"]

#extra week data
first(daily.xts,'1 week') #Extract first 1 week
daily.xts
index(daily.xts)
.indexwday(daily.xts)
cbind(daily.xts, .indexwday(daily.xts))

#depends on sysdate
first(daily.xts,'2 week') #Extract first 2 weeks

#Get first 3 days of the 2nd last week of data
first(last(xts4,'2 week'),'3 days') 

