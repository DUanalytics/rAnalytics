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
