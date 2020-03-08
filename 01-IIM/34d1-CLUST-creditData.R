#Clustering - Credit Data
library(dplyr)

link="https://online.stat.psu.edu/onlinecourses/sites/stat508/files/lesson01/Credit.data"

df = read.table(link, header=T)
head(df)
sapply(df, class)
(num_cols <- unlist(lapply(df, is.numeric)) )
data <- df[ , num_cols]
head(data)

#group them---
km3 = kmeans(data, centers=3)
km3
km3$centers

km3$cluster
table(km3$cluster)
data[km3$cluster==1,]

library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization
fviz_cluster(km3, data = data)
head(data)
data %>% mutate(cluster = km3$cluster, rnames = row.names(data)) %>%  ggplot(aes(Income, Age, color = factor(cluster), label = rnames)) +   geom_text()
data %>% mutate(cluster = km3$cluster, rnames = row.names(data)) %>%  ggplot(aes(Education, Age, color = factor(cluster), label = rnames)) +   geom_text()

#how many clusters to select ?
#read..



#cluster: A vector of integers (from 1:k) indicating the cluster to which each point is allocated.
#centers: A matrix of cluster centers.
#totss: The total sum of squares.


#Plotting distances
#select sample
(data2 <- data %>% sample_n(10))

distance <- get_dist(data2)
fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))



#------
#withinss: Vector of within-cluster sum of squares, one component per cluster.
#tot.withinss: Total within-cluster sum of squares, i.e. sum(withinss).
#betweenss: The between-cluster sum of squares, i.e. $totss-tot.withinss$.
#size: The number of points in each cluster.
#-----
(data3 <- data %>% sample_n(100))

#visualising clusters----
k2 <- kmeans(data3, centers = 2, nstart = 25)
k3 <- kmeans(data3, centers = 3, nstart = 25)
k3
k4 <- kmeans(data3, centers = 4, nstart = 25)
k5 <- kmeans(data3, centers = 5, nstart = 25)

# plots to compare
p2 <- fviz_cluster(k2, geom = "point", data = data3) + ggtitle("k = 2")
p3 <- fviz_cluster(k3, geom = "point", data = data3) + ggtitle("k = 3")
p4 <- fviz_cluster(k4, geom = "point", data = data3) + ggtitle("k = 4")
p5 <- fviz_cluster(k5, geom = "point", data = data3) + ggtitle("k = 5")

library(gridExtra)
grid.arrange(p2, p3, p4, p5, nrow = 2)
#which cluster has good seperation and cohesion

#elbow method to find number of clusters
set.seed(123)
fviz_nbclust(data3, kmeans, method = "wss")

# compute gap statistic
set.seed(123)
gap_stat <- clusGap(data3, FUN = kmeans, nstart = 25,K.max = 10, B = 50)
print(gap_stat, method = "firstmax")
fviz_gap_stat(gap_stat)




#read more----
#https://uc-r.github.io/kmeans_clustering

#Hierarchical Clustering
library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms

head(data)
data4 <- dplyr::sample_n(data, 50)
dim(data4)

# Dissimilarity matrix
d1 <- dist(data4, method = "euclidean")
# Hierarchical clustering using Complete Linkage
hc1 <- hclust(d1, method = "complete" )
# Plot the obtained dendrogram
plot(hc1, cex = 0.6, hang = -1)

# Cut tree into 4 groups
sub_grp4 <- cutree(hc1, k = 4)
table(sub_grp4)
plot(sub_grp4)
data4 %>%   mutate(cluster = sub_grp4) %>%   head

#plot clusters with original dendrogram
plot(hc1, cex = 0.6)
rect.hclust(hc1, k = 4, border = 2:5)

fviz_cluster(list(data = data4, cluster = sub_grp4))

#compare Dendrograms with 2 methods
# Compute distance matrix
res.dist <- dist(data4, method = "euclidean")

# Compute 2 hierarchical clusterings
hc2a <- hclust(res.dist, method = "complete")
hc2b <- hclust(res.dist, method = "ward.D2")

# Create two dendrograms
dend2a <- as.dendrogram (hc2a)
dend2b <- as.dendrogram (hc2b)

tanglegram(dend2a, dend2b)


#Optimal no of clusters
fviz_nbclust(data4, FUN = hcut, method = "wss")
fviz_nbclust(data4, FUN = hcut, method = "silhouette")
gap_stat <- clusGap(data4, FUN = hcut, nstart = 25, K.max = 10, B = 50)
fviz_gap_stat(gap_stat)
head(data4)

#read
#https://uc-r.github.io/hc_clustering
#https://www.datacamp.com/community/tutorials/hierarchical-clustering-R