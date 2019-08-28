# Time 

time = c("00:00:01","01:02:00","09:30:01","14:15:25")
(converted.time = as.difftime(time, units = "mins")) #"difftime" class
(secss <- as.numeric(converted.time, units = "secs"))
(hourss <- as.numeric(converted.time, units = "hours"))
(dayss <- as.numeric(converted.time, units="days"))

(w = strptime(x = time, format = "%H:%M:%S")) #"POSIXlt" "POSIXt" class
# this is the format which can store date and time
#but cannot do any arithmetic
