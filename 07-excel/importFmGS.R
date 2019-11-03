#Google Sheet to R

#Create a google Sheet
#add or upload data into the sheet
#click on Share - make link sharing on (ie Public sharing)
#copy the url link of the active sheet which you want to import data from
#eg

library(gsheet)

url1 = 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'

library(gsheet)
data1 = gsheet2tbl(url1)

url2 = "https://docs.google.com/spreadsheets/d/1Md_ro2t3M7nA9JMH1DsE12jfeX7qq-UPw6p8WQd6A2Y/edit#gid=216113907"

data2 = gsheet2tbl(url2)
data2


#export to GS not possible unless you set your API credentials
