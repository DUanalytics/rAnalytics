#Create Partition and Folds

data(oil)
head(oilType)
str(oilType)
oilType

length(oilType)
#Two Groups - equal numbers
createDataPartition(oilType, 2)

#Three Groups - equal numbers
createDataPartition(oilType, 3)
oilSamples = createDataPartition(oilType, 3)
str(oilSamples)  #list items 50 each
lapply(oilSamples,FUN=length)


#Create two partitions and plot them together
x = rnorm(100, mean=60, sd=5)
(x1 = createDataPartition(x, list=F)) #p=0.5 default
length(x1)

plot(density(x[x1]), col=2)
rug(x[x1], col=2)
points(density(x[-x1]), type = "l", col = 4)
rug(x[-inA], col = 4)


#Two Parts
createResample(oilType, 2)
createResample(oilType, 3)

#Folds
createFolds(oilType, 5)
createFolds(oilType, 3, FALSE)

createFolds(rnorm(21))  #default fold=10

#Time Slices : shift in phases
createTimeSlices(1:9, 5, 1, fixedWindow = FALSE)
createTimeSlices(1:9, 5, 1, fixedWindow = TRUE)
createTimeSlices(1:9, 5, 3, fixedWindow = TRUE)
createTimeSlices(1:9, 5, 3, fixedWindow = FALSE)

createTimeSlices(1:15, 5, 3)
createTimeSlices(1:15, 5, 3, skip = 2)
createTimeSlices(1:15, 5, 3, skip = 3)


#Group Fold... 
set.seed(131)
groups = sort(sample(letters[1:4], size = 20, replace = TRUE))
groups
table(groups)
folds = groupKFold(groups)
lapply(folds, function(x, y) table(y[x]), y = groups)
# }