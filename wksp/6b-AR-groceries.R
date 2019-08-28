# Association Rules - Groceries data set ####
#load the libraries
#load the data set - transaction format built in - Groceries
#frequent items - min support
#rules - minsp, minconf
#support, confidence and lift : sort, filter, interpret
# total transactions - 100
# burger - 80
# pepsi - 50
# pepsi + burger - 40
#pepsi -> burger :4/5
#burger -> pepsi : 4/8

library(arules)  #install first
library(arulesViz) #install first
library(datasets)  # no need to install, just load it; reqd for Groceries
data('Groceries')
Groceries

#Structure of Groceries
str(Groceries)
Groceries
arules::LIST(Groceries[1:6])  #another view
arules::inspect(Groceries[1:5])
arules::inspect(Groceries[100])

length(Groceries)
#LIST(Groceries[length(Groceries)-5:length(Groceries)])

#Find Frequent Itemset
frequentItems = eclat(Groceries, parameter = list(supp = 0.01, minlen= 2, maxlen = 5)) 
.01 * 9835
inspect(frequentItems)
frequentItems
inspect(frequentItems[10:15])
#Descending Sort frequent items by count : 1 to 25 itemsets
inspect(sort (frequentItems, by="count", decreasing=TRUE)[1:25])
inspect(sort (frequentItems, by="count", decreasing=F)[1:25])

#Support is : support(A&B) = n(A&B)/ N
#Plot the Frequency Plot
itemFrequencyPlot(Groceries,topN = 15,type="absolute")
itemFrequencyPlot(Groceries, topN = 20, type='relative')
abline(h=0.15)

# Create rules and the relationship between items
#parameters are min filter conditions 
rules = arules::apriori(Groceries, parameter = list(supp = 0.005, conf = 0.5, minlen=2))
rules
inspect (rules[1:5])
options(digits=3)
#Sort Rules by confidence, lift and see the data
rulesc <- sort (rules, by="confidence", decreasing=TRUE)
inspect(rulesc[1:5])
rulesl <- sort (rules, by="lift", decreasing=TRUE)
inspect (rulesl[1:5])
inspect (rulesl)

#which items have strong confidence and lift 
rules
#How To Control The Number Of Rules in Output ?
#maxlen, minlen, supp, conf
rules2 = apriori (Groceries, parameter = list (supp = 0.001, conf = 0.5, minlen=2, maxlen=6)) 
inspect(rules2[1:50])
#legend to condition commands 
# lhs - means left hand side, or antecendent
# rhs - mean right hand side, or consequent
# items - items, that make up itemsets
# %in% - matches any
# %ain% - matches all
# %pin% - matches partially - milk and whole milk for pin in milk
# default - no restrictions applied
# & - additional restrictions on lift, confidence etc.

#Find out what events were influenced by a given event
subset1 = subset(rules2, subset=rhs %in% "whole milk")  # whole milk in rhs
inspect(subset1[1:10])  #show only 1st 10 rows ; change it to show more
#if no such pattern, no output or index out of range will be printed
subset1 = subset(rules2, subset=rhs %in% 'root vegetables' )   #this item in rhs
inspect(subset1[1:10])
subset2a = subset(rules2, subset=lhs %ain% c('baking powder','soda') )  #all items in lhs
inspect(subset2a)
subset2b = subset(rules2, subset=lhs %in% c('baking powder','soda') )  #any of these in lhs
inspect(subset2b[1:5])  #first 5 rules
inspect(subset2b)
subset3 = subset(rules2, subset=rhs %in% 'bottled beer' & confidence > .7, by = 'lift', decreasing = T)
inspect(subset3)
subset4 = subset(rules2, subset=lhs %in% 'bottled beer' & rhs %in% 'whole milk' )
inspect(subset4[1:5])

subset5 = subset(rules2, subset=(rhs %pin% 'milk' | lhs %pin% 'milk') & confidence > .8)   #this item in rhs
inspect(subset5[c(1:10, 20:30)])

#Visualizing The Rules -----
#(https://cran.r-project.org/web/packages/arulesViz/vignettes/arulesViz.pdf)
plot(subset1[1:10]) 
inspect(subset1[1:10])
plot(subset1[1:10], measure=c("support", "lift"), shading="confidence")
plot(subset1, method = "two-key plot")
plot(subset1, method = "grouped")
plot(subset1[1:5], method = "paracoord")
inspect(subset1[1:5])
#
#we can create subset conditions at the time of creation of rules
#Find what factors influenced an event ‘X’
rules3 = apriori (data=Groceries, parameter=list (supp=0.002,conf = 0.8), appearance = list (default="lhs",rhs="whole milk"), control = list (verbose=F))
inspect(rules3[1:5])
inspect(rules3)


rules4 = apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.4), appearance = list (default="rhs",lhs=c('tropical fruit','herbs')), control = list (verbose=F))
inspect(rules4[1:5])
inspect(rules4)

#end of AR
#understand the measures of AR - support, confidence, lift
#apply the rules; find frequent items, sort rules, subset rules on conditions ; plot rule; interpret them; bring changes to your strategy