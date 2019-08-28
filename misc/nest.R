

library(dplyr)
gearnested <- mtcars %>% group_by(gear) %>% nest()
gearnested
gearnested[[1]]
gearnested[[1,'data']]
gearnested[[2,'data']]
gearnested[[3,'data']]
gearnested$data[[1]]
gearnested[['data']] #all
gearnested[['data']][[1]]

gearnested %>% unnest()

