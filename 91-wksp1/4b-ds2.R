#Data Structures - II
#Home Work

#Arrays
length(100:123)
4*3*2
#2 coys, 3 products, 4 locations sold qty
(a1 = array(100:123, dim=c(4,3,2)))
(loc = paste('loc', 1:4,sep='-'))
(product = paste('p', 1:3,sep='@'))
(coy = paste('coy', 1:2,sep='%'))
dimnames(a1) = list(loc, product, coy)
a1
apply(a1,1, sum) #locationwise
apply(a1,2, sum) #productwise
apply(a1,c(1,2), sum) #product-location wise
apply(a1,c(2,3), sum) #product-coy wise
apply(a1,c(1,3), sum) #coy-location
apply(a1,3, sum) #coywise
sum(a1) #total



#Lists
#List -----
g ="My First List"
h = c(25, 26,18,39)
j = matrix(1:10,nrow=2)
k = c('one','two','three')
mylist = list(title=g, ages=h, j, h)
mylist
mylist[2]
mylist[[2]]
mylist[['ages']]
mylist$ages
