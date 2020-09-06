# Read Data into R Environment - to/fro XLS

#Excel----
#Create a excel file with data in 2 sheets
# first row contains variable names
#C:\Program Files\Java\jre1.8.0_261
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_261')
library(xlsx)
library(rJava)
write.xlsx2(mtcars, file='./data/mtcars.xlsx', sheetName = 'mtcars1', row.names=F, append=F)
df_excel1 = read.xlsx( "./data/iimS.xlsx", 1)
df_excel1

write.xlsx2(iris, file='./data/mtcars.xlsx', sheetName = 'iris1', row.names=F, append=T)
df_excel2 = read.xlsx( "./data/mtcars.xlsx", 2)
df_excel2

write.xlsx2(iris, file='./data/mtcars.xlsx', sheetName = 'iris2', row.names=F, append=T)
df_excel2b = read.xlsx( "./data/mtcars.xlsx", 'iris2')
df_excel2b
#see the excel sheet in data folder: windows explorer

library(readxl)  #for reading only, faster

df_rxl1 <- readxl::read_excel( "./data/mtcars.xlsx", 'iris2')
head(df_rxl1)
readxl::excel_sheets("./data/mtcars.xlsx")  #names of sheets
?`readxl-package`
#end here