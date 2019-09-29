#ggsubplot
#https://rdrr.io/github/garrettgman/ggsubplot/

#install.packages("remotes")
remotes::install_github("garrettgman/ggsubplot")
library(ggsubplot)
# Not run: ggplot(nasa) +
map_americas +
  geom_subplot(aes(long, lat, group = id,
                   subplot = geom_point(aes(surftemp, temperature), size = 1/4))) +
  coord_map()
