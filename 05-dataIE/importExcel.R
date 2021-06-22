#download data from web in excel

pacman::p_load('xlsx', 'readxl', 'dplyr','rio')
version
url = 'https://www.scimagojr.com/countryrank.php?out=xls'
url2 = 'https://www.scimagojr.com/journalrank.php?out=csv'

temp = tempfile(fileext = ".xlsx")
dataURL <- url
download.file(dataURL, destfile=temp, mode='wb')

test <- readxl::read_excel(temp, sheet =1)
head(test)

temp = tempfile(fileext = ".")
dataURL <- url2
download.file(dataURL, destfile=temp, mode='wb')

#test <- readxl::read_excel(temp, sheet =1)
test <- read.csv(temp)

head(test)


file1 <- read.csv(file.choose(), sep=';')
head(file1)
names(file1)
