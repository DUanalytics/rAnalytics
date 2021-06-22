#MBB - 05

# Subsetting Data in R
# Square Bracket Notation; Subset Function ; Which Function with bracket Notations

mtcars
#filter on rows but conditions works on columns
mtcars[ mtcars$mpg > 25,]
mtcars[ mtcars$mpg > 25 & mtcars$cyl == 4,]
mtcars[ mtcars$mpg > 25 | mtcars$cyl == 4,]
#selected columns
mtcars[, 1:3]
mtcars[, c(1,4,7)]
mtcars[, c('mpg','cyl')]
mtcars[ mtcars$mpg > 23 & mtcars$mpg < 27, 1:3]


# Data Management in R-------
# Renaming Variables; Adding/Removing : Rows/Columns; Reshaping the data; Sorting and Transpose; Merging the data; Splitting the data
names(mtcars)
mycars <- mtcars # copy
mycars
names(mycars)[1]
head(mycars)
names(mycars)[1:2] <- c('mympg','mycyl') 

#reshape ------
rollno = 1:5
(subject1 = round(rnorm(n=5, mean=60, sd=3)))
(subject2 = round(rnorm(n=5, mean=70, sd=3)))
sMarks <- data.frame(rollno, subject1, subject2)
sMarks
#change orientation
sMarksLong = reshape2::melt(data=sMarks, id.vars=c('rollno'))
head(sMarksLong)
sMarksWide = reshape2::dcast(data=sMarksLong, rollno ~ variable, value.var='value') 
head(sMarksWide)

# Basic Statistics-----
mean(sMarks$subject1)
sd(sMarks$subject1)


# Descriptive Statistics
# Understanding Different Statistical Functions in R
library(psych)
psych::describe(sMarks)

# Data Manipulation in R-----
# Apply Family in Rp
# Using Apply functions to manage data in R
apply(mtcars, MARGIN=1, FUN='mean')  #rowwise 1
apply(mtcars, MARGIN=2, FUN='mean')  #columns 2

# Aggregate and Table Command
# Aggregate Command ; Table Command
# Data Manipulation in R
# dplyr functions

# Graphical Representation of Data------
# Summarising the data graphically
# Scatter Plot; Box Plot; Histogram; Bar Graph; Pie Chart

plot(mtcars$wt, mtcars$mpg)
boxplot(mtcars$wt)
barplot(table(mtcars$cyl))
pie(table(mtcars$cyl))

# Extra Topics
# Advanced Graphs------
# Data Visualization using GGPlot Library
library(ggplot2)

head(mtcars)
plot(mtcars$wt, mtcars$mpg)
ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point()
ggplot(data=mtcars, aes(x=wt, y=mpg, color=factor(gear))) + geom_point()
ggplot(data=mtcars, aes(x=wt, y=mpg, color=factor(gear), size=hp, shape=factor(am))) + geom_point()
ggplot(data=mtcars, aes(x=factor(gear), y=mpg, fill=factor(gear))) + geom_boxplot()

#http://www.sthda.com/english/wiki/be-awesome-in-ggplot2-a-practical-guide-to-be-highly-effective-r-software-and-data-visualization
  

# Text Mining------
# Text Mining Overview, Applications of TM, Steps for TM in R, creating Word Cloud using diff packages
