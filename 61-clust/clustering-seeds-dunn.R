#Clustering - seeds data set
#https://www.datacamp.com/community/tutorials/hierarchical-clustering-R


set.seed(786)
file_loc <- 'https://raw.githubusercontent.com/DUanalytics/datasets/master/csv/seeds.csv'
seeds_df <- read.csv(file_loc,header = FALSE)

feature_name <- c('area','perimeter','compactness','length.of.kernel','width.of.kernal','asymmetry.coefficient','length.of.kernel.groove','type.of.seed')
colnames(seeds_df) <- feature_name

str(seeds_df)
summary(seeds_df)
any(is.na(seeds_df))
seeds_df[!complete.cases(seeds_df),]
seeds_label <- seeds_df$type.of.seed
seeds_df$type.of.seed <- NULL
str(seeds_df)

seeds_df_sc <- as.data.frame(scale(seeds_df))
summary(seeds_df_sc)

dist_mat <- dist(seeds_df_sc, method = 'euclidean')

hclust_avg <- hclust(dist_mat, method = 'average')
plot(hclust_avg)
#cut the dendrogram in order to create the desired number of clusters. Since in this case you already know that there could be only three types of wheat you will choose the number of clusters to be k = 3, or as you can see in the dendrogram h = 3 you get three clusters. You will use R's cutree() function to cut the tree with hclust_avg as one parameter and the other parameter as h = 3 or k = 3.
cut_avg <- cutree(hclust_avg, k = 3)

plot(hclust_avg)
rect.hclust(hclust_avg , k = 3, border = 2:6)
abline(h = 3, col = 'red')

library(dendextend)
avg_dend_obj <- as.dendrogram(hclust_avg)
avg_col_dend <- color_branches(avg_dend_obj, h = 3)
plot(avg_col_dend)


library(dplyr)
seeds_df_cl <- mutate(seeds_df, cluster = cut_avg)
count(seeds_df_cl,cluster)
#how many observations were assigned in each cluster. Note that in reality from the labeled data you had 70 observations for each variety of wheat.

#rend between two features based on the clustering that you did in order to extract more useful insights from the data cluster-wise. As an exercise, you can analyze the trend between wheat's perimeter and area cluster-wise with the help of ggplot2 package

library(ggplot2)
ggplot(seeds_df_cl, aes(x=area, y = perimeter, color = factor(cluster))) + geom_point()

#all the varieties of wheat there seems to be a linear relationship between their perimeter and area.
#already have the true labels for this dataset, you can also consider cross-checking your clustering results using the table() function.
table(seeds_df_cl$cluster,seeds_label)

#see three groups with 55 elements or more. Overall, you can say that your clusters adequately represent the different types of seeds because originally you had 70 observations for each variety of wheat. The larger groups represent the correspondence between the clusters and the actual types.
#n many cases you don't actually have the true labels. In those cases, as already discussed, you can go for other measures like maximizing Dunn's index. You can calculate dunn's index by using the dunn() function from the clValid library. Also, you can consider doing cross validation of the results by making train and test sets, just like you do in any other machine learning algorithm, and then doing the clustering when you do have the true labels.

#---------------
library(clValid)
data(mouse)
express <- mouse[1:25,c("M1","M2","M3","NC1","NC2","NC3")]
rownames(express) <- mouse$ID[1:25]
## hierarchical clustering
Dist <- dist(express,method="euclidean")
clusterObj <- hclust(Dist, method="average")
nc <- 2 ## number of clusters      
cluster <- cutree(clusterObj,nc)
dunn(Dist, cluster)

#-----
hclust_avg <- hclust(dist_mat, method = 'average')
cut_avg <- cutree(hclust_avg, k = 3)
plot(hclust_avg)
as.matrix(dist_mat)
head(seeds_df)
dunn(distance = dist_mat, clusters=cut_avg, Data = seeds_df, method = "euclidean")   
dunn(distance = dist_mat, clusters=cut_avg)
#distance The distance matrix (as a matrix object) of the clustered observations. Required if Data is NULL.
#clusters- An integer vector indicating the cluster partitioning
#Data -The data matrix of the clustered observations. Required if distance is NULL.
#method -The metric used to determine the distance matrix. Not used if distance is provided.

#https://kkulma.github.io/2017-05-10-cluster-validation-in-unsupervised-machine-learning/
#Dunn Index represents the ratio of the smallest distance between observations not in the same cluster to the largest intra-cluster distance. As you can imagine, the nominator should be maximised and the denomitor minimised, therefore the index should be maximized. 
#  0 is bad and 1 is good.
#  Minimize the inter-similarities and maximize the intra similarities between the clusters by a quotient object function as a clustering quality measure.
