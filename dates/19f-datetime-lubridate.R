#Lubridate : Calculations and conversions

#Once we format dates and define our time span we often want to do some calculations and conversions. For example, we may want to calculate the mean elapsed time in weeks for different groups.

#Let’s create some data and demonstrate. First we enter arbitrary start and end dates and define an Interval

start = c("2012-08-21", "2012-09-01", "2012-08-15", "2012-09-18")
end = c("2012-09-16", "2012-09-06", "2012-08-22", "2012-10-11")
(elapsed.time = start %--% end)

#If we view the elapsed.time object we’ll just see date ranges. We can use as.duration or even as.numeric to view the elapsed time in seconds but that’s not very useful in this case. It would be better if we converted seconds to another unit of time such as weeks or days. Fortunately lubridate makes this easy.

#The trick is to convert intervals to durations and then divide the duration by a duration object in the units we desire. That’s a mouthful but easy to demonstrate. Below we demonstrate how to convert to weeks. 
#First we convert our interval to a duration, and then we divide by dweeks(1). The function call dweeks(1) generates a duration of one week in seconds, which is 604800. Dividing that into our duration returns number of weeks.

dweeks(1)
ddays(1)
dyears(1)
dhours(1)
dhours(2)
ddays(1)

as.duration(elapsed.time) / dweeks(1)
## [1] 3.7142857 0.7142857 1.0000000 3.2857143

#We can do the same with hours, days, minutes and years.

as.duration(elapsed.time) / dhours(1)
## [1] 624 120 168 552
as.duration(elapsed.time) / ddays(1)
## [1] 26  5  7 23
as.duration(elapsed.time) / dminutes(1)
## [1] 37440  7200 10080 33120
as.duration(elapsed.time) / dyears(1)
## [1] 0.07123288 0.01369863 0.01917808 0.06301370

#Once we have the durations in the units we want, we can then do things like find the mean.

mean(as.duration(elapsed.time) / dweeks(1))
## [1] 2.178571

#----------

As another example, consider the following vector of character data summarizing a duration of time. “12w” means 12 weeks and “4d” means 4 days.

StudyTime <- c("12w 4d", "11w", "10w 5d", NA, "12w 6d")
What if we wanted to convert that to numeric weeks? First we’ll give the R code and them explain how it works.

as.duration(period(StudyTime, units = c("week","day"))) / dweeks(1)
## [1] 12.57143 11.00000 10.71429       NA 12.85714
First we use the period function to define a Period using our data. The units argument says the first part of our data represents weeks and the second part represents days. That is then converted to a Duration object that stores time in seconds. Finally we divide by dweeks(1) to convert seconds to weeks. Notice how the NA remains NA and that “11w” converts to 11 just fine even though it had no days appended to it.