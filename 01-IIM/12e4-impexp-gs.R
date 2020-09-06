#import Data from Google Sheets

#google sheets #publically shared
url1 = 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'

library(gsheet)  #public gsheets
data1 = gsheet2tbl(url1)
head(data1)

url2 = "https://docs.google.com/spreadsheets/d/1Md_ro2t3M7nA9JMH1DsE12jfeX7qq-UPw6p8WQd6A2Y/edit#gid=216113907"

data2 = gsheet2tbl(url2)
data2

#private  gsheets
library(googlesheets4)
url1 = 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
gsDF = googlesheets4::read_sheet(url1, sheet=1) #give permissions
#accept the popup
head(gsDF)

