#Data Format in R 
#When we import data into R, dates and times are usually stored as character or factor by default due to symbols such as “-”, “:” and “/”
cdate1='15/August/1947'
cdate1
cdate2 = c('15-Aug-1947', "26-Jan-1950")
cdate2

class(cdate1) ; class(cdate2)
#convert to Dates
#Default Format of Date in R
?as.Date()

#See/ Convert Date format
as.Date('2018-09-01')
#Default Format : Year-Month-Date : %Y-%m-%d
(date3= as.Date('2018-09-01',format='%Y-%m-%d'))
class(date3)

#Format Types ----
#%Y: 4-digit year (1982),%y: 2-digit year (82)
#%m: 2-digit month (01)
#%B: month (January), %b: abbreviated month (Jan) %d: 2-digit day of the month (13)
#%A: weekday (Wednesday), %a: abbreviated weekday (Wed)

#convert cdate1 cdate2 to date formats
cdate1 #"15/August/1947
date1 = as.Date(cdate1, format='%d/%B/%y')
date1
#
cdate2 #"15-Aug-1947" "26-Jan-1950"
date2 = as.Date(cdate2, format='%d-%b-%Y')
date2
#

#one more practise on date format
date3 =as.Date('30Apr18',format("%d%b%y"))
class(date3)

#Date to Characters
(cdate2 = as.character(date3))
class(cdate2)


#The “Date” class means dates are stored as the number of days since January 1, 1970, with negative values for earlier dates. We can use the as.numeric function to view the raw values.

date1
as.numeric(date1)
date2
as.numeric(date2)
