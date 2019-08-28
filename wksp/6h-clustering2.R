#clustering - segmentation into groups

(salary = rnorm(20, mean=60, sd=10))
(age = rnorm(20, mean=30, sd=5))
df1 = data.frame(salary, age)
head(df1)
#Euclidean Distance 
k3 = kmeans(df1, centers=3)
k3
k3$cluster
k3$withinss
final = cbind(df1, cluster=k3$cluster)
final[order(final$cluster),]
plot(df1, col=k3$cluster, cex=k3$cluster, pch=k3$cluster)
points(k3$centers, pch=18, cex=3, col=k3$cluster)
k3$centers
head(df1)
sapply(df1, range)
df2= scale(df1)

k3b = kmeans(df2, centers=3)
k3b
cbind(k3b$cluster, k3$cluster)
k3b$centers
df2;df1
df1$cluster = k3b$cluster
head(df1)
df1$cluster1 = k3$cluster
head(df1)

library(dplyr)
df1 %>% group_by(cluster) %>% summarise(mean(salary), mean(age))
