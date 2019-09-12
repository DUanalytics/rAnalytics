# import and export csv 

head(mtcars)
#store data frame into csv
write.csv(mtcars, 'mtcars.csv', row.names=F)
#read from csv
dhiraj = read.csv('mtcars.csv')
head(dhiraj)
#2nd method - any location using windows file explorer
dhiraj2 = read.csv(file.choose())
head(dhiraj2)
#3rd method from url
dhiraj3 = read.csv('https://raw.githubusercontent.com/dupadhyaya/online/master/mtcars.csv')
head(dhiraj3)
#store it in particular location
write.csv(mtcars,'./data/iima.csv')
iimaread = read.csv('./data/iima.csv')
str(iimaread)
write.csv(mtcars,'E:/iima.csv', row.names = F)
iimaread2 = read.csv('E:/iima.csv', header=T)
head(iimaread2)
str(iimaread2)

#install this library
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907"
sales3 = as.data.frame(gsheet2tbl(url))
head(sales3)

#confirm to me that you have been able to import your data from gsheet
url2 = "https://docs.google.com/spreadsheets/  ......    '
iima = as.data.frame(gsheet2tbl(url2))
head(iima)


#end of file

