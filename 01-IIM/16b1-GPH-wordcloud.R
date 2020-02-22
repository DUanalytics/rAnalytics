#Word Cloud
#word & Freq; built in data sets

#-----
# World Cloud
#http://stat.ethz.ch/R-manual/R-devel/library/base/html/strsplit.html
#https://stackoverflow.com/questions/4350440/split-a-column-of-a-data-frame-to-multiple-columns

library(stringr)
library(wordcloud)
library(RColorBrewer)
library(tm)
library(SnowballC)
library(RCurl)
library(XML)


#How to use strsplit
strsplit('IIT-Gawahati', "-")
strsplit('IIT Gawahati', " ")

library(gsheet)
url = 'https://docs.google.com/spreadsheets/d/1_GQ-h4bgdNlIxcAanwRp_ak1u3JoWI-Vx2HKYj4FstA/edit#gid=0'
#check for dashtype, they are not always same
df1 = as.data.frame(gsheet2tbl(url))
df1
head(df1)
df1$wordexplanation
base::strsplit(df1$wordexplanation,'-')  #output as list need in DF

#Different Methods split and put in dataframe objects

#Stringr - str_split
stringr::str_split('IIT-Guwahati', "-")

#Method
(out1 = strsplit(as.character('IIT - Guwahati'),'-')) #if the word was not character
head(df1)
out = strsplit(df1$wordexplanation,'-') 
head(out)

t(sapply(out[1:5], '['))
df2=data.frame(t(sapply(out[1:200], '[')))

head(df2)
df= cbind(df1,df2)
head(df)
names(df)[c(2,3)] = c('word','explanation') #rename columns
head(df)

# create random frequencies for all words in a col
df$freq = floor(runif(100, 1,100))
head(df)

#Method for word cloud
library(wordcloud)
par(mar = c(1, 1, 1, 1))
wc1 = wordcloud(df$word, df$freq, random.order=T)
par(mar = c(1, 1, 1, 1))
wc2 = wordcloud(df$word, df$freq, random.order=F, colors = topo.colors(10))
par(mar = c(1, 1, 1, 1))
wc3 = wordcloud(df$word, df$freq, scale=c(4,.1), min.freq=2, max.words=50,  random.order=F)
wc4 = wordcloud(df$word, df$freq, scale=c(4,.1), random.order=F)


#------

library(RColorBrewer)
library(tm)
pal <- brewer.pal(8,"Dark2")
wc5 = wordcloud(df$word, df$freq, scale=c(4,.1), random.order=F, colors=pal)


#load the function rquery.wordcloud
source('http://www.sthda.com/upload/rquery_wordcloud.r')

res <- rquery.wordcloud(filePath, type ="file", lang = "english",min.freq = 1,  max.words = 200)

# Reds color palette
res <- rquery.wordcloud(filePath, type ="file", lang = "english",colorPalette = "Reds")
# RdBu color palette
res <- rquery.wordcloud(filePath, type ="file", lang = "english", colorPalette = "RdBu")
# use unique color
res<-rquery.wordcloud(filePath, type ="file", lang = "english",  colorPalette = "black")


tdm <- res$tdm
freqTable <- res$freqTable
# Show the top10 words and their frequency
head(freqTable, 10)

# Bar plot of the frequency for the top10
barplot(freqTable[1:10,]$freq, las = 2, 
        names.arg = freqTable[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")

findFreqTerms(tdm, lowfreq = 4)

findAssocs(tdm, terms = "freedom", corlimit = 0.3)

url = "http://www.sthda.com/english/wiki/create-and-format-powerpoint-documents-from-r-software"
rquery.wordcloud(x=url, type="url")


#------
#wordcloud2

#install.packages('wordcloud2')
library(wordcloud2)
df = data.frame(word=c('mdi','iim','imt'),freq=c(20,23,15))
df
par(mar=c(0,0,0,0))
wordcloud2(df)

head(demoFreq)
dim(demoFreq)
par(mar=c(0,0,0,0))
wordcloud2(demoFreq)

par(mar=c(0,0,0,0))
wordcloud2(demoFreq, size = 2, color = "random-light", backgroundColor = "grey")

names(demoFreq)
par(mar=c(0,0,0,0))
wordcloud2(demoFreq, size = 2, minRotation = -pi/2, maxRotation = -pi/2)
wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = -pi/6,   rotateRatio = 1)
wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = pi/6,    rotateRatio = 0.9)
par(mar=c(0,0,0,0))
wordcloud2(demoFreqC, size = 2,  color = "random-light", backgroundColor = "grey")
wordcloud2(demoFreqC, size = 2, minRotation = -pi/6, maxRotation = -pi/6,  rotateRatio = 1)

# Color Vector
?wordcloud2
colorVec = rep(c('red', 'skyblue'), length.out=nrow(demoFreq))
wordcloud2(demoFreq, color = colorVec, fontWeight = "bold")

wordcloud2(demoFreq, color = ifelse(demoFreq[, 2] > 20, 'red', 'skyblue'))


#Example2 -----
#Word Cloud 2

#(https://www.r-graph-gallery.com/the-wordcloud2-library/)

# library : install it first
library(wordcloud2) 

# have a look to the example dataset
head(demoFreq)
dim(demoFreq)
str(demoFreq)
#wordcloud
wordcloud2(demoFreq, size=1.6)
head(demoFreq[order(-demoFreq$freq),])
?wordcloud2

#create your own set of words
word = c('marketing','consumer', 'dhiraj','price','business','iimkashipur', 'sunder','vignesh', 'jyoti','finance', 'operations')
freq = c(30,20,15,36,15,13,11,44,13,44,34)
df1 = data.frame(word, freq)
#rownames(df1)= word
head(df1)
#df1 = head(demoFreq)
wordcloud2(df1, size=.4)
?wordcloud2
# Gives a proposed palette
wordcloud2(demoFreq, size=1.6, color='random-dark')
wordcloud2(df1, size=1, color='random-dark')

# or a vector of colors. vector must be same length than input data
wordcloud2(demoFreq, size=1.6, color=rep_len( c("green","blue"), nrow(demoFreq) ) )
# Change the background color
wordcloud2(demoFreq, size=1.6, color='random-light', backgroundColor="black")


# Change the shape:
wordcloud2(demoFreq, size = 0.7, shape = 'star')
#It is possible to change the shape of the wordcloud. Several shapes are available within the package: ‘circle’ (default), ‘cardioid’, ‘diamond’ (alias of square), ‘triangle-forward’, ‘triangle’, ‘pentagon’, and ‘star’).
wordcloud2(df1, size = 0.7, shape = 'pentagon')


#It is also possible to use any image you have as a mask! Just insert the image in the current working directory and use it as in the code below
# Change the shape using your image - not working
#wordcloud2(demoFreq, figPath = "peace.png", size = 1.5, color = "skyblue", backgroundColor="black")


#rotation
ww=wordcloud2(demoFreq, size = 2.3, minRotation = -pi/6, maxRotation = -pi/6, rotateRatio = 1)
ww

#chinese
demoFreqC
head(demoFreqC)
wordcloud2(demoFreqC, size = 2, fontFamily = "微软雅黑", color = "random-light", backgroundColor = "grey")

wordcloud2(demoFreqC, size = 2, color = "random-light", backgroundColor = "grey")
?demoFreqC

#Try this... not working as of now
#https://unicode.org/charts/PDF/U0900.pdf :  0900–097F
V2 = c('<U+9000><U+9001>', '<U+9002><U+9003>', '<U+900D><U+900F>', '<U+6570><U+636E>')
V1 = c(2000, 1000, 500,1000)
hindi = data.frame(V2, V1)
hindi
wordcloud2(hindi, size = 2, color = "random-light", backgroundColor = "grey")



#notworking : clear the plot area

#The lettercloud function allows to use a letter or a word as a shape for the wordcloud.
letterCloud( demoFreq, word = "R", color='random-light' , backgroundColor="blue")
letterCloud( demoFreq, word = "PEACE", color="white", backgroundColor="pink")


#see the link : https://www.r-graph-gallery.com

#Example3 -----
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



#Example4------
##http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know

#https://www.r-graph-gallery.com/196-the-wordcloud2-library/

# library #install this
library(wordcloud2) 

# have a look to the example dataset
head(demoFreq)
par(mar = c(1, 1, 1, 1))
wordcloud2(demoFreq, size=1)
#create your set of words and freq
df = data.frame(word=c('IIMS','IIMK','IIMKPV','IIMA','IIMC'),freq=c(70,13,35,40,21))
df
wordcloud2(df, size = 1)



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

