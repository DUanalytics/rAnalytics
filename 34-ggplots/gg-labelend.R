library(tidyverse)
library(ggrepel)

theme_set(theme_bw())

iris
df_long <- iris %>% tidyr::pivot_longer(cols=Petal.Length:Sepal.Width, names_to = 'variable', values_to = 'value')
head(df_long)

plot <- ggplot(df_long, aes(x=Species, y=value, group=variable)) + geom_line(aes(color=variable)) + geom_point() + theme(legend.position = 'top')
plot

(data_ends <- df_long %>% filter(Species == 'virginica'))
plot + geom_text_repel(aes(label=value), data=data_ends, face='plain', color='black', size=3)


(plot2 <- ggplot(df_long, aes(x=Species, y=value, group=variable)) + geom_line(aes(color=variable)) + geom_point())

plot2 + geom_text_repel(aes(label=variable), data=data_ends, face='plain', color='black', size=3)
