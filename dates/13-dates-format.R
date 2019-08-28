# Format the date for printing/ display
format(Sys.Date(), format="%A: %d %B")

#Format Types ----
#%Y: 4-digit year (1982),%y: 2-digit year (82)
#%m: 2-digit month (01)
#%B: month (January), %b: abbreviated month (Jan)
#, %d: 2-digit day of the month (13)
#%A: weekday (Wednesday), %a: abbreviated weekday (Wed)

#Display Day of the week for todays date
format(Sys.Date(), "%A")


#Common formats to see other date formats
format(Sys.Date(), format="%A %a %d  %m %b %B %y %Y") # another format

cdate4 = c('09-07-1993', '08-08-1994', '04-11-1994')
class(cdate4)  #character
(date4 = as.Date(cdate4, '%d-%m-%Y'))
format(date4, '%A')

#character to date and then display Day of the week
format(as.Date('18-04-1994', '%d-%m-%Y'), '%A')


format(date4, format=('%d-%m-%Y')) # print in different format
format(date4, format=('%d / %B - %Y')) # print in different format
format(date4, format=('%d / %b - %Y')) # print in different format


