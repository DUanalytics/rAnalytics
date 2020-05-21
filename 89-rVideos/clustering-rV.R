#clustering1  : kmeans & heirachical 

pacman::p_load(dplyr, ggplot2)
#kmeans - number of clusters to be provided before. Numeric data

#marks of one subject : group them
marks1 = c(65, 60, 70, 75, 67)  #5 students  #2 groups
(exam1 = data.frame(marks1))
cluster2  = kmeans(exam1, centers=2)
cluster2
cluster2$cluster
cbind(exam1, group=cluster2$cluster)

#how does it happen
#for every point distance with other points are calculated
#eclidean :  sqrt((x1-x2)^2)

marks1 = c(65, 60, 70, 75, 67)  #5 students  #2 groups
marks2 = c(95, 80, 52, 55, 57)
(exam2 = data.frame(marks1, marks2))
cluster2B  = kmeans(exam2, centers=2)
cluster2B
cluster2B$cluster
cbind(exam2, group=cluster2B$cluster)
cluster2B$centers
#eclidean :  sqrt[ (x1-x2)^2 + (y1-y2)^2 ] 
#https://www.youtube.com/watch?v=5I3Ei69I40s

marks1 = c(65, 60, 70, 75, 67)  #5 students  #2 groups
marks2 = c(95, 80, 52, 55, 57)
project = c(120, 100, 90, 80,110)
(exam3 = data.frame(marks1, marks2, project))
#project marks will be more dominating
exam3scaled = scale(exam3)
exam3scaled #-3 to 3 : Z score scaling
cluster2C  = kmeans(exam3scaled, centers=2)
cluster2C
cluster2C$cluster
cbind(exam3, group=cluster2C$cluster)
cluster2C$centers
exam3 %>% group_by(group=cluster2C$cluster) %>% summarise(mean1 = mean(marks1), mean2= mean(marks2), P= mean(project))

#-----
#numeric, cluster Nos, scaling
df = mtcars
sapply(df, class)  #all are numeric

table(df[,c('cyl','gear','am','vs')])  #different categories and their count

kmModel1 = kmeans(df, centers=2)
kmModel1  #attributes of this model
kmModel1$size #how many cars in each cluster
kmModel1$cluster  #which rownumber of car goes into which cluster
kmModel1$centers  #average values of data of each cluster

df %>% dplyr::group_by(cluster=kmModel1$cluster) %>% summarise(meanMPG =mean(mpg), meanWt = mean(wt, na.rm=T)) #average mpg & wt in each cluster

plot(x=df$mpg, y=df$wt, col=kmModel1$cluster) #mpg vs wt with color as per cluster No

#how to choose no of cluster mathematically (business reqmt can be seperate)
#cohesion within the cluster, separation with cluster
pacman::p_load(NbClust, factoextra)
factoextra::fviz_cluster(kmModel1, data = df)

#how to choose best cluster
set.seed(123)
factoextra::fviz_nbclust(df, kmeans, method = "wss")
factoextra::fviz_nbclust(df, kmeans, method = "silhouette")

head(df)
km1 = kmeans(df, centers=1)
km1
km1$withinss
km1$totss
km1$tot.withinss
km2 = kmeans(df, centers=2)
km2
  km2$withinss  #2 cluster: within each cluster
km2$totss
km2$tot.withinss
km2$withinss[1] + km2$withinss[2]




#NbClust method----
set.seed(1234)
NbClust::NbClust(df, min.nc=2, max.nc=8, method='kmeans')
nc <- NbClust::NbClust(df, distance = "euclidean", min.nc=2, max.nc=8, method = "kmeans", index='all')
nc
nc$All.index
nc$Best.nc
nc$Best.partition

table(nc$Best.partition)
df %>% group_by(cluster = nc$Best.partition) %>% summarise(meanMPG= mean(mpg), meanWt = mean(wt, na.rm=T))

#now construct the Kmean Model again with k=3
set.seed(1234)
kmModel2 = kmeans(x=df, centers=3)
kmModel2$centers
#means from nc above and this way can be different because of randomness
df$cluster3 = kmModel2$cluster
head(df)
df %>% arrange(cluster)
df %>% filter(cluster == 1)
table(df$cyl, df$cluster3)
#Cluster 1- 6 Cylinder; Cluster2 - 8 Cylinder; Cluster3- Cylinder4
#when divide these cars into 3 groups, there is correlation between cluster & cylinder type

#if we divide it into 2 groups : Is there relation between am & cluster No
cbind(df, cluster2=kmModel1$cluster) %>% arrange(cluster2)
cbind(df, cluster2=kmModel1$cluster) %>% arrange(cluster2) %>% filter(cluster2==1)
#almost car with am=0 fall into 1 cluster; and cars with am=1, go into other group.

#can be used for market segmentation
#values have to be numeric 

#scaling ---------------------
#when values of different column have different ranges, we scale the values.
#most common scale is z scores, which scales values of column between -3 to 0 to 3
dfScale = scale(mtcars)
head(mtcars)
head(dfScale)

kmModelS1 <- kmeans(dfScale, centers=3)
kmModelS1

mtcars %>% group_by(cluster3 = kmModelS1$cluster) %>% summarise(meanMPG = mean(mpg, na.rm=T), meanWt = mean(wt, na.rm=T))

mtcars %>% group_by(cluster3 = kmModel2$cluster) %>% summarise(meanMPG = mean(mpg, na.rm=T), meanWt = mean(wt, na.rm=T))

factoextra::fviz_cluster(kmModel1, data = df)
factoextra::fviz_cluster(kmModel2, data = df)
factoextra::fviz_cluster(kmModelS1, data = df)
kmModel1$totss
kmModel2$totss
kmModelS1$totss #lesser the better, but here we have used scaled values

#good cohesions inside a group; good seperation between the groups.. that is the aim


#heirachical clustering
head(df)

dfScaled = scale(df)
data = dist(dfScaled)
head(data)
as.matrix(data)
fit.average = hclust(data, method = 'average')
plot(fit.average, hang=-1, cex=.8, main='Average Linkage Clustering : Cluster Nos (k value)')
rect.hclust(fit.average, k=5)

plot(fit.average, hang=-1, cex=.8, main='Average Linkage Clustering : height (hvalue')
rect.hclust(fit.average, h=1)
NbClust::NbClust(data, min.nc=2, max.nc=8, method = "ward.D2", index='all')

#https://uc-r.github.io/hc_clustering


#data

# Compute distance matrix
marks1 = c(65, 60, 70, 75, 67)  #5 students  #2 groups
marks2 = c(95, 80, 52, 55, 57)
project = c(120, 100, 90, 80,110)
(exam3 = data.frame(marks1, marks2, project))
#project marks will be more dominating
exam3scaled = scale(exam3)
res.dist <- dist(exam3scaled, method = "euclidean")

# Compute 2 hierarchical clusterings
hc1 <- hclust(res.dist, method = "complete")
hc2 <- hclust(res.dist, method = "ward.D2")

# Create two dendrograms
dend1 <- as.dendrogram (hc1)
dend2 <- as.dendrogram (hc2)

plot(dend1)
plot(dend2)
dendextend::tanglegram(dend1, dend2)  
  
fviz_nbclust(exam3scaled, FUN = hcut, method = "silhouette")
#https://www.statsandr.com/blog/clustering-analysis-k-means-and-hierarchical-clustering-by-hand-and-in-r/
    