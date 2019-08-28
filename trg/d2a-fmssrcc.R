# Read Data into R Environment

#CSV Files----
#Read from CSV file in PC
head(iris)
write.csv(iris, "./data/iris.csv", row.names=F)
read1 = read.csv(file="./data/iris.csv", header = TRUE,sep = ",")
read1
read1 = read.csv(file="./data/dhiraj.csv", header = TRUE,sep = ",")
head(read1)
str(read1)
class(read1)
head(read1)
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

#graphs

mtcars
names(mtcars)
table(mtcars$cyl)
table(mtcars$cyl, mtcars$am)
mtcars$mpg
#continuous data - histogram, boxplot
hist(mtcars$mpg)
boxplot(mtcars$mpg, horizontal = T)
boxplot( mpg ~ gear, data=mtcars, col=1:3)
t1 = table(mtcars$gear)
t1
barplot(t1, col=1:3)
students
t2 = table(students$college)
barplot(t2)
t3 = table(students$gender)
barplot(t3)
title('This is bar plot', sub = 'Subtitle')
pie(t3)
