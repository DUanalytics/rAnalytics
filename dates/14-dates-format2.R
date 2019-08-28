#Other formats of displaying dates

(startdt = as.Date("2018-11-30", format="%Y-%m-%d"))
#create 45 days course starting from above date
(course = startdt + 1:45)
length(course)

#display 
format(course, "%d-%b")
#display without quote
cat(format(course, format="%B-%d"))
#Month-date

#standard values
months(course)
weekdays(course)
quarters(course)
