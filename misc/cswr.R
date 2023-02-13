library(csvwr)

d = data.frame(x=c('a','b','c'), y=1:3)
d
s = derive_table_schema(d)
s

m = create_metadata(tables=list(list(url='table.csv', tableSchema=s)))
m

j = jsonlite::toJSON(m)
j
cat(j, file='metadata.json')

