#mysql
#install.packages('RMySQL')
library(RMySQL)

#Connecting to MySQL:  Once the RMySQL library is installed create a database connection object.

mydb = dbConnect(MySQL(), user='du', password='mysql123', dbname='dulms', host='localhost')

#Listing Tables and Fields: Now that a connection has been made we list the tables and fields in the database we connected to.

dbListTables(mydb)

#This will return a list of the tables in our connection. 

dbListFields(mydb, 'pd8')
rs = dbSendQuery(mydb, "select * from pd8")

dbGetQuery(mydb, paste("select rollno, name, marks1 from pd8","where marks1 > 60 order by fees", "limit 5"))

data = fetch(rs, n=-1)
data
data2= dbReadTable(mydb, "pd8")
data2
dbWriteTable(mydb, name='mtcars', value=mtcars)


library(RODBC)
## tell it to map names to l/case
channel <- odbcConnect("mysql", uid="du", case="tolower")
sqlTables(channel)
sqlFetch(channel, "mtcars")

#https://www.dezyre.com/data-science-in-r-programming-tutorial/r-tutorial-importing-data-from-relational-database
#https://cran.r-project.org/doc/manuals/r-devel/R-data.html
#https://rpubs.com/williamsurles/290693

