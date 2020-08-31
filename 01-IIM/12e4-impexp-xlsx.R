# read / write from xlsx files and google sheets

library(openxlsx)

write.xlsx(mtcars, file='./data/mtcars.xlsx')

list.files(path='./data')

df <- read.xlsx(xlsxFile = './data/mtcars.xlsx')
head(df)


library(readxl)
df2= read_excel(path = './data/mtcars.xlsx', sheet=1 )
df2

#write to Excel
#java issues


#google sheets
#publically shared
url1 = 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'

library(gsheet)
data1 = gsheet2tbl(url1)
head(data1)

url2 = "https://docs.google.com/spreadsheets/d/1Md_ro2t3M7nA9JMH1DsE12jfeX7qq-UPw6p8WQd6A2Y/edit#gid=216113907"

data2 = gsheet2tbl(url2)
data2

#private 
library(googlesheets4)
url1 = 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
gsDF = googlesheets4::read_sheet(url1, sheet=1)
#accept the popup
head(gsDF)
