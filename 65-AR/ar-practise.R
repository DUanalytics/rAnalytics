#AR

library(arules)
library(arulesViz)
library(dplyr)
library(ggplot2)


data("Groceries")
## add a complement-items for "whole milk" and "other vegetables"
g2 <- addComplement(Groceries, c("whole milk", "other vegetables"))
inspect(head(g2, 3))
LIST(head(g2, 3))

LIST(head(g2, 3))
## use a custom label for the complement-item
g3 <- addComplement(g2, "coffee", "NO coffee")
LIST(head(g3, 3))

LIST(head(Groceries, 3))
LIST(head(g2, 3))
LIST(head(g3, 16))

data("AdultUCI")
head(AdultUCI)
adult2 <- AdultUCI[c('workclass', 'education', 'marital-status')]
Adult1 <- as(adult2, 'transactions')
Adult1
LIST(Adult1[1:5])

d <- dist(USArrests, method='euclidean')
class(d)
round(as.matrix(d)[1:5,1:5],2)

hc <- hclust(d)
plot(hc)
cutree(hc, k = 1:5) #k = 1 is trivial
cutree(hc, h = 250)

## Compare the 2 and 4 grouping:
g24 <- cutree(hc, k = c(2,4))
rect.hclust(hc, k=2, border = 2)
rect.hclust(hc, k=4, border = 3)
abline(h = 200, col = 'yellow')
g24
table(grp2 = g24[,"2"], grp4 = g24[,"4"])
#from Cluster 1 of grp21, 14 stayin grp41, 2 in grp44
#from 24 values of grp22, 14 stayin grp42, 2 in grp43

library(dplyr)
library(ggplot2)
library(dendextend)
avg_dend_obj <- as.dendrogram(hc)
avg_col_dend <- color_branches(avg_dend_obj, h = 100)
plot(avg_col_dend)
cut_avg <- cutree(hc, k = 3)
seeds_df_cl <- mutate(USArrests, cluster = cut_avg)
seeds_df_cl
count(seeds_df_cl,cluster)
ggplot(seeds_df_cl, aes(x=Murder, y = Assault, color = factor(cluster))) + geom_point()
table(seeds_df_cl$cluster,seeds_label)
#https://www.datacamp.com/community/tutorials/hierarchical-clustering-R
