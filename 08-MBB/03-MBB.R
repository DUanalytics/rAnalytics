## Data Import and Export------
#inbuilt Data sets
data() #names of datasets 
mtcars
iris
str(mtcars)  #structure
summary(mtcars)#summary
names(mtcars) #names of variables/ columns
#many other ways - nrow, dim, attributes

#export as csv
write.csv(mtcars, 'mycars.csv', row.names = F)
?write.csv  #help on command
#a file with extension will be created which you can see under files tab (right bottom window of R Studio)
dir()
dir(pattern = '*.csv')

# Importing through CSV-----
newcars <- read.csv(file='mycars.csv')
newcars  #see the data 

#Importing through Excel ------
install.packages('readxl')  #install this package
#copy a simple excel file into the folder of project eg. myexcelcars.xlsx
newexcelcars <- readxl::read_excel(path='myexcelcars.xlsx',sheet=1)
newexcelcars

#Importing through CSV URL ------
url = 'https://raw.githubusercontent.com/DUanalytics/rAnalytics/master/data/denco.csv'
dataURL <- read.csv(url)
dataURL

#Importing through Text File-----
url2 = 'https://raw.githubusercontent.com/DUanalytics/rAnalytics/master/data/mytextcars.txt'
dataText = read.table(file=url2, sep='', header = T)
dataText
head(dataText)

#Importing through Google Sheets----
#docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=2051155174

library(googlesheets4)  #install this library if not available
urlGS = 'https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU'
dataGS <- googlesheets4::read_sheet(ss=urlGS, sheet = 'student1')
dataGS

#Data Export------
#data preferably should be exported as csv files
?write.csv

#to excel : read this (needs some java setup)
#http://www.sthda.com/english/wiki/writing-data-from-r-to-excel-files-xls-xlsx
#https://stackoverflow.com/questions/19414605/export-data-from-r-to-excel


#read from online sources and stackoverflow
#https://stackoverflow.com/
#http://www.sthda.com/
#https://www.listendata.com/p/r-programming-tutorials.html
#https://www.guru99.com/r-tutorial.html
#https://www.statmethods.net/r-tutorial/index.html
#https://www.manning.com/books/r-in-action
#https://github.com/kabacoff/RiA2
#https://github.com/DUanalytics/eBooks  (my collection)


#