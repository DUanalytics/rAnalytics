#pie with ggplot2

library(ggplot2)

df <- data.frame(  group = c("Male", "Female", "Child"), value = c(25, 25, 50))
head(df)

# Barplot
df
bp<- ggplot(df, aes(x="", y=value, fill=group)) +  geom_bar(width = 1, stat = "identity")
bp

# Barplot
bp<- ggplot(df, aes(x="", y=value, fill=group))+   geom_bar(width = 1, stat = "identity")
bp

pie <- bp + coord_polar("y", start=0)
pie
df
# Use custom color palettes
pie + scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))

# use brewer color palettes
pie + scale_fill_brewer(palette="Dark2")

#factor variable
ggplot(PlantGrowth, aes(x=factor(1), fill=group))+ geom_bar(width = 1)+  coord_polar("y")

library(scales)
pie + geom_text(aes(y = value/3 + c(0, cumsum(value)[-length(value)]),     label = percent(value/100)), size=5)

pie + geom_text(aes(y = value/3 + c(0, cumsum(value)[-length(value)]), label = percent(value/100)), size=5) + scale_fill_brewer("Blues") +  theme(axis.text.x=element_blank())



#-----
count.data <- data.frame(   class = c("1st", "2nd", "3rd", "Crew"),
  n = c(325, 285, 706, 885),   prop = c(14.8, 12.9, 32.1, 40.2) )
count.data

# Add label position
count.data <- count.data %>%   arrange(desc(class)) %>%   mutate(lab.ypos = cumsum(prop) - 0.5*prop) 
count.data


mycols <- c("#0073C2FF", "#EFC000FF", "#868686FF", "#CD534CFF")

ggplot(count.data, aes(x = "", y = prop, fill = class)) +   geom_bar(width = 1, stat = "identity", color = "white") +   coord_polar("y", start = 0)+  geom_text(aes(y = lab.ypos, label = prop), color = "white")+   scale_fill_manual(values = mycols) +   theme_void()

#https://www.datanovia.com/en/blog/how-to-create-a-pie-chart-in-r-using-ggplot2/
ggplot(count.data, aes(x = 2, y = prop, fill = class)) +  geom_bar(stat = "identity", color = "white") +   coord_polar(theta = "y", start = 0)+   geom_text(aes(y = lab.ypos, label = prop), color = "white")+   scale_fill_manual(values = mycols) +   theme_void()+   xlim(0.5, 2.5)


library(esquisse)
esquisse::esquisser()


ggplot(mtcars, aes(x=carb, y=..count.., fill=carb)) + geom_bar(stat='count') + coord_polar(theta='y', start=0)

mtcars %>% group_by(carb) %>% summarise(count=n()) %>% arrange(count) %>% mutate(cumSUM = cumsum(count)) %>%  mutate(prop = count / sum(count)) %>% mutate(lab.ypos = cumsum(count) - .6 * prop) %>%  ggplot(., aes(x="", y=count, fill=factor(carb)))+   geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0) + labs(fill='Carburators') + geom_text(aes(y=lab.ypos, label=round(prop*100,0)), color='white') 
("y", start=0)