#partition the data into train and test set
mtcars
nrow(mtcars)
#train-70%, test-30%
(myvalues = 1:32)
selected = sample(x=myvalues, size=.7 * 32)
length(selected)

index = sample(x=1:nrow(mtcars), size=.7 * nrow(mtcars), replace=F)
index
mtcars[c(1,4),]  #first & 4th row no
mtcars[-c(1,4),] #exclude 1 & 4

train= mtcars[index,]
test= mtcars[-index,]
nrow(train)
nrow(test)
nrow(train) + nrow(test)

#
(rollnos = 1:50)
rollnos[rollnos > 20]
rollnos[10:15]
set.seed(1234)
(select = sample(x=rollnos, size=.75 * length(rollnos)))
length(select)
#
#40 students - M & F
(gender = c('M','F','M'))
(gender = sample(x=c('M','F'), size=40, replace=T))
(gender = sample(x=c('M','F'), size=10000, replace=T, prob=c(.6, .4)))
table(gender)
prop.table(table(gender))



#-------

## 75% of the sample size
smp_size <- floor(0.75 * nrow(mtcars))

## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(mtcars)), size = smp_size)

train <- mtcars[train_ind, ]
test <- mtcars[-train_ind, ]

# -----
require(caTools)
library(caTools)
?require
set.seed(101) 
sample = sample.split(mtcars$am, SplitRatio = .75)
sample
train = subset(mtcars, sample == TRUE)
test  = subset(mtcars, sample == FALSE)
train
; test
nrow(train); nrow(test)
table(train$am); table(test$am)

mtcars$id <- 1:nrow(mtcars)
train <- mtcars %>% dplyr::sample_frac(.75)
test  <- dplyr::anti_join(mtcars, train, by = 'id')

library(caret)
intrain<-createDataPartition(y=factor(mtcars$am),p=0.7,list=FALSE)
intrain
training<-mtcars[intrain,]
testing<-mtcars[-intrain,]
training  
testing
table(training$am)
table(testing$am)













