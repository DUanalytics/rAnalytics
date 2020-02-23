#Word Cloud Text File

Step 1 : Install and load the required packages
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

#Step 2: Create/Read a text file------
#read from a text file 
#text <- readLines(file.choose())
#or
# Read the text file from internet
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)

#Step 3 : Text mining------
# Load the data as a corpus
docs <- Corpus(VectorSource(text))
docs
inspect(docs)

#replace certain characters
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
docs
inspect(docs)

# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
# docs <- tm_map(docs, stemDocument)

#Step 4 : Build a term-document matrix-----
#Document matrix is a table containing the frequency of the words. Column names are words and row names are documents. The function TermDocumentMatrix() from text mining package can be used as follow :
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

#Step 5 : Generate the Word cloud-----
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,  max.words=200, random.order=FALSE, rot.per=0.35, colors=brewer.pal(8, "Dark2"))
#words : the words to be plotted
# freq : their frequencies
# min.freq : words with frequency below min.freq will not be plotted
# max.words : maximum number of words to be plotted
# random.order : plot words in random order. If false, they will be plotted in decreasing frequency
# rot.per : proportion words with 90 degree rotation (vertical text)
# colors : color words from least to most frequent. Use, for example, colors =“black” for single color.
#Misc
findFreqTerms(dtm, lowfreq = 4)
#correlation of freedom with 
findAssocs(dtm, terms = "freedom", corlimit = 0.3)

#barplot of words
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,  col ="lightblue", main ="Most frequent words",  ylab = "Word frequencies")

#library wordcloud2
par(mar=c(0,0,0,0))
wordcloud2::wordcloud2(d)
wordcloud2::wordcloud2(d, shape='star')


#refer this
#http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know