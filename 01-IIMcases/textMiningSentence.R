#Text Mining

#Loading Packages
library(tm)
library(wordcloud)
library(RColorBrewer)
#Now in order to process or clean the text using tm package, you need to first convert this plain text data into a format called corpus which can then be processed by the tm package. A corpus is a collection of documents (although in our case we only have one).Following is the command to convert .txt file into a corpus. 

text = "Do not let anyone or anything outside of your own control tell you or suggest to you what will make you happy. That decision of what is happiness is up to you and you alone to create and cherish"
speech <- Corpus(VectorSource(text))
speech
#speech <- Corpus(VectorSource(speech_txt))
#To see the first few documents in the text file, type the R command:
inspect(speech)[1:10]
?tm_map
(speech_data<-tm_map(speech,stripWhitespace))
(speech_data<-tm_map(speech_data,tolower))
speech_data<-tm_map(speech_data,removeNumbers)
speech_data<-tm_map(speech_data,removePunctuation)
speech_data<-tm_map(speech_data,removeWords, stopwords('english'))
speech_data<-tm_map(speech_data, removeWords, c('and','the','our','that','for','are','also','more','has','must','have','should','this','with'))

#Create a Term Document Matrix

#It is a mathematical matrix that describes the frequency of terms that occur in a collection of documents. In a document-term matrix, rows correspond to words in the collection and columns correspond to documents.

#Now we can create a word cloud even without a TDM. But the advantage of using this here is to take a look at the frequency of words.
tdm_speech<-TermDocumentMatrix (speech_data) #Creates a TDM
tdm_speech
TDM1 <- as.matrix(tdm_speech) #Convert this into a matrix format
TDM1
v = sort(rowSums(TDM1), decreasing = TRUE) #Gives you the frequencies for every word
head(v)
summary(v)
#summary(v) will give us the distribution of the frequency of words. So we can take a look at the least and max number of times a word has occurred. This helps us set the “max.words” parameter in the next step.

#Create your first word cloud!
par(mar=c(0,0,0,0))
set.seed(1234)
wordcloud (speech_data, scale=c(3,0.5), max.words=15, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, 'Dark2'))

#Scale controls the difference between the largest and smallest font, max.words is required to limit the number of words in the cloud (if you omit this R will try to squeeze every unique word into the diagram), rot.per is the percentage of vertical text, and colors provides a wide choice of symbolizing your data. look at the topics that were brushed upon in the speech. If you use bigger text documents (I would suggest you try with some short stories, your favorite plays or any tweets data trends on the latest topic) then you can set your max.words as 50 or 100 depending on which range you want your word cloud to be.


#http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know

#words which occur at least 4 times
findFreqTerms(TDM1, lowfreq = 4)
findAssocs(dtm, terms = "freedom", corlimit = 0.3)
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")


#--------
link3 <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(link3)
text 
# Load the data as a corpus
docs <- Corpus(VectorSource(text))
docs
inspect(docs)
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

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
# docs <- tm_map(docs, stemDocument  

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))
findFreqTerms(dtm, lowfreq = 4)
findAssocs(dtm, terms = "freedom", corlimit = 0.3)
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
#http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know