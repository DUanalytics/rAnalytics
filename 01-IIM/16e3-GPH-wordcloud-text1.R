# World Cloud 2
library(wordcloud)
library(RColorBrewer)
library(SnowballC)
library(RCurl)
library(XML)
library(tm)

# Read the text file from file
#text = readLines(file.choose())
text = readLines(con= file("iim.txt"))
text
text[1]
# Load the data as a corpus
docs = Corpus(VectorSource(text))
docs

#Text transformation
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
docs
#Cleaning Text
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
docs
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
docs <- tm_map(docs, stemDocument)


#Document Matrix
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

#Generate Word Cloud
set.seed(1234)
par(mar=c(0,0,0,0))
wordcloud(words = d$word, freq = d$freq, min.freq = 1,    max.words=200, random.order=FALSE, rot.per=0.35,        colors=brewer.pal(8, "Dark2"))

findFreqTerms(dtm, lowfreq = 4)
findAssocs(dtm, terms = "freedom", corlimit = 0.3)
head(d, 10)

#Plot Freq
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,       col ="lightblue", main ="Most frequent words",    ylab = "Word frequencies")

#Example2------

# Word Cloud

##http://dni-institute.in/blogs/colorful-word-cloud-using-r/
# tm for text mining
# SnowballC for text stemming
# wordcloud for generating word cloud images
# RCurl and XML packages to download and parse web pages
# RColorBrewer for color palettes


library(wordcloud)
library(RColorBrewer)
library(SnowballC)
library(RCurl)
library(XML)
library(tm)

source('http://www.sthda.com/upload/rquery_wordcloud.r')
#or #source('./TM/rquery_wordcloud.R')
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
#filePath2 <- "./data/martin-luther-king-i-have-a-dream-speech.txt"

res<-rquery.wordcloud(filePath, type ="file", lang = "english")
#res<-rquery.wordcloud(filePath2, type ="file", lang = "english")

