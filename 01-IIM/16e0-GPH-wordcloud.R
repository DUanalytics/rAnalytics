#Word Cloud in R

library(wordcloud)

?wordcloud
#wordcloud(words,freq,scale=c(4,.5),min.freq=3,max.words=Inf,
          random.order=TRUE, random.color=FALSE, rot.per=.1,
          colors="black",ordered.colors=FALSE,use.r.layout=FALSE,
          fixed.asp=TRUE)
(words1 = c(letters, LETTERS, 0:9))
length(words1)
(freq1 = seq(1, 1000, len = 62))
wordcloud(words= words1, freq=freq1)

(words2 = c('Dhiraj','Vishnu', 'Nayak', 'Aishwarya', 'Kavita'))
(freq2 = runif(n=length(words2), min=10, max=50))
par(mar=c(0,0,0,0))
cbind(words2, freq2)
wordcloud(words= words2, freq=freq2)

#another library - data frame
library(wordcloud2)
?wordcloud2  
#wordcloud2(data, size = 1, minSize = 0, gridSize =  0, fontFamily = 'Segoe UI', fontWeight = 'bold', color = 'random-dark', backgroundColor = "white", minRotation = -pi/4, maxRotation = pi/4, shuffle = TRUE, rotateRatio = 0.4, shape = 'circle', ellipticity = 0.65, widgetsize = NULL, figPath = NULL, hoverFunction = NULL)

wordcloud2(demoFreq)
wordcloud2(demoFreq, size = 2)

wordcloud2(demoFreq, size = 1,shape = 'pentagon')
wordcloud2(demoFreq, size = 1,shape = 'star')

wordcloud2(demoFreq, size = 2,  color = "random-light", backgroundColor = "grey")

(iimstudents = data.frame(word=words2, freq=freq2))
par(mar=c(0,0,0,0))
wordcloud2(iimstudents, size=.5, shuffle = F)


#https://cran.r-project.org/web/packages/wordcloud2/vignettes/wordcloud.html
#https://www.r-graph-gallery.com/wordcloud.html