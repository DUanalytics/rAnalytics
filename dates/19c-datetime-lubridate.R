#Lubridate 2 - date time functions
#more functions

arrive = ymd_hms("2018-04-27 18:40:15", tz = "Asia/Calcutta")
leave = ymd_hms("2018-04-29 22:00:00", tz = "Asia/Calcutta")
arrive ; leave

#days between
leave - arrive  # Time Difference in days

#Setting and Extracting information
arrive
second(arrive)
second(arrive) = 25  #change
arrive ; second(arrive)
arrive



day(arrive) #27
month(arrive) #4
year(arrive) #2018
wday(arrive)  #6
wday(arrive, label = TRUE)  #with levels and Fri
week(arrive)  #17

hour(arrive) #18
minute(arrive) #40
second(arrive) #25
tz(arrive)  #asia/calcutta

