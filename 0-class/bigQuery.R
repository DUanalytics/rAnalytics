# big query
#https://bigrquery.r-dbi.org/dev/
#install.packages("bigrquery")

library(bigrquery)

library(DBI)

billing <- bq_test_project() # replace this with your project ID 
sql <- "SELECT year, month, day, weight_pounds FROM `publicdata.samples.natality`"

tb <- bq_project_query(billing, sql)
bq_table_download(tb, n_max = 10)
con <- dbConnect(
  bigrquery::bigquery(),
  project = "publicdata",
  dataset = "samples",
  billing = billing
)

con
dbListTables(con)

dbGetQuery(con, sql, n = 10)
