# Geom Hline

pacman::p_load(dplyr, ggplot2)

#create data frame 
df <- data.frame( x=c(1, 3, 3, 4, 5, 5, 6, 9, 12, 15),
                 y=c(13, 14, 14, 12, 17, 21, 22, 28, 30, 31))

#create scatterplot with horizontal line at y=20
g1 <- df %>% ggplot(., aes(x=x, y=y)) +  geom_point() + geom_hline(yintercept=20)
g1 + annotate("text", x=9, y=20.5, label="Some text")

g1 +  annotate("text", x=10, y=21.5, label="Some text", size=15, color="blue")


g1 + annotate("text", x=10, y=19, label="Some text", size=15, color="blue") +  annotate("text", x=10, y=21, label="More text", size=9, color="red")

# avg line------
ggplot(df, aes(x=x, y=y)) +  geom_point() + geom_hline(yintercept = mean(df$y, na.rm=TRUE))

ggplot(df, aes(x=x, y=y)) +   geom_point() + geom_hline(yintercept = mean(df$y, na.rm=TRUE), color='blue', lty='dashed', lwd=2)


#-----------
df <- data.frame(y=c(1:10),x=c(1:10))
h <- 7.1
plot1 <- ggplot(df, aes(x=x,y=y)) + geom_point() 
plot2 <- plot1+ geom_hline(aes(yintercept=h))

plot1 + geom_hline(aes(yintercept=h)) +   geom_text(aes(0,h,label = h, vjust = -1))

plot1 + geom_hline(aes(yintercept=h), colour="#BB0000", linetype="dashed") +   geom_text(aes( 0, h, label = h, vjust = -1), size = 3)
