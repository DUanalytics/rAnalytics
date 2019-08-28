#Durations, Intervals and Periods
#lubridate provides three classes, or three different ways, to distinguish between different types of time spans.
#Duration ,Interval, Period

#Understanding these classes will help you get the most out of lubridate.

#The most simple is Duration. This is simply a span of time measured in seconds. There is no start date.

#An Interval is also measured in seconds but has an associated start date. An Interval measures elapsed seconds between two specific points in time.

#A Period records a time span in units larger than seconds, such as years or months. Unlike seconds, years and months differ in time. June has 30 days while July has 31 days. February has 28 days except for leap years when it has 29 days. With the Period class, we can add 1 month to February 1 and get March 1. It allows us to perform calculations in calendar or clock time as opposed to absolute number of seconds.

#Let’s see these three classes in action. Below we define two dates in the US Eastern time zone. The start day is March 11, 2017 at 5:21 AM. The end day is March 12, 2017 at the same time. 

(start = mdy_hm("3-11-2017 5:21"))
(end = mdy_hm("3-12-2017 5:21"))

#Since we’re dealing with elapsed time between two dates, let’s start with Intervals. We can define an Interval using the %--% operator.

(time.interval = start %--% end)
## [1] 2017-03-11 05:21:00 EST--2017-03-12 05:21:00 EDT

str(time.interval)

#To create a Duration between these two dates, we can use the as.duration function.
(time.duration = as.duration(time.interval))

str(time.duration)

#We can create a Period from an Interval using the as.period function.

(time.period <- as.period(time.interval))
#A Period prints elapsed time as integers in the form of years, months, weeks, days and so on. Notice this Period is 1 day long. 

str(time.period)


#summary
An Interval is elapsed time in seconds between two specific dates. (If no time is provided, the time for each date is assumed to be 00:00:00, or midnight.)
A Duration is elapsed time in seconds independent of a start date.
A Period is elapsed time in “calendar” or “clock” time (4 weeks, 2 months, etc) independent of a start date.