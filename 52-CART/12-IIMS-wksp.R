#IIM Sirmaur  - Nov 2019

#Case Study - Manufacturing Coy

library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907"
sales3 = as.data.frame(gsheet2tbl(url))
str(sales3)
head(sales3)
dim(sales3)
library(dplyr)
names(sales3)
#loyal : customer + count ----
length(unique(sales3$custname))
sales3 %>% group_by(custname) %>% summarise(n=n())  %>% arrange(desc(n)) %>% head(5)
t1=table(sales3$custname)
tail(sort(t1),5)
#customer + revenue-----
sales3 %>% group_by(custname) %>% summarise(totalRev=sum(revenue))  %>% arrange(desc(totalRev)) %>% head(5)

#partno + revenue -----
names(sales3)
sales3 %>% group_by(partnum) %>% summarise(totalRev=sum(revenue))  %>% arrange(desc(totalRev)) %>% head(5)

#partno + margin ------
sales3 %>% group_by(partnum) %>% summarise(totalMar=sum(margin))  %>% arrange(desc(totalMar)) %>% head(5)
sales3 %>% group_by(partnum) %>% summarise(totalMar=sum(margin))  %>% arrange(totalMar) %>% head(5)


#top n=2 from each region : total revenue
sales3 %>% group_by(region, custname) %>% summarise(totRev = sum(revenue, na.rm=T))
sales3 %>% group_by(region, custname) %>% summarise(totRev = sum(revenue, na.rm=T)) %>% filter(region =='9x-Export') %>% arrange(desc(totRev)) %>% head(2)

sales3 %>% group_by(region, custname) %>% summarise(totRev = sum(revenue, na.rm=T)) %>% top_n(n=2, wt=totRev)
sales3 %>% group_by(region, custname) %>% summarise(totRev = sum(revenue, na.rm=T)) %>% top_n(n=-3, wt=totRev)

df = mtcars
head(mtcars)
rownames(mtcars)
df$carnames = rownames(df)
head(df)
df %>% arrange(mpg)  %>% select(carnames, mpg, wt)
df %>% top_n(n=2, wt=mpg)  

#details about high margin parts
sales3 %>% group_by(partnum) %>% summarise(totalMar=sum(margin))  %>% arrange(desc(totalMar)) %>% head(7)
hspno <- sales3 %>% group_by(partnum) %>% summarise(totalMar=sum(margin))  %>% arrange(desc(totalMar)) %>% head(7) %>% pull(partnum)
hspno
sales3 %>% filter(partnum %in% hspno) 
sales3 %>% filter(partnum %in% hspno) %>% group_by(partnum, region) %>% summarise(n=n())

table(sales3$region)
#parts sold in East and china region : | or %in%
sales3 %>% filter(region == '01-East' | region == '09-China') %>% nrow()
sales3 %>% filter(region %in% c("01-East" ,'09-China')) %>% nrow()


#plots
#box plot
boxplot(mtcars$mpg)
boxplot(mpg ~ gear, data=mtcars)
boxplot(sales3$margin)
boxplot(margin ~ region, data = sales3)
range(sales3$margin)
hist(sales3$margin)
#bar plot
bpdata <- sales3 %>% group_by(region) %>% summarise(TotRev= sum(revenue))
barplot(bpdata$TotRev)


?barplot
#hist

#pie
pie(bpdata$TotRev)

library(ggplot2)
ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point()
ggplot(data=mtcars, aes(x=wt, y=mpg, color=factor(gear), shape=factor(cyl), size=hp)) + geom_point()
ggplot(data = mtcars, aes(x=factor(gear), fill=factor(cyl))) + geom_bar(stat='count')  + facet_grid(am ~ carb) + geom_text(stat='count', aes(label=..count..), vjust=-1)

#reshape data
library(reshape2)
dflong <- df %>% group_by(gear, cyl) %>% summarise(meanMPG = mean(mpg))
dflong
dcast(data=dflong, formula = gear ~ cyl, value.var = 'meanMPG')


sales3
head(sales3)
names(sales3)
dflong2 <- sales3 %>% group_by(custname,region) %>% summarise(sum2=sum(revenue))
head(dflong2)

dlong22=dcast(data=dflong2, formula= custname ~ region, value.var = 'sum2')

head(dlong22)
dlong23 <- melt(data=dlong22, id.vars = 'custname')
head(dlong23)

rollno =1:10
(subject = sample(paste('S',1:5), size=10, replace=T))
students = data.frame(rollno, subject)
head(students)
students$marks = trunc(rnorm(10,mean=60, sd=10))
students
sub1 = trunc(rnorm(10,mean=60, sd=10))
sub2 = trunc(rnorm(10,mean=60, sd=10))
sub3 = trunc(rnorm(10,mean=60, sd=10))
sub4 = trunc(rnorm(10,mean=60, sd=10))
sub5 = trunc(rnorm(10,mean=60, sd=10))

students2 = data.frame(rollno, sub1, sub2, sub3, sub4, sub5)
students2
melt(data=students2, id.vars = 'rollno')






#Missing Values

#identified by NA

x = c(3,4,NA, 4,2,NA)
x

is.na(x)
sum(is.na(x))
mean(x)
mean(x, na.rm=T)
x[is.na(x)]
x[is.na(x)] = mean(x, na.rm=T)
x

library(VIM)
sleep
head(sleep)
dim(sleep)
str(sleep)
summary(sleep)
is.na(sleep)
sum(is.na(sleep))
colSums(is.na(sleep))    
rowSums(is.na(sleep))
complete.cases(sleep)
head(sleep)
sleep[complete.cases(sleep),]
sleep[!complete.cases(sleep),]
df = sleep
colSums(is.na(df))
df$Dream
df$Dream[ is.na(df$Dream)] = mean(df$Dream, na.rm=T)
df$Dream



x=1:100
x
quantile(x)
x = rnorm(100, mean=60, sd=10)
x
sort(x)
quantile(x)v


#------
#reading from excel
library(readxl)
?readxl
readxl_example()
readxl_example("clippy.xls")
xlsx_example <- readxl_example("datasets.xlsx")
read_excel(xlsx_example)
excel_sheets(xlsx_example)
read_excel(xlsx_example, sheet = "chickwts")
read_excel(xls_example, sheet = 4)
read_excel(xlsx_example, n_max = 3)  #rows
read_excel(xlsx_example, range = "C1:E4")
read_excel(xlsx_example, range = cell_rows(1:4))
read_excel(xlsx_example, range = cell_cols("B:D"))
read_excel(xlsx_example, range = "mtcars!B1:D5")
#https://readxl.tidyverse.org/
read_excel(file.choose(), sheet=1)
read_excel(file.choose(), sheet='IIMK')
read_excel(file.choose(), sheet='IIMKPV')
read_excel('C:\\Users\\du\\Documents\\CBAP.xlsx',sheet=2)

iris_xl <- readxl_example("datasets.xlsx") %>% 
  read_excel(sheet = "iris") %>% 
  write_csv("iris-raw.csv")
#https://readxl.tidyverse.org/articles/articles/readxl-workflows.html

#check libraries to be loaded
path <- readxl_example("datasets.xlsx")
path %>%   excel_sheets() %>%   set_names() %>% 
  purr::map(read_excel, path = path)
