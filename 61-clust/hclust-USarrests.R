#Factor Extra - hclust

library("factoextra")
# Compute hierarchical clustering and cut into 4 clusters
res <- hcut(USArrests, k = 4, stand = TRUE)
res
# Visualize
k_colors = c("#00AFBB","#2E9FDF", "#E7B800", "#FC4E07")
fviz_dend(res, rect = TRUE, cex = 0.5, k_colors=c('red','green','blue','yellow')  )

# Optimal number of clusters for k-means
library("factoextra")
my_data <- scale(USArrests)
fviz_nbclust(my_data, kmeans, method = "gap_stat")


#
res3 <- hcut(USArrests, k = 3, stand = TRUE)
res3
# Visualize
fviz_dend(res3, rect = TRUE, cex = 0.5,  k_colors = c("#00AFBB","#2E9FDF", "#E7B800"))



#links
#http://www.sthda.com/english/wiki/factoextra-r-package-easy-multivariate-data-analyses-and-elegant-visualization