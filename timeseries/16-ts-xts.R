#xts
#creating XTS objects

library(xts)
#xts - matrix of observations combined with an index of corresponding dates and times.

#xts = matrix + times The main xts constructor takes a number of arguments, but the two most important are x for the data and order.by for the index. x must be a vector or matrix. order.by is a vector which must be the same length or number of rows as x, be a proper time or date object (very important!), and be in increasing order.

# Create the object data using 5 random numbers
(data = rnorm(5))

# Create dates as a Date class object starting from 2016-01-01
(dates = seq(as.Date("2016-01-01"), length = 5, by = "days"))

# Use xts() 
(sales5 = xts(x = data, order.by = dates))


#creating XTS objects

(xts1 = xts(x=1:10, order.by=Sys.Date()-1:10))
#see the index column / rownames

(data = rnorm(5))
(dates1 = seq(as.Date("2017-05-01"),length=5,by="days"))
(xts2 = xts(x=data, order.by=dates))

# Create bday (1899-05-08) - reference period using a POSIXct date class object
# Create xts object with datetime index and add a new attribute called born
(xts3 = xts(x=rnorm(10),  order.by=as.POSIXct(Sys.Date()+1:10), born=as.POSIXct("1899-05-08")))
#without time
(xts4 <- xts(x=1:10, order.by=Sys.Date()+1:10))

?xts











bday <- as.POSIXct("1899-05-08")


(hayek <- xts(x = data, order.by = dates, born = bday))
attributes(hayek)
