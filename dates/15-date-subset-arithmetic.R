# date Arithmetic and subsets

#start course on 25 Oct 2018 for 30 days
(course1 = as.Date("2018-10-25") + 0:29)

#Difference in dates
course1
length(course1)  #no of days
min(course1)  # first date
max(course1)  # last date
range(course1) # start to end
mean(course1)  # center of the course period
median(course1) # middle date

sd(course1) #no meaning

#subset / select dates
course1
#1st and 5th dates
course[c(1,5)] # 1st & 5th date 
#1st and 5th dates
course[1] ; course[5]

#duration from 8th date to first date
(duration1 = course[8] - course[1])
#total duration
(duration2 = max(course) - min(course))

#duration since independence
(independencedays = Sys.Date() - as.Date('15-08-1947', '%d-%m-%Y'))
independencedays/365  #years


