##http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know

#https://www.r-graph-gallery.com/196-the-wordcloud2-library/

# library #install this
library(wordcloud2) 

# have a look to the example dataset
head(demoFreq)
wordcloud2(demoFreq, size=1)
?wordcloud2
#create your set of words and freq
df = data.frame(word=c('cbap','cmap','iim','imt','calcutta'),freq=c(20,23,15,10,13))
df
wordcloud2(df)



# Gives a proposed palette
wordcloud2(demoFreq, size=1.6, color='random-dark')

# or a vector of colors. vector must be same length than input data
wordcloud2(demoFreq, size=1.6, color=rep_len( c("green","blue"), nrow(demoFreq) ) )

# Change the background color
wordcloud2(demoFreq, size=1.6, color='random-light', backgroundColor="black")

# Change the shape:
wordcloud2(demoFreq, size = 0.7, shape = 'star')
head(demoFreq)
?wordcloud2
# Change the shape using your image
wordcloud2(demoFreq, figPath = "india.jpg", size = 1.5, color = "skyblue", backgroundColor="black")



#myeg-----
word = factor(c('Assets', 'Liabilities', 'Expenses', 'CashFlow', 'BottomLine','ProfitandLoss', 'Strategy', 'Planning', 'Forecast','Business'))
length(word)
(freq= c(27,35,32,31,33,24,26,27,28,29))
#freq = as.integer(runif(length(word), 50,100))
(df2 = data.frame(word, freq))
row.names(df2) = word

head(df2)
wordcloud2(df2)
wordcloud2(df2, color = ifelse(df2[, 2] > 30, 'red', 'skyblue'))
