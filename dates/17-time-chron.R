#Dealing with Time 

time = c("00:00:01", "01:02:00", "09:30:01", "14:15:25")

library(chron)
x = chron(times=time)
x

#difference
diff(x)
x[2] - x[1]


#chron objects store the values internally as a fraction of seconds per day. Thus 1 second is equivalent to 1/(60*60*24), or 1/86400, i.e. 1.157407e-05.

#to add 1 second to all times
x + 1/86400
