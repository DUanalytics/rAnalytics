#HHE Batch : Nov 2023
#05Nov2023
mtcars
#control+enter   to run a line and move ahead
#customise shortcuts 

#vector----

x1 = c(1,4,6) #control + enter -> modify shortcuts
x1
print(x1)

x1[2]

x1[c(1,3)]

x2 <- c(4,35,34,77)
x2
print(x2)

class(x2)

#vector, matrics, dataframes - data structure
mean(x1)
1:10
X2

(x3 = 100:200)  #assign and print
min(x3)
max(x3)
sd(x3)

x5 = c('A', "Chaman", "Divya", 'mUNAZ')
class(x5)
x5
x5[3]
toupper(x5)
tolower(x5)

#matrix----
50:60
length(50:61)
?matrix

m1 = matrix(data=50:61,ncol=3, byrow=T, dimnames = list(c('R1','R2','R3','R4'), c('C1','C2','C3')))
m1
colSums(m1)
colMeans(m1)  
rowMeans(m1)

#array----
#will do later
?array
array(data=1:3, dim=c(2,4,2,2))

#dataframe----
rollno = c('S01','S02')
name = c('Dhiraj','Munaz')
age = c(55, 42)
sapply(list(rollno, name,age), class)

df = data.frame(rollno, name, age)
df
write.csv(df, file='./0-class/munaz.csv', row.names=F, na='' )
?read.csv
df1 = read.csv(file='./0-class/munaz.csv')
df1

#list----

ls()
list1 = list(df, x1,m1, age)
list1
list1[1]
list1[4]

#factor----
mtcars
?mtcars
?factor
class(mtcars)
str(mtcars)

mt = mtcars
str(mt)
dim(mt)
head(mt)
tail(mt)
summary(mt)

boxplot(mt$mpg)
hist(mt$mpg)
lines(mt$mpg)

barplot(table(mt$cyl), col=1:3)
barplot(table(mt$cyl), col=c('red','green','yellow'))
pie(table(mt$cyl), col=c('red','green','yellow'))
?pie

table(mt$cyl)
mt$cyl
table(mt$cyl, mt$am)





