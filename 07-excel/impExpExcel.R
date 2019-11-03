#Import and Export : Excel
#Java should be configured properly


head(mtcars)

library(rJava)
library(xlsx)
#first export - append =F ; make new
write.xlsx2(mtcars, file='07-excel/mtcars.xlsx', sheetName = 'mtcars1', row.names=F, append=F)
df_excel1 = read.xlsx( "07-excel/mtcars.xlsx", 1)
df_excel1

#now make append =T
write.xlsx2(iris, file='07-excel/mtcars.xlsx', sheetName = 'iris1', row.names=F, append=T)
df_excel2 = read.xlsx( "07-excel/mtcars.xlsx", 2)
df_excel2

write.xlsx2(iris, file='07-excel/mtcars.xlsx', sheetName = 'iris2', row.names=F, append=T)
df_excel2b = read.xlsx( "07-excel/mtcars.xlsx", 'iris2')
df_excel2b

#see the excel sheet in data folder: windows explorer