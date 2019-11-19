#wordcloud2

#install.packages('wordcloud2')
library(wordcloud2)

#eg1
df = data.frame(word=factor(c('mdi','iim','imt','fms')),freq=c(20,23,105, 30))
df
wordcloud2(df)

#built in data set
head(demoFreq)
nrow(demoFreq)
wordcloud2(demoFreq, size = 2, color = "random-light", backgroundColor = "grey")
names(demoFreq)
wordcloud2(demoFreq, size = 2, minRotation = -pi/2, maxRotation = -pi/2)
wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = -pi/6,   rotateRatio = 1)
wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = pi/6,    rotateRatio = 0.9)

wordcloud2(demoFreqC, size = 2,  color = "random-light", backgroundColor = "grey")
wordcloud2(demoFreqC, size = 2, minRotation = -pi/6, maxRotation = -pi/6,  rotateRatio = 1)

# Color Vector

colorVec = rep(c('red', 'skyblue'), length.out=nrow(demoFreq))
wordcloud2(demoFreq, color = colorVec, fontWeight = "bold")

wordcloud2(demoFreq, color = ifelse(demoFreq[, 2] > 20, 'red', 'skyblue'))


#
#eg2 : subset these words
str(demoFreq)
df3 = demoFreq[ sample(1:nrow(demoFreq), size=10, replace=T), ]
df3
wordcloud2(df3)
df3=fix(df3)
df3
wordcloud2(df3)
