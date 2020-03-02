#Reproducible Code


mtcars 

head(mtcars)

recode_mtcars <- dput(head(mtcars))

newdf <- recode_mtcars

newdf

#if Df has factors 

recode_iris <- dput(droplevels(iris[1:4, ]))

recode_iris


#One other caveat for dput is that it will not work for keyed data.table objects or for grouped tbl_df (class grouped_df) from dplyr. In these cases you can convert back to a regular data frame before sharing, dput(as.data.frame(my_data))


#links
#https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example

#trick
library(devtools)
source_url("https://raw.github.com/rsaporta/pubR/gitbranch/reproduce.R")

rec_mtcars2 <- reproduce(mtcars, cols=1:4)
?reproduce
#copy and paste the script

df2 <- structure(list(mpg = c(21, 21, 22.8, 21.4, 18.7, 18.1, 14.3,19.7, 15, 21.4), cyl = c(6, 6, 4, 6, 8, 6, 8, 6, 8, 4), disp = c(160,160, 108, 258, 360, 225, 360, 145, 301, 121), hp = c(110, 110,93, 110, 175, 105, 245, 175, 335, 109)), class = "data.frame", row.names = c("Mazda RX4","Mazda RX4 Wag", "Datsun 710", "Hornet 4 Drive", "Hornet Sportabout","Valiant", "Duster 360", "Ferrari Dino", "Maserati Bora", "Volvo 142E")) 
df2



#o quickly create a dput of your data you can just copy (a piece of) the data to your clipboard and run the following in R:

#for data in Excel:
#go to excel and copy data
df5 <- dput(read.table("clipboard",sep="\t",header=TRUE))
df5

#for data in a txt file:
#go to text file seperated by space
df6 <- dput(read.table("clipboard",sep="",header=TRUE))
df6


#--------
library(reprex)
(y <- 1:4)
mean(y)
reprex()
#------------
#now copy crom viewer and send it 
#https://www.tidyverse.org/help/
#https://stackoverflow.com/help/minimal-reproducible-example
