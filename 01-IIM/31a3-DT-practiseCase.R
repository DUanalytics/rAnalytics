#DT - simple case
#https://www.gormanalysis.com/blog/decision-trees-in-r-using-rpart/
#https://en.wikipedia.org/wiki/Staged_crash
#RearEnd crash - Fraud

library(rpart)
library(rpart.plot)
train <- data.frame(
  ClaimID = c(1,2,3),
  RearEnd = c(TRUE, FALSE, TRUE),
  Fraud = c(TRUE, FALSE, TRUE)
)
train
mytree <- rpart(  Fraud ~ RearEnd,   data = train,  method = "class" )

mytree
#Notice the output shows only a root node. This is because rpart has some default parameters that prevented our tree from growing. Namely minsplit and minbucket. minsplit is “the minimum number of observations that must exist in a node in order for a split to be attempted” and minbucket is “the minimum number of observations in any terminal node”. See what happens when we override these parameters.

mytree <- rpart(
  Fraud ~ RearEnd, 
  data = train, 
  method = "class", 
  minsplit = 2, 
  minbucket = 1
)
train
mytree

library(rattle)
library(rpart.plot)
library(RColorBrewer)

# plot mytree
fancyRpartPlot(mytree, caption = NULL)
#The decision tree correctly identified that if a claim involved a rear-end collision, the claim was most likely fraudulent. By default, rpart uses gini impurity to select splits when performing classification. (If you’re unfamiliar read this article.) You can use information gain instead by specifying it in the parms parameter.
#https://www.gormanalysis.com/blog/magic-behind-constructing-a-decision-tree
mytree <- rpart(
  Fraud ~ RearEnd, 
  data = train, 
  method = "class",
  parms = list(split = 'information'), 
  minsplit = 2, 
  minbucket = 1
)

mytree

#-----
#Now suppose our training set looked like this..

train <- data.frame(
  ClaimID = c(1,2,3),
  RearEnd = c(TRUE, FALSE, TRUE),
  Fraud = c(TRUE, FALSE, FALSE)
)

train
mytree <- rpart(
  Fraud ~ RearEnd, 
  data = train, 
  method = "class", 
  minsplit = 2, 
  minbucket = 1
)

mytree
#again no tree

#Once again we’re left with just a root node. Internally, rpart keeps track of something called the complexity of a tree. The complexity measure is a combination of the size of a tree and the ability of the tree to separate the classes of the target variable. If the next best split in growing a tree does not reduce the tree’s overall complexity by a certain amount, rpart will terminate the growing process. This amount is specified by the complexity parameter, cp, in the call to rpart(). Setting cp to a negative amount ensures that the tree will be fully grown.
mytree <- rpart(
  Fraud ~ RearEnd, 
  data = train, 
  method = "class", 
  minsplit = 2, 
  minbucket = 1, 
  cp = -1
)

fancyRpartPlot(mytree, caption = NULL)
#This is not always a good idea since it will typically produce over-fitted trees, but trees can be pruned back as discussed later in this article.
#You can also weight each observation for the tree’s construction by specifying the weights argument to rpart().
mytree <- rpart(
  Fraud ~ RearEnd, 
  data = train, 
  method = "class", 
  minsplit = 2, 
  minbucket = 1,
  weights = c(0.4, 0.4, 0.2)
)

fancyRpartPlot(mytree, caption = NULL)


train <- data.frame(
ClaimID = 1:7,
RearEnd = c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
Whiplash = c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE),
Fraud = c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE))

train
#let’s grow our decision tree, restricting it to one split by setting the maxdepth argument to 1.

mytree <- rpart(
  Fraud ~ RearEnd + Whiplash, 
  data = train, 
  method = "class",
  maxdepth = 1, 
  minsplit = 2, 
  minbucket = 1
)

fancyRpartPlot(mytree, caption = NULL)
#rpart has determined that RearEnd was the best variable for identifying a fraudulent claim. BUT there was one fraudulent claim in the training dataset that was not a rear-end collision. If the insurance company wants to identify a high percentage of fraudulent claims without worrying too much about investigating non-fraudulent claims they can set the loss matrix to penalize claims incorrectly labeled as fraudulent three times less than claims incorrectly labeled as non-fraudulent.
lossmatrix <- matrix(c(0,1,3,0), byrow = TRUE, nrow = 2)
lossmatrix

mytree <- rpart(
  Fraud ~ RearEnd + Whiplash, 
  data = train, 
  method = "class",
  maxdepth = 1, 
  minsplit = 2, 
  minbucket = 1,
  parms = list(loss = lossmatrix)
)

fancyRpartPlot(mytree, caption = NULL)
#Now our model suggests that Whiplash is the best variable to identify fraudulent claims. What I just described is known as a valuation metric and its up to the discretion of the insurance company to decide on it

