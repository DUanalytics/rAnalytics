## Data Import and Export------
#inbuilt Data sets
data() #names of datasets 
mtcars
iris
str(mtcars)  #structure
summary(mtcars)#summary
names(mtcars) #names of variables/ columns
#many other ways - nrow, dim, attributes

#export as csv
write.csv(mtcars, 'mycars.csv', row.names = F)
?write.csv  #help on command
#a file with extension will be created which you can see under files tab (right bottom window of R Studio)
dir()
dir(pattern = '*.csv')

# Importing through CSV-----
newcars <- read.csv(file='mycars.csv')
newcars  #see the data 

#Importing through Excel ------
install.packages('readxl')  #install this package
#copy a simple excel file into the folder of project eg. myexcelcars.xlsx
newexcelcars <- readxl::read_excel(path='myexcelcars.xlsx',sheet=1)
newexcelcars

#Importing through CSV URL ------
url = 'https://raw.githubusercontent.com/DUanalytics/rAnalytics/master/data/denco.csv'
dataURL <- read.csv(url)
dataURL

#Importing through Text File-----


#Importing through Google Sheets----



#Data Export------



#