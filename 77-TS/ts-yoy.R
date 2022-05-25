#time series YoY differences

pacman::p_load(dplyr, googlesheets4, ggplot2, ggrepel, directlabels, lubridate)

gsID = "1G-F9YEH1qJBPtZgGbW3jZhIPfAcD5YgJHM_Fg05OtbU"

df <- googlesheets4::read_sheet(ss=gsID, sheet='admDates')

df

df2 <- df %>% tidyr::pivot_longer(cols=c('formDate','feePaidDate'), names_to = 'dateType', values_to='dateValue') %>% mutate(admYear = paste0('Y',admYear))
df2

df2$dateValue  <- as.Date(df2$dateValue)
df2
df2 %>% group_by(admYear)  %>% summarise(n=n())

df3 <- df2 %>% group_by(monValue = lubridate::month(dateValue, label=T), admYear)  %>% summarise(n=n())
df3
(df3A <- df3 %>% pivot_wider(names_from = c(admYear), values_from = n))
(df3B <- df3 %>%  group_by(admYear) %>% mutate(cumValue = cumsum(n))  %>% select(-c(n)) %>% pivot_wider(names_from = c('admYear'), values_from = 'cumValue'))


df3A

library(RColorBrewer)
# Define the number of colors you want
nb.cols <- 12
mycolors <- colorRampPalette(brewer.pal(8, "Set2"))(nb.cols)

yearOrder = c('Y2021', 'Y22Y21', 'Y2022', 'Y22Y20', 'Y2020' )
df3A %>% mutate(Y22Y21 = Y2022-Y2021, Y22Y20 = Y2022-Y2020)  %>%  tidyr::pivot_longer(cols=c('Y2022', 'Y22Y21', 'Y2021', 'Y2020', 'Y22Y20'), names_to = 'YearDiff', values_to = 'value') %>% mutate(YearDiff = factor(YearDiff, ordered=T, levels=yearOrder))  %>% ggplot(., aes(x=monValue, y=value, fill=monValue)) + geom_bar(stat='identity') + facet_grid(YearDiff ~. ) + geom_text(aes(label=paste0(value)))  + scale_fill_manual(values = mycolors) + theme(strip.text = element_text(color = "red"), strip.background = element_rect(fill = "yellow"))

#perc in each Month
df3 %>% group_by(admYear) %>%  mutate(propPerc = round(100 * n/ sum(n)))  %>% select(-c(n)) %>% pivot_wider(names_from = c('admYear'), values_from = 'propPerc') 
df3 %>% group_by(admYear) %>%  mutate(propPerc = round(100 * n/ sum(n)))  %>% select(-c(n)) %>% ggplot(., aes(x=admYear, y=propPerc, fill=monValue)) + geom_bar(stat='identity', position = position_fill(), color='black') + scale_fill_manual(values = mycolors) + coord_flip() + geom_text(aes(label=paste(monValue,'\n', propPerc, '%')), position = position_fill(.5))

df3 %>% group_by(admYear) %>%  mutate(propPerc = round(100 * n/ sum(n)))  %>% select(-c(n)) %>% ggplot(., aes(x=monValue, y=propPerc, fill=monValue)) + geom_bar(stat='identity') + facet_grid(admYear ~. ) + geom_text(aes(label=paste0(propPerc,'%')))




df3A %>% group_by(monValue)  %>% 
mutate(Y22Y21 = Y2022-Y2021, Y22Y20 = Y2022-Y2020)



#-----------------
#geom_dl(aes(label = State), method = list(dl.trans(x = x - 0.2), "first.points", cex = 0.8)) 
#geom_dl(aes(label = State), method = list(dl.combine("first.points", "last.points")), cex = 0.8) 