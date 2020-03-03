#Frequency

df = mtcars
names(df)
catcols = c('cyl','vs','am','gear','carb')

df[,catcols] = lapply(df[,catcols], factor)
str(df)

#count gears
table(df$gear)
#count gears and cyl
table(df$gear, df$cyl)
(t1 <- table(df$gear, df$cyl, dnn=c('Gear','Cylinder')))
t1

#margin wise summary from table
margin.table(t1)
margin.table(t1,1)
margin.table(t1,2)
margin.table(t1,c(1,2))
?margin.table

#addmargins
addmargins(t1)
addmargins(t1,margin=1, FUN=mean)
addmargins(t1,margin=2, FUN=sum)

#prop table
prop.table(t1)
prop.table(t1) * 100           
(pt1 <- round(prop.table(t1)* 100))

addmargins(pt1)


#xtabs
xtabs( ~ cyl + gear, data=df)

#Crosstable(gmodules)
gmodels::CrossTable(df$cyl, df$gear)

#ftable
ftable(df$cyl, df$gear)

library(survey)

#gmodels::Crosstab( t1, row.vars='Cylinder', col.vars='Gear')

head(titanic)
library(catspec)
catspec::ctab(Titanic)
catspec::ctab(t1)
catspec::ctab(occupationalStatus)

library(survival)
data("logan")
str(logan)
catspec::ctab(table(logan$education, logan$race))
