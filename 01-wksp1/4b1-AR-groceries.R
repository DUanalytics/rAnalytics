# Association Rules - Groceries data set ####

library(arules)  #install first
library(arulesViz) #install first
library(datasets)  # no need to install, just load it reqd for Groceries
data('Groceries') #different format - transaction format
Groceries


#Structure of Groceries
str(Groceries)
Groceries
arules::LIST(Groceries[1:6])  #another view
arules::inspect(Groceries[1:5])

#Find Frequent Itemset
#.01 * 9835; A + B + C = 3 items, A + B + C + D : 4 items
frequentItems = eclat (Groceries, parameter = list(supp = 0.01, minlen= 2, maxlen = 5))
#frequentItems = eclat (Groceries, parameter = list(minlen= 3))
inspect(frequentItems[1:5])
frequentItems
inspect(frequentItems[])
#inspect(frequentItems[100:122])
#Descending Sort frequent items by count : 1 to 25 itemsets
inspect(sort (frequentItems, by="count", decreasing=TRUE)[1:25])
inspect(sort (frequentItems, by="count", decreasing=F)[1:25])

#Support is : support(A&B) = n(A&B)/ N
#Plot the Frequency Plot
itemFrequencyPlot(Groceries, topN = 15,type="absolute")
itemFrequencyPlot(Groceries, topN = 10, type='relative')
abline(h=0.15)

# Create rules and the relationship between items
#parameters are min filter conditions 
rules = apriori(Groceries, parameter = list(supp = 0.005, conf = 0.5, minlen=2))
rules
inspect (rules[1:15])
#Sort Rules by confidence, lift and see the data
rulesc <- sort (rules, by="confidence", decreasing=TRUE)
inspect(rulesc[1:5])
rulesl <- sort (rules, by="lift", decreasing=TRUE)
inspect (rulesl[1:5])
#which items have strong confidence and lift 

#How To Control The Number Of Rules in Output ?
#maxlen, minlen, supp, conf
rules2 = apriori (Groceries, parameter = list (supp = 0.001, conf = 0.5, minlen=2, maxlen=3)) 
rules2  #no of rules
rules #earlier rules
inspect(rules2[1:15])

#Find out what events were influenced by a given event - from already created rules
subset1 = subset(rules2, subset=rhs %in% "whole milk")
inspect(subset1) # rhs has milk
subset1 = subset(rules2, subset=rhs %in% 'bottled beer' )
inspect(subset1) #rhs has beer
#inspect(rules2)
subset2 = subset(rules2, subset=lhs %ain% c('baking powder','soda') )
inspect(subset2) # all items  %ain%
subset2a = subset(rules2, subset=lhs %in% c('baking powder','soda') )
inspect(subset2a) # any of the items %in%

#RHS, Confidence, sort by Lift
subset3 = subset(rules2, subset=rhs %in% 'bottled beer' & confidence > .5, by = 'lift', decreasing = T)
inspect(subset3)  #sometimes there may be no rules, change few parameters
subset4 = subset(rules2, subset=lhs %in% 'bottled beer' & rhs %in% 'whole milk' )
inspect(subset4)
subset4b = subset(rules2, subset=rhs %in% 'bottled beer'  )
inspect(subset4b) #no such rules

library(arulesViz) #install first
#https://cran.r-project.org/web/packages/arulesViz/vignettes/arulesViz.pdf
#Visualizing The Rules -----
subset1
rules2
inspect(subset2)
plot(subset1[1:2]) 
plot(subset1[1:2], measure=c("support", "lift"), shading="confidence")
#change the axis
plot(rules2[1:100], measure=c("support", "lift"), shading="confidence")
#


#Find what factors influenced an event ‘X’ - create fresh Rules
rules3 = apriori (data=Groceries, parameter=list (supp=0.002,conf = 0.7), appearance = list (default="lhs",rhs="whole milk"), control = list (verbose=F))
inspect(rules3[1:5])
inspect(rules3)


#rhs as it is, lhs to have tropical fruit or herbs
rules4 = apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.4), appearance = list (default="rhs",lhs=c('tropical fruit','herbs')), control = list (verbose=F))
inspect(rules4[1:5])
inspect(rules4)
plot(subset4) 


#legend to filter
#legend to condition commands 
# lhs - means left hand side, or antecendent
# rhs - mean right hand side, or consequent
# items - items, that make up itemsets
# %in% - matches any
# %ain% - matches all
# %pin% - matches partially
# default - no restrictions applied
# & - additional restrictions on lift, confidence etc.


#summarise Association Rules / Market Basket analysis
#load libraries - arules, arulesViz
#load dataset in Transaction Format eg Groceries
#Find frequentitems set
#Find rules as per parameters
#Parameters - min support, min confidence, minlen, maxlen
#sort - confidence, lift, count, support
#subset of rules - lhs, rhs, confidence, all, any item
#plot of the rules 
#find interesting rules  - high lift, high confidence
#put strategy in place - location, bundle, discounts, advertisement
