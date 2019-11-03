#waffle charts

library(ggplot2)
library(dplyr)
library(waffle)
#https://github.com/hrbrmstr/waffle
#https://towardsdatascience.com/three-key-charts-for-visualizing-proportion-data-4cf58c23d513

count <- mtcars %>%   group_by(cyl) %>%   summarise(n = n()) %>%  mutate(percent = round(n/sum(n)*100))
case_counts <- count$percent
names(case_counts) <- count$cyl
waffle(case_counts)


#-------
library(waffle)
library(magrittr)
library(hrbrthemes)
library(ggplot2)
library(dplyr)
library(waffle)
data.frame(
  parts = factor(rep(month.abb[1:3], 3), levels=month.abb[1:3]),
  vals = c(10, 20, 30, 6, 14, 40, 30, 20, 10),
  col = rep(c("blue", "black", "red"), 3),
  fct = c(rep("Thing 1", 3),
          rep("Thing 2", 3),
          rep("Thing 3", 3))
) -> xdf
xdf
xdf %>%
  count(parts, wt = vals) %>%
  ggplot(aes(fill = parts, values = n)) +
  geom_waffle(n_rows = 20, size = 0.33, colour = "white", flip = TRUE) +
  scale_fill_manual(
    name = NULL,
    values = c("#a40000", "#c68958", "#ae6056"),
    labels = c("Fruit", "Sammich", "Pizza")
  ) +
  coord_equal() +
  theme_ipsum_rc(grid="") +
  theme_enhance_waffle()
