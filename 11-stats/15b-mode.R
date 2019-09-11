# Mode with Package
#https://cran.r-project.org/web/packages/modeest/modeest.pdf

library(modeest)
#
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("genefilter")

mlv(mtcars$cyl,method='shorth')
mlv(mtcars$cyl, method = "discrete")

#M <- mlv(x, method = "discrete")
#plot(M)
#table(mtcars$cyl)
