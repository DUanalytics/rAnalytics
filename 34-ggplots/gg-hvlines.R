#geom_lines

#https://allancameron.github.io/geomtextpath/reference/geom_textabline.html
pacman::p_load(dplyr, ggplot2, geomtextpath)

ggplot(mtcars, aes(mpg, disp)) +  geom_point() +
  geom_texthline(yintercept = 200, label = "displacement threshold",   hjust = 0.8, color = "red4") +
  geom_textvline(xintercept = 20, label = "consumption threshold", hjust = 0.8,    linetype = 2, vjust = 1.3, color = "blue4") +  geom_textabline(slope = 15, intercept = -100, label = "partition line", color = "green4", hjust = 0.6, vjust = -0.2)

#-----------------
S1 <- mtcars %>% group_by(gear, am)  %>% summarise(avgMPG = mean(mpg, na.rm=T))
(S1am <- mtcars %>% group_by(am)  %>% summarise(avgMPG = mean(mpg, na.rm=T)))


g1 <- S1 %>% ggplot(., aes(x=factor(gear), y=avgMPG, fill=factor(gear))) + geom_bar(stat='identity') + facet_grid(am ~. , scales='free')
g1 + geom_texthline(data=S1am, aes(yintercept = avgMPG, label = round(avgMPG)),   hjust = 0.8, color = "red4")

(S2 <- mtcars %>% group_by(gear, am, cyl)  %>% summarise(avgMPG = mean(mpg, na.rm=T)))
(S2amcyl <- mtcars %>% group_by(am, cyl)  %>% summarise(avgMPG = mean(mpg, na.rm=T)))


g2 <- S2 %>% ggplot(., aes(x=factor(gear), y=avgMPG, fill=factor(gear))) + geom_bar(stat='identity') + facet_grid(am ~ cyl , scales='free')
g2
g2 + geom_texthline(data=S2amcyl, aes(yintercept = avgMPG, label = paste('Avg MPG of am-', am, '/ cyl-', cyl, ":", round(avgMPG))),   hjust = 0.8, color = "red4") + guides(fill='none')

