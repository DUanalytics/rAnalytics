#Create Sequence of Dates

#Next day after certain date
as.Date('2018-04-29') + 1
#Sequence of Dates
as.Date('2018-09-16') + 1:15
#alternative Dates
as.Date('2018-09-16') + seq(1,10,2)


#system date
Sys.Date()
#next 15 days after todays date
Sys.Date() + 1:15

##increment/ decrement dates 
(startdt = as.Date("2018-11-30", format="%Y-%m-%d"))
(next20days = startdt + 1:20) # start : 20 days course
startdt - 1
(prev20days = startdt - c(1:20)) # before : 20 days course
rev(prev20days)
