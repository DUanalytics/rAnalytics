# Read Data into R Environment - to/fro XLS

#Excel----
#Create a excel file with data in 2 sheets
# first row contains variable names
#C:\Program Files\Java\jre1.8.0_261
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_261')
library(xlsx)
library(rJava)
write.xlsx2(mtcars, file='./data/mtcars.xlsx', sheetName = 'mtcars1', row.names=F, append=F)
df_excel1 = read.xlsx( "./data/mtcars.xlsx", 1)
df_excel1

head(iris)
write.xlsx2(iris, file='./data/mtcars.xlsx', sheetName = 'iris1', row.names=F, append=T)
df_excel2 = read.xlsx( "./data/mtcars.xlsx", 2)
df_excel2

write.xlsx2(iris, file='./data/mtcars.xlsx', sheetName = 'iris2', row.names=F, append=T)
df_excel2b = read.xlsx( "./data/mtcars.xlsx", 'iris2')
df_excel2b
#see the excel sheet in data folder: windows explorer

library(readxl)  #for reading only, faster
readxl::excel_sheets("./data/mtcars.xlsx")  #names of sheets in workbook
df_rxl1 <- readxl::read_excel( "./data/mtcars.xlsx", 'iris1')
df_rxl2 <- readxl::read_excel( "./data/mtcars.xlsx", 2)

head(df_rxl1)
head(df_rxl2)
readxl::read_excel( "./data/mtcars.xlsx", 2, skip=1)


?`readxl-package`
?read_excel
#end here