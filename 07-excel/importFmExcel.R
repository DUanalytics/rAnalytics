#Import from Excel
#import only
library(readxl)

data1 = read_excel(file.choose(),1)
data1

data2 = read_excel('07-excel/excelData.xlsx',1)
head(data2)

data3 = read_excel('07-excel/excelData.xlsx','denco')
head(data3)

data4 = read_excel('07-excel/excelData.xlsx',2)
head(data4)
