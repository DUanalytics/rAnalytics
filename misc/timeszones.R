#Ranjan data import issue - T/F

library(readxl)
list.files('E:/data/students')
data = readxl::read_excel('E:/data/students/Sirifort.xlsx')
head(data)
head(data$`From Date`)
Sys.timezone()
str(OlsonNames())
OlsonNames()
Sys.setenv(TZ = "UTC")
Sys.setenv(TZ="Asia/Calcutta")
options(tz='UTC')
options(tz="Asia/Calcutta")

getOption('tz')
data$`From Date` = as.POSIXct(data$`From Date`, '%d-%m-%Y %H:%M', tz=getOption("tz"))
data$`To Date` = as.POSIXct(data$`To Date`)

str(data)
dim(data)
colSums(is.na(data))
?read_excel
(colClasses1 = c(rep('character',2), rep('numeric',39)))
data = readxl::read_excel('E:/data/students/Sirifort.xlsx', col_types=colClasses1)
