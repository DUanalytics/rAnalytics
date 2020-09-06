# Read Data into R Environment
#CSV Files---- local or network
#Read from CSV file in PC
head(mtcars)
rownames(mtcars)
write.csv(mtcars, "./data/mtcarsF.csv", row.names=F) #without rownames
write.csv(mtcars, "./data/mtcarsT.csv", row.names=T) #with rownames

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

#other ways - google sheets, excel
#end here