#Vivek Ranjan - IIMLN

pacman::p_load(readxl, dplyr)

#Importing the dataset in R

dataset = readxl::read_excel(path='E:/data/students/Anand Vihar_CPCB Data.xlsx', sheet='Sheet1')
colSums(is.na(dataset))
#Getting independent variables in the training set as below:
training_data   = na.omit(dataset)
colSums(is.na(training_data))

#Creating testing data for blank PM2.5 variables:
testing_data <- dataset %>% select(PM2.5, PM10, NO2, NOx, NH3, CO, Benzene) %>% filter(is.na(dataset$PM2.5))

#Fitting Multiple Linear Regression to the Training Set
regressor = lm(PM2.5 ~ ., data = training_data)

#Finally predicting the data:
P = predict(regressor, testing_data)

#Through this approach, I am able to get imputed values for PM2.5 but how to put them at exact places in my excel sheet.
#Also, I need to impute for other missing variables also.

#Imputing missing values

#simulated case--------------------
#create Vectors to be combined into DF

(name = paste('student',1:5, sep=''))
(marks1 = c(70, 50, NA, 50, NA))
(marks2 = c(NA, 40, 30, NA, 60))
(marks3 = c(NA, NA, 40, NA, 70))
#add missing values
df <- data.frame(name, marks1, marks2, marks3, stringsAsFactors = F)
df
row.names(df) = df$name
df
df$name = NULL
df
colSums(is.na(df))
is.na(df)
which(is.na(df))
sum(is.na(df))  #7 missing values

#list of missing values
#predict values
(MVpredict = c(100,200,300,400, 600, 700,800))
(VectorDF <- unlist(df))  #make it into a vector
VectorDF[which(is.na(df))]
(VectorDF[which(is.na(df))] <- MVpredict)
VectorDF
newDF <- matrix(VectorDF, nrow=5)
colnames(newDF) = names(df)
row.names(newDF) = rownames(df)
newDF
df
cbind(df, newDF)
#see if the values have been imputed..

#convert DF into a vector to impute.
#predicted values also have to be in sequence of missing values.
#recombine into matrix then DF

#this is approach not a solution.. similar to the problem u have described.

# 
# https://medium.com/coinmonks/dealing-with-missing-data-using-r-3ae428da2d17
# http://r-statistics.co/Missing-Value-Treatment-With-R.html
# https://towardsdatascience.com/data-cleaning-and-detecting-missing-values-from-australian-open-tennis-data-in-r-part-2-b4f6f32beffd
# https://datascienceplus.com/imputing-missing-data-with-r-mice-package/
# http://www.stat.columbia.edu/~gelman/arm/missing.pdf
# https://www.kdnuggets.com/2017/09/missing-data-imputation-using-r.html
# https://www.kaggle.com/rtatman/data-cleaning-challenge-imputing-missing-values


#------- 24 May 20------
dataset = read.csv('E:/DUdata/students/ranjan2.csv')
head(dataset)
str(dataset)
dataset$From.Date
summary(dataset$From.Date)  #444 NAs
dataset$From.Date = as.POSIXct(dataset$From.Date, '%d-%m-%Y %H:%M', tz='Asia/Calcutta')
(dataset$wwkdays1 = weekdays(dataset$From.Date, abbreviate = T))
(dataset$wwkdays2 = as.character(dataset$From.Date, '%w'))
(dataset$wwkdays3 = as.character(dataset$From.Date, '%W'))
(dataset$wwkdays4 = lubridate::wday(dataset$From.Date, label = TRUE))
(dataset$wwkdays5 = lubridate::wday(dataset$From.Date))
dataset[,c('From.Date','wwkdays1', 'wwkdays2', 'wwkdays3', 'wwkdays4', 'wwkdays5')]

#https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/weekdays
#https://cran.r-project.org/web/packages/lubridate/vignettes/lubridate.html
#https://stat.ethz.ch/R-manual/R-devel/library/base/html/strptime.html
