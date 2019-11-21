# Read Data into R Environment

#CSV Files----
#Read from CSV file in PC
head(mtcars)
rownames(mtcars)
write.csv(mtcars, "./data/mtcarsF.csv", row.names=F) #without rownames
write.csv(mtcars, "./data/mtcarsT.csv", row.names=T) #without rownames

head(iris)
write.csv(iris, "./data/irisF.csv", row.names=F) #without rownames
write.csv(iris, "./data/irisT.csv", row.names=T)  #with rownames

#go to folder data and open these csv files
readiris = read.csv(file="./data/irisF.csv", header = TRUE,sep = ",")
readiris
readmtcars = read.csv(file="./data/mtcarsF.csv", header = TRUE,sep = ",")
head(readmtcars)
str(readmtcars)
class(readmtcars)
head(readmtcars)

read2 = read.table(file="./data/iris.csv", header = TRUE,sep = ",")
str(read2); class(read2)
head(read2)
read3 = read.delim(file="./data/iris.csv", header = TRUE,sep = ",")
str(read3) ; class(read3)
head(read3)
#difference is use of specify delimeter(read.csv takes default as comma)
#or location is different from Project Folders, or want to search for the file
read4 = read.csv(file=file.choose())
str(read4)
head(read4)


# From URL : Read CSV from Web----
read_web1 = read.csv('http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat')
head(read_web1)
library(data.table)
read_web2 = fread("http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv")
head(read_web2)
class(read_web2)

#Text file from Web-----
read_txt = read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.txt", header = FALSE)
head(read_txt)

#Google Sheets-----
library(gsheet) #install it#
#install.packages('gsheet')
library(gsheet)
url_gsheet = "https://docs.google.com/spreadsheets/d/1QogGSuEab5SZyZIw1Q8h-0yrBNs1Z_eEBJG7oRESW5k/edit#gid=107865534"
df_gsheet = as.data.frame(gsheet2tbl(url_gsheet))
head(df_gsheet)

url2 = "https://docs.google.com/spreadsheets/d/16KwkNnX6QAO23c03sCnzCElp3nRWfCp0g9tKCcKETsk/edit#gid=0"
newdata = as.data.frame(gsheet2tbl(url2))
head(newdata)

#Excel----
#Create a excel file with data in 2 sheets
# first row contains variable names
#C:\Program Files\Java\jre1.8.0_221
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_221')
library(rJava)
library(xlsx)
write.xlsx2(mtcars, file='./data/iimS.xlsx', sheetName = 'mtcars1', row.names=F, append=T)

write.xlsx2(mtcars, file='./data/mtcars.xlsx', sheetName = 'mtcars1', row.names=F, append=T)
df_excel1 = read.xlsx( "./data/iimS.xlsx", 1)
df_excel1

write.xlsx2(iris, file='./data/mtcars.xlsx', sheetName = 'iris1', row.names=F, append=T)
df_excel2 = read.xlsx( "./data/mtcars.xlsx", 2)
df_excel2

write.xlsx2(iris, file='./data/mtcars.xlsx', sheetName = 'iris2', row.names=F, append=T)
df_excel2b = read.xlsx( "./data/mtcars.xlsx", 'iris2')
df_excel2b
#see the excel sheet in data folder: windows explorer

#end here