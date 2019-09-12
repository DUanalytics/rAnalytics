#simple case of hierarchial clustering

library(flexclust)
data(nutrient, package='flexclust')
head(nutrient)
nutrient.scaled = scale(nutrient)  #zscore
head(nutrient.scaled)
d = dist(nutrient.scaled)
d  # diagonal matrix with distance values
head(d)
rownames(nutrient)
#Perform HClustering-----
fit.average = hclust(d, method = 'average')
plot(fit.average, hang=-1, cex=.8, main='Average Linkage Clustering')
rect.hclust(fit.average, k=5)
plot(fit.average, hang=-1, cex=.8, main='Average Linkage Clustering')
rect.hclust(fit.average, k=3, border='green')
plot(fit.average, hang=-1, xlab=NA, sub=NA, labels=rownames(nutrient), cex=.5, main='Average Linkage Clustering')
rect.hclust(fit.average, k=2, border='purple')
?rect.hclust
plot(fit.average, hang=-1, cex=.8, main='H Clustering')
rect.hclust(fit.average, h=3, border='blue')



library('dendextend')
## Example:
dend <- as.dendrogram(hclust(dist(USArrests), "ave"))
d1=color_branches(dend,k=5, col = c(3,1,1,4,1)) #k1-3; k2,k3,k5-1; k4-4
plot(d1) # selective coloring of branches :)
d2=color_branches(d1,k=5) # auto-coloring 5 clusters of branches.
plot(d2)
# More examples are in ?color_branches



