#Analysis of German Credit Data

#Decision Tree
#https://online.stat.psu.edu/stat508/book/export/html/796
#https://cran.r-project.org/doc/contrib/Sharma-CreditScoring.pdf
#https://cran.r-project.org/other-docs.html

#Data
library(gsheet)
library(dplyr)
link='https://docs.google.com/spreadsheets/d/1n2hGjaqTMBLBBvVif04ViLX14_Mf_ww27TqUMlNxdOM/edit#gid=1792335381'
#
df = as.data.frame(gsheet2tbl(link))
head(df)
dim(df)
data = df
table(data$default)

#some loans do default - Can we predict which people characteristics default
names(data)
data[,c('default','age','property')]
lapply(data[,c('default','age','amount')], FUN=class)


german_credit <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data")
german_credit
head(german_credit)
colnames(german_credit) <- c("chk_acct", "duration", "credit_his", "purpose",  "amount", "saving_acct", "present_emp", "installment_rate", "sex", "other_debtor", "present_resid", "property", "age", "other_install", "housing", "n_credits", "job", "n_people", "telephone", "foreign", "response")
head(german_credit)
names(german_credit)
head(german_credit[,c('response','property','age','amount')])
dim(german_credit)
table(german_credit$response)  #1-good load-700
range(data$credit_amount)

