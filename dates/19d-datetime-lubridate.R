#lubridate 3

#interval
#-----------------
#Time Intervals
#save an interval of time as an Interval class object
(student1 = interval(arrive, leave))
(student2 <- arrive %--% leave)
(student3 = interval(ymd(20180320, tz = "Asia/Calcutta"),
                     ymd(20180327, tz = "Asia/Calcutta")))

(courseperiod = interval(ymd(20180421, tz = "Asia/Calcutta"),
                         ymd(20180425, tz = "Asia/Calcutta")))

int_overlaps(student1, courseperiod)
#TRUE
int_overlaps(student3, courseperiod)

setdiff(student2, courseperiod)
setdiff(student3, courseperiod)

?setdiff
#2017-07-05 IST--2017-07-15 IST

#Other Functions
#int_start, int_end, int_flip, int_shift, int_aligns, union, intersect, and %within%.
int_start(courseperiod)
int_end(courseperiod)
int_flip(courseperiod)
int_aligns(student1, courseperiod)  #share end point

dates = now() + days(1:10)
dates
int_diff(dates)

# Years Betw ----------
ref_date <- as.Date('20/04/08',format='%d/%m/%y')
today <- as.Date(Sys.Date(), format='%d/%m/%y')
year(arrive) = 2015
arrive
arrive2 = as.Date(arrive, format='%d/%m/%y')
(yrsbetw = year(today)-year(ref_date))
(yrsbetw = year(today)-year(arrive2))
