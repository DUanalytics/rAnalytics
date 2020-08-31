#List of packages to be installed

#Installing
listOfPackages = c('P1','P2')
install.packages(listOfPackages)

#first install package pacman
#loading multiple packages
library(pacman)
pacman::p_load(listOfPackages)

#install and load : first time only
pacman::p_install(listOfPackages)

#unload packages
pacman::p_unload(listOfPackages)

#remove packages from PC
pacman::p_delete(listOfPackages)

#datasets packages from packages
pacman::p_data(listOfPackages)

#installing
library(devtools)   #installing from github/dev env


#data manipulation-----
library(dplyr)  #summarise
library(data.table)  #new DS for manipulating large data
ibrary(tidyverse)  # data manipulation

#linear modeling
library(olsrr)


#decision tree-----
library(rpart)
library(rpart.plot)
library(randomForest)
library(CHAID)  #library for performing CHAID decision tree
install.packages("CHAID", repos="http://R-Forge.R-project.org")
library("mlbench") #data for DT
library(partykit)
library(party)
library(ISLR)  #data for DT

#association rule-----
library(arules)
library(arulesViz)


#clustering-----
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms
library(fpc) 
library(NbClust) # finding the optimal number of clusters
library(amap)
library(flexclust)


#statistics-----
library(survey) #data for stats
library(catspec)  #categories
library(survival)  #data for statistics
library(MASS)
library(caret)  #train & test, accuracy
library(caTools)  #sampling
library(Hmisc)
library(e10171)
library(BSDA)  #ztest
library(gmodels)
library(questionr)
library(fBasics)
library(outliers)
library(car)
library(mice)   #missing value
library(mosaic)



#timeseries-----
tsp1 <- c('timeseries','tseries','zoo','xts','quantmod','TTR','lubridate')
pacman::p_install(listOfPackages)
library(timeSeries)
library(tseries)
library(zoo)
library(xts)
library(quantmod)
library(TTR)
library(lubridate)
library(forecast)
library(astsa)
#graphs-----
library(ggplot2)
library(gridExtra) #ggplot graph combin
library(RColorBrewer) #color combinations
library(corrgram)  #corrrgram
library(lattice)

#import/export-----
library(openxlsx)   #excel
library(gsheet) #google sheet
library(readxl) #read excel files
library(xlsx)  #read/write xlsx : difficult to use
library(rJava)   #java reqd for some packages

#reproduce data (keep it small)----
recode_mtcars <- dput(head(mtcars))
dput(droplevels(iris[1:4, ])) #for df with factors
#copy to/from excel: clipboard
fromexcel <- dput(read.table("clipboard",sep="\t",header=TRUE))

#text mining-----
library(wordcloud2)
library(wordcloud)
library(RColorBrewer)
library(SnowballC)
library(RCurl)
library(XML)
library(tm)
library(syuzhet)
library(twitterR)
library(ROAuth)
library(RTextTools)
library(rvest)

#misc----
library(rattle)  #multi purpose
library(vcd) #data
library(VIM)
library(mice)


#others
