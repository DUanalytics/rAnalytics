#Case Study - Manufacturing Coy

library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907"
sales3 = as.data.frame(gsheet2tbl(url))
str(sales3)
head(sales3)
dim(sales3)
library(dplyr)
names(sales3)
#loyal : customer + count ----
length(unique(sales3$custname))
sales3 %>% group_by(custname) %>% summarise(n=n())  %>% arrange(desc(n)) %>% head(5)

#customer + revenue-----
sales3 %>% group_by(custname) %>% summarise(totalRev=sum(revenue))  %>% arrange(desc(totalRev)) %>% head(5)

#partno + revenue -----
names(sales3)
sales3 %>% group_by(partnum) %>% summarise(totalRev=sum(revenue))  %>% arrange(desc(totalRev)) %>% head(5)

#partno + margin ------
sales3 %>% group_by(partnum) %>% summarise(totalMar=sum(margin))  %>% arrange(desc(totalMar)) %>% head(5)
sales3 %>% group_by(partnum) %>% summarise(totalMar=sum(margin))  %>% arrange(totalMar) %>% head(5)


