#dplyr functions

library(dplyr)

mtcars
names(mtcars)
hist(mtcars$mpg)
mtcars %>% arrange(mpg)
mtcars %>% arrange(desc(mpg))
mtcars %>% arrange(gear, desc(mpg)) %>% select(gear, mpg)
mtcars %>% group_by(gear, cyl)  %>% dplyr::summarise(meanMPG = mean(mpg, na.rm=T))

top_n(x=mtcars, n=1, wt=mpg)
top_n(x=mtcars, n=-1, wt=mpg)
top_n(x=mtcars, n=2, wt=mpg)

table(mtcars$gear)
barplot(table(mtcars$gear))
mtcars %>% group_by(gear) %>% top_n(n=-1, wt=mpg)  %>% select(gear, mpg) %>% arrange(gear)
mtcars %>% group_by(gear,am) %>% top_n(n=-1, wt=mpg)  %>% select(gear, mpg) %>% arrange(gear)

