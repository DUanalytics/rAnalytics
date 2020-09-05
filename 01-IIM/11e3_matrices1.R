#Matrices in R
#Matrix is a two dimensional data structure in R programming. Matrix is similar to vector but additionally contains the dimension attribute. All attributes of an object can be checked with the attributes() function (dimension can be checked directly with the dim() function).
#vector ----
(v1 = 1:24)

dim(v1)
attributes(v1)
class(v1)

#matrices
(m1 = matrix(data = 1:24, nrow=4))  #bycolumn
(m2 = matrix(data = 1:24, nrow=4, byrow=T))  #by row
(m3 = matrix(data = 1:24, ncol=4))  #by column, ncol

#what to do - filter, sum, other stats
length(m1)
length(m3)  #no of elements
dim(m1)
dim(m3) #dimensions rows * cols
attributes(m1)  #properties
class(m1)  #matrix, array

m1
dimnames(m1)= list(c('Jan','Feb','Mar','Apr'), paste('coy',1:6, sep=''))
m1 #4 months, 6 coys
m3
month.abb  #month abbreviations
#another way of giving names to row & col
colnames(m3) =  paste('coy',1:4, sep='')
rownames(m3)= month.abb[1:6]
m3  #6 months, 4 coys

m1
m1[1,]  #first row
m1[, 2]  #first row
m1[,2 , drop=F]  #see it is as column
m1[1:2,]  #first 2 rows
m1[1, 2:3] #first row, 2 to 3rd col
m1[c(1,3),c(2,3,5)]  #what is this
m1[,-1]  #skip first column
m1[,-c(2,5)]  #what is this

m1[1:24]  #matrix as vector
class(m1[1:24])  #integer


m1
m1 > 5 & m1 < 15  #which position are True & False
m1[m1 > 5 & m1 < 15] # values
m1[m1 > 5 & m1 < 15] = 100  #change values
m1

#join matrics
cbind(m1, m3)  #matching row & cols numbers
cbind(m1, m2)
rbind(m1,m2)

#stats
m1
colSums(m1)
rowSums(m1)
colMeans(m1)
rowMeans(m1)

m3
t(m3)  #transpose
sweep(m3, MARGIN=1, STATS=c(2,3,4,5,6,7), FUN='+')  #row + x
sweep(m3, MARGIN=2, STATS=c(1.2,1.3,1.4,1.5), FUN='*')  #col * x

#addmargins
m3
addmargins(m3, margin=1, sum)  #create a row with sum of columns
addmargins(m3, margin=2, sum)  #create a col with sum of rows
addmargins(m3, margin=c(1,2), mean)
M3functions = addmargins(m3, margin=c(1,2), list(list(mean, sum, max, min), list(var, sd, max, min)))
M3functions
round(M3functions,1)


#array is more than 2 dim matrix, same data type
4*3*2
length(100:123)
#2 coy, 3 products, 4 months
(a1 = array(100:123, dim=c(4,3,2)))
dimnames(a1) = list(list('Jan','Feb','Mar','Apr'), list('P1','P2','P3'), list('Coy1','Coy2'))
a1

apply(a1, MARGIN=1, FUN=sum)  #rows : month sales
apply(a1, MARGIN=2, FUN=sum)  #cols : product sales
apply(a1, MARGIN=3, FUN=sum)  #matrix : coy sales

apply(a1, MARGIN=c(2,3), FUN=sum)  #cols : product  & coy sales
apply(a1, MARGIN=c(1,3), FUN=mean)

#matrix & array - > 2 dim
# same datatype
