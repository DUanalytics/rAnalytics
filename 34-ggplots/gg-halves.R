
#https://cran.r-project.org/web/packages/gghalves/vignettes/gghalves.html

library(gghalves)

ggplot(iris, aes(y = Sepal.Width)) +
  geom_half_boxplot() +
  geom_half_point_panel(aes(x = 0.5, color = Species), range_scale = .5)


ggplot(iris, aes(x = Species, y = Sepal.Width)) +
  geom_half_boxplot()

ggplot(iris, aes(x = Species, y = Sepal.Width)) +
  geom_half_boxplot(side = "r", center = TRUE, errorbar.draw = FALSE)


library(ggbeeswarm)
ggplot(iris, aes(x = Species, y = Sepal.Width)) +
  geom_half_boxplot() +
  geom_beeswarm(beeswarmArgs = list(side = 1))
