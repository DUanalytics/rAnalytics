#Install packages for Data Analytics Course


#install java from web
#https://www.java.com/en/download/
#restart your laptop and then run this file to install

packages1 = c('rJava','xlsx','dplyr','plyr','tidyr', 'gsheet','psych', 'tm', 'ggplot2','quantmod', 'data.table','car', 'VIM')
packages2 = c('lubridate','ISLR','amap','arules','arulesViz','forecast','rattle','rpart','rpart.plot','ts','zoo','twitterR','ROAuth','partykit','strucchange','didrooRFM','curl','syuzhet','stringr','RTextTools','e1071','wordcloud','caret','catools','olsrr')					

#Installation steps :  #one by change to packages1, package2, packages3
list.of.packages = packages1
new.packages = list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
new.packages
if(length(new.packages)) install.packages(new.packages)
#next set
list.of.packages = packages2
new.packages = list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
#if no installation takes place that means they have been installed or they are not available for the version of R you are working

# some packages have to be installed from other repositories
install.packages("CHAID",repos="http://R-Forge.R-project.org")
