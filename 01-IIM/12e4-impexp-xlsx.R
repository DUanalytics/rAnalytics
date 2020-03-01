# read / write from xlsx files

library(openxlsx)

write.xlsx(mtcars, file='./data/mtcars.xlsx')

list.files(path='./data')

df <- read.xlsx(xlsxFile = './data/mtcars.xlsx')
head(df)

