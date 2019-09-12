#Data Summarisation using Dplyr 
#dataset - mtcars

#dplyr - mtcars
#install.packages('dplyr')
library(dplyr) #install this library


head(mtcars)
names(mtcars)

#Plan how would you like to summarise this dataset

#dplyr - mtcars
library(dplyr)
df = mtcars
df$carnames = rownames(mtcars)
df = cbind(cars=rownames(mtcars), mtcars)
df %>% mutate(add_c)
head(df)
head(df)
#Filter----
filter(df, cyl == 8) %>% select(carnames, mpg,cyl)

filter(mtcars, cyl == 8)
filter(mtcars, cyl < 6)

# Multiple criteria
filter(mtcars, cyl < 6 & vs == 1)
filter(mtcars, cyl < 6 | vs == 1)

# Multiple arguments are equivalent to and
filter(mtcars, cyl < 6, vs == 1)

#Select rows 
#by rownumber
filter(mtcars, row_number() == 1L)
filter(mtcars, row_number() == n())
filter(mtcars, between(row_number(), 5, n()))

#slice-----
slice(mtcars, 1L)
slice(mtcars, n())
slice(mtcars, 5:n())
slice(mtcars, c(2,4,5,10))


#mutate----
#create new columns based on existing columns
mutate(mtcars, displ_l = disp / 61.0237) #keeps other col

#GroupBy summary

mtcars %>% group_by(am) %>% summarise(mean(mpg), max(wt))
mtcars %>% group_by(am) %>% summarise(MEANMPG = mean(mpg), MAXWT= max(wt))
mtcars %>% group_by(am, gear) %>% summarise_all(mean)
mtcars %>% group_by(am, gear)%>% summarise_all(c("min", "max"))

#specific columns
mtcars %>% summarise_at(c("mpg", "wt"), mean, na.rm = TRUE)

#select rows on the basis of sample

sample_frac(mtcars, 0.2, replace=T)
sample_n(mtcars, 60, replace=T) %>% select(mpg)

#Rows having least mpg (last 2)
top_n(mtcars,-2, mpg)

select(mtcars, mpg) %>% arrange(desc(mpg))

