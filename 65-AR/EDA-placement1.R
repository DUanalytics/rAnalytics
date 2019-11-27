#AR Placement Results

require(arules)
require(arulesViz)
library(dplyr)
library(ggplot2)
options(digits=3)

#sample columns for placement
#select, gender, grade, comskills, itskills
n=1000
(select = sample(x=c('Placed', 'NotPlaced'), size=n, replace=T, prob=c(.6,.4)))
(gender = sample(x=c('M', 'F'), size=n, replace=T, prob=c(.6,.4)))
(grade = sample(x=c('A','B','C'), size=n, replace=T, prob=c(.3,.5,.2)))
table(grade)
(comskills = sample(x=c('Good','Sat','Poor'), size=n, replace=T, prob=c(.3,.5,.2)))
table(comskills)
(itskills = sample(x=c('Advanced','Basic','No'), size=n, replace=T, prob=c(.4,.4,.2)))
table(itskills)

students = data.frame(gender, grade, comskills,itskills,stringsAsFactors = T)
summary(students)
studentsT = as(students, "transactions")

#include Results------
studentsPlacement = cbind(students, select)
head(studentsPlacement)
summary(studentsPlacement)
#cluster Rules## cluster association rules
studentsPlacementT = as(studentPlacement, "transactions")


#---------------------------
#without Results
studentsT
(s1 <- sample(studentsT, 50))
(a1 <- affinity(s1))
#Affinity between the two items i and j is affinity
image(a1)

d_jaccard1 <- dissimilarity(s1, which = "items")
hc1=hclust(d_jaccard1, method = "ward.D2")
plot(hc1, main = "Dendrogram for items")
plot(hc1, cex = 1, hang = -1)
rect.hclust(hc1, k = 4, border = 2:5) #around 4 clusters with colors 2:5
rect.hclust(hc1, k = 2, border = 7:8)
plot(hc1, cex = 1, hang = -1)
rect.hclust(hc1, h = 1, border = 2:5)

plot(hc1, cex = 1, hang = -1)
rect.hclust(hc1, k = 4, border = 2:5)
assign1 <- cutree(hc1, k=4)
table(assign1)
assign1
itemFrequencyPlot(s1[assign1==1], population=s1, topN=5)

## calculate affinity-based distances between transactions and do hclust
#which student is similar to other
s1
d_affinity1b <- dissimilarity(s1, method = "affinity")
hc1b <- hclust(d_affinity1b, method = "ward.D2")
plot(hc1b, main = "Dendrogram for Transactions (Affinity)", hang=1)
rect.hclust(hc1b, k=4, border = 2:5)
students[c(301,89),]
assign1b <- cutree(hc1b, k=4)
table(assign1b)
assign1b
#table(assign1b ==1, assign1b ==2)
inspect(s1[assign1b==1])
itemFrequencyPlot(s1[assign1b==1], population=s1, topN=5)

#with results--------
studentsPlacementT
LIST(studentsPlacementT[1:5])
itemFrequency(studentsPlacementT)
itemFrequencyPlot(studentsPlacementT, type='absolute')

rules1 <- apriori(studentsPlacementT, parameter=list(support=0.005))
inspect(rules1)
#appearance1 = list(items = c("select=Placed", "comskills=Good"))
appearance1 = list(default = "lhs", rhs=c("select=Placed", "select=NotPlaced"))
rules2 <- apriori(studentsPlacementT, parameter=list(minlen=2, supp=0.003,conf=.6), appearance = appearance1)
inspect(rules2)

## use affinity to cluster rules we need to supply the transactions (or affinities) from the (sample).
s2 <- sample(studentsPlacementT, 50)
d_affinity2 <- dissimilarity(rules2, method = "affinity", args = list(transactions = s2))
d_affinity2
hc2a <- hclust(d_affinity2, method = "ward.D2")
plot(hc2a, main = "Dendrogram for Rules (Affinity)")
## create 4 groups and inspect the rules in the first group.
assign2a <- cutree(hc2a, k = 3)
assign2a
inspect(rules2[assign2a == 1])





#graphs------------------------
ggplot(studentsPlacement, aes(x=select, fill=select)) + geom_bar(stat='count') + geom_text(stat='count',aes(label=..count..), size=rel(7)) + ggtitle('Overall Placement Count ') + theme(legend.position = 'top')

ggplot(studentsPlacement, aes(x=select, fill=gender)) + geom_bar(stat='count') + ggrepel::geom_text_repel(stat='count',aes(label=..count..), size=rel(4), vjust=0, position=position_stack()) + ggtitle('Gender Wise : Placement Count ') + theme(legend.position = 'top')

ggplot(studentsPlacement, aes(x=select, fill=gender)) + geom_bar(stat='count') + ggrepel::geom_text_repel(stat='count',aes(label=..count..), size=rel(4), vjust=0, position=position_stack()) + ggtitle('Gender - Grade Skill Wise : Placement Count ') + theme(legend.position = 'top') + facet_grid(~ grade)

ggplot(studentPlacement, aes(x=select, fill=gender)) + geom_bar(stat='count', position=position_stack()) + ggrepel::geom_text_repel(stat='count',aes(label=..count..), size=rel(4), vjust=0, position=position_stack()) + ggtitle('Gender - Communication - IT Skill Wise : Placement Count ') + theme(legend.position = 'top') + facet_grid(itskills ~ comskills, labeller = label_both)


fset1 = eclat(studentsPlacementT, parameter= list(support=.05))
head(inspect(fset1))
summary(fset1)

itemFrequencyPlot(studentsPlacementT)
(singleItems <- fset1[size(items(fset1)) == 1])#single iteme
inspect(singleItems)
(singleSupport <- quality(singleItems)$support)
inspect(fset1[size(items(fset1)) == 2]) #2 items
inspect(fset1[size(items(fset1)) == 3]) #3 items 
inspect(fset1[size(items(fset1)) == 4]) #4 items 

inspect(items(fset1[1:5]))
names(singleSupport) <- unlist(LIST(items(singleItems),decode = FALSE))
singleSupport
head(singleSupport, n = 5)

rules = rules2
DF_rules = DATAFRAME(rules)
DF_rules
DATAFRAME(rules, setStart = '', itemSep = ' + ', setEnd = '')

inspect(head(rules, by = "conf"))
as(rules, "data.frame")
DATAFRAME(rules)
DATAFRAME(rules, separate = TRUE)
#swperate LHS and RHS
DATAFRAME(rules, separate = FALSE)
#seperate parameters
DATAFRAME(rules, separate = TRUE, setStart = '', itemSep = ' + ', setEnd = '')


(fsetsNotPlaced <- subset(fset1, subset = items %pin% "NotPlaced"))
inspect(sort(fsetsNotPlaced[size(fsetsNotPlaced) >= 3]))

crossTable(studentsPlacementT, measure="support", sort=TRUE)[1:5,1:5]
crossTable(studentsPlacementT, measure="count", sort=TRUE)
crossTable(studentsPlacementT, measure="probability", sort=TRUE)
crossTable(studentsPlacementT, measure="lift", sort=TRUE)[1:5,1:5]


#other functions
#combine rules
r1 <- apriori(studentsPlacementT[1:500], parameter=list(support=0.005))
r2 <- apriori(studentsPlacementT[400:1000], parameter=list(support=0.005))
(totalRules = c(r1,r2))
(unionRules = union(r1, r2))  #error
(quality(r2) <- cbind(quality(r2), coverage = coverage(r2)))
# support of the left-hand-side of the rule
inspect(r2)


#discritise data
(cgpa = round(runif(n=n, min=5, max=9.9),2))
CGPA = discretize(cgpa, method = "cluster", breaks = 3, labels = c('Low','Medium','High'))
#discretizeDF(iris)
studentsPlacement2 = cbind(studentPlacement, CGPA)
head(studentsPlacement2)

dissimilarity(studentsPlacementT[1:10], y = NULL, method = NULL, args = NULL,  which = "transactions")
dissimilarity(studentsPlacementT[1:10], y = NULL, method = NULL, args = NULL,  which = "associations")
duplicated(studentsPlacementT)
studentsPlacement[duplicated(studentsPlacementT),]

#this if there are levels
#aggregate(studentsPlacementT, by='level2')

hits(studentPlacementT)
#visually inspect binary incidence matrices,
image(studentsPlacementT[1:100])

inspect(rules3[10], ruleSep = "---->", itemSep = " + ", setStart = "", setEnd ="",  linebreak = FALSE)

## calculate several measures
m <- interestMeasure(rules2, c("support","confidence", "oddsRatio", "leverage"), transactions = studentPlacementT)
m

#significant
is.significant(rules2, transactions=studentsPlacementT, method = "fisher", alpha = 0.001, adjust = "bonferroni")

studentsPlacementT
iLabels <- itemLabels(studentsPlacementT)
iLabels
list <- LIST(studentsPlacementT[1:5], decode = FALSE)
list
decode(list, itemLabels = iLabels)

itemFrequencyPlot(x=studentsPlacementT, type = "absolute")
itemFrequencyPlot(x=studentsPlacementT, type = "absolute", lift=T, population=studentPlacementT)
itemFrequencyPlot(x=studentsPlacementT, type = "absolute", support = .05,population=studentPlacementT, horiz=T)


itemIntersect(x, y)
inspect(itemUnion(items(fset1[1:2]), items(fset1[3:4])))
inspect(itemSetdiff(items(fset1[1:2]), items(fset1[3:4])))
inspect(itemIntersect(items(fset1[1:2]), items(fset1[3:4])))

#get unique transactions, count frequency of unique transactions and plot frequency of unique transactions
(vals <- unique(studentsPlacementT))
(cnts <- tabulate(match(studentsPlacementT, vals)))
plot(sort(cnts, decreasing=TRUE))
## find all transactions which are equal to transaction 10 in Adult
which(studentsPlacementT %in% studentsPlacementT[10])
studentsPlacementT[1:10] %in% "gender=M"
## find all transactions which contain items that partially match "gender=" (all here).
studentsPlacementT[1:10] %pin% "=Placed"
## find all transactions that only include the item "age=Middle-aged" (none here).
studentsPlacementT[1:10] %oin% "select=Placed"
## find al transaction which contain both items "age=Middle-aged" and "sex=Male"
studentsPlacementT[1:10] %ain% c("select=Placed", "comskills=Good")
head(students)
head(studentsPlacement)
studentsPlacement[studentsPlacementT %ain% c("select=Placed", "comskills=Good"),]


#Predicts the membership (nearest neighbor) of new data to clusters represented by medoids or labeled examples.



#https://cran.r-project.org/web/packages/arules/arules.pdf
