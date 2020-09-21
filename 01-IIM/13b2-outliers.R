#Outliers
#https://www.statsandr.com/blog/outliers-detection-in-r/
#outliers--------------------------
#An outlier is a value or an observation that is distant from other observations, that is to say, a data point that differs significantly from other data points

data <- ggplot2::mpg
head(data)
data$hwy
summary(data$hwy)
range(data$hwy)

(breaks1 = sqrt(nrow(data)))  #no of bins/ break point
hist(data$hwy,  xlab = "hwy",   main = "Histogram of hwy",  breaks = breaks1)

#ggplot2
library(ggplot2)

ggplot(data) +  aes(x = hwy) + geom_histogram(bins = 30L, fill = "#0c4c8a") + theme_minimal()
# there seems to be a couple of observations higher than all other observations (see the bar on the right side of the plot).


#boxplot-----
boxplot(data$hwy,  ylab = "hwy")
ggplot(data) +  aes(x = "", y = hwy) +   geom_boxplot(fill = "#0c4c8a") + theme_minimal()
#there are 2 potential outliers (see the 2 points above the vertical line, at the top of the boxplot).
#box plot visualizes a quantitative variable by displaying five common location summary (minimum, median, first and third quartiles and maximum) and any observation that was classified as a suspected outlier using the interquartile range (IQR) criterion. The IQR criterion means that all observations < Q1 - 1.5IQR and > Q3 + 1.5IQR are classified as potential outliers

#IQR is the difference between the third and first quartile) are considered as potential outliers by R. 
#extract the values of the potential outliers based on the IQR criterion
boxplot.stats(data$hwy)$out
#row no
out <- boxplot.stats(dat$hwy)$out
out_ind <- which(dat$hwy %in% c(out))
out_ind
dat[out_ind, ]  #complete data

#print the values
boxplot(dat$hwy,ylab = "hwy", main = "Boxplot of highway miles per gallon"
)
mtext(paste("Outliers: ", paste(out, collapse = ", ")))


#This method of outliers detection is based on the percentiles. With the percentiles method, all observations that lie outside the interval formed by the 2.5 and 97.5 percentiles will be considered as potential outliers. Other percentiles such as the 1 and 99, or the 5 and 95 percentiles can also be considered to construct the interval.
#The values of the lower and upper percentiles (and thus the lower and upper limits of the interval) can be computed with the quantile() function:
(lower_bound <- quantile(data$hwy, 0.025))
(upper_bound <- quantile(dat$hwy, 0.975))
#all observations below 14 and above 35.175 will be considered as potential outliers. The row numbers of the observations outside of the interval can then be extracted with the which() function:
(outlier_ind <- which(data$hwy < lower_bound | data$hwy > upper_bound))
#values of highway miles per gallon can be printed:
data[outlier_ind, "hwy"]
data[outlier_ind, ]

#There are 11 potential outliers according to the percentiles method. To reduce this number, you can set the percentiles to 1 and 99:
  
(lower_bound <- quantile(data$hwy, 0.01))
(upper_bound <- quantile(data$hwy, 0.99))

(outlier_ind <- which(dat$hwy < lower_bound | dat$hwy > upper_bound))


#more
#https://www.statsandr.com/blog/outliers-detection-in-r/#introduction
#https://www.itl.nist.gov/div898/handbook/eda/section3/eda35h.htm
#https://www.r-bloggers.com/2020/01/how-to-remove-outliers-in-r/
#https://towardsdatascience.com/ways-to-detect-and-remove-the-outliers-404d16608dba