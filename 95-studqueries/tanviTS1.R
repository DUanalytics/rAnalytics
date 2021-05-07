#tanvi tiwari - TS assignment

#store dataset in E:/data/tanviTS.xlsx

pacman::p_load('dplyr', 'directlabels', 'googlesheets4', 'readxl', 'ggplot2', 'reshape2', 'expss', 'gridExtra', 'grid', 'xts', 'lubridate')

dir1 <- "E:/data/"
dir(dir1)
file1 <- c("tanviTS.xlsx") 

(loc1 <- paste(dir1, file1, sep=""))
(mysheets <- readxl::excel_sheets(loc1))

head(readxl::read_excel(loc1, sheet=mysheets[1], skip=0))
head(readxl::read_excel(loc1, sheet=mysheets[2], skip=0))
head(readxl::read_excel(loc1, sheet=mysheets[3], skip=0))
head(readxl::read_excel(loc1, sheet=mysheets[4], skip=0))
head(readxl::read_excel(loc1, sheet=mysheets[5], skip=0))

#RGDP_Q------
(RGDP <- readxl::read_excel(loc1, sheet=mysheets[3], skip=0))
str(RGDP)
names(RGDP)
head(RGDP[,1:6])  #1995 - Q1
tail(RGDP[,1:6])  #2019 - Q4
nrow(RGDP)
#convert to xts time series
?yearqtr
as.yearqtr('1995 Q1'); as.yearqtr('2019 Q4')
seq(as.Date("1995-01-01"), length=100, by="quarter")
xtsIndex <- as.yearqtr(seq(as.Date("1995-01-01"), length=100, by="quarter"))

# Use xts() to create TS
(RGDP1 <- xts(x = RGDP[,-c(1:5)], order.by = xtsIndex))
plot(RGDP1, legend.loc = 'top')
addLegend("right")
head(RGDP1)
head(RGDP)
RGDP1A <- data.frame(period = xtsIndex, coredata(RGDP1))
RGDP1B <- reshape2::melt(data=RGDP1A, id.vars='period', variable.name ='country')
head(RGDP1B)
str(RGDP1B)

options(scipen = F)
RGDP1B %>% ggplot(., aes(x=period, y=value, group=country)) + geom_line(aes(colour=country)) + guides(colour=guide_legend(ncol=1)) 

#create Quarterly Time Series for Austria only
?ts
austria1 <- ts(RGDP1[,c('Austria')], start=c(1995,1), end=c(2019,4), frequency = 4)
austria1

austria1TS <- decompose(austria1)
austria1TS
austria1TS$seasonal
austria1TS$random
austria1TS$trend

plot(austria1TS)

install.packages("remotes")
remotes::install_github("RamiKrispin/TSstudio", force=T)
library(RamiKrispin/TSstudio)
ts_decompose(austria1, type = "additive", showline = TRUE)



3
RDGP1 <- reshape2::melt()

status1 <- readxl::read_excel(loc1, sheet='status1', skip=1, col_types = c('date','text', rep('numeric',16), 'date', 'text') )