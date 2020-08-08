#packages install

#Total Avl Packages
nrow(available.packages()) #C
#16000

#install r tools

install.packages('pacman')

#Function
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}



#  package lists
pkg1 = c('dplyr','plyr', 'data.table','xlsx', 'Hmisc','rJava','ggplot2','lattice','gsheet','curl','stringr', 'syuzhet','e10171', 'catools','caret', 'olsrr' ,'swirl','sqldf','XML','VIM', 'outliers','car','MASS','DMwR','rvest')
ipak(pkg1)

#timeseries
pkg2 = c('forecast','rpart', 'rpart.plot', 'partykit','strucchange', 'didrooRFM')
ipak(pkg2)

pkg3 = c('zoo', 'astsa','lubridate','timeSeries','tseries','xts')
ipak(pkg3)

#association rules
pkg4 = c('arules' , 'arulesViz')
ipak(pkg4)


#textmining
pkg5 = c('twitterR','ROAuth','RGtk2','RTextTools','wordcloud', 'wordcloud2', 'NLP','tm')
ipak(pkg5)

#git packages
install.packages("CHAID", repos="http://R-Forge.R-project.org")

#processmining
pkg6 = c('bupar', 'bupaR', 'edeaR', 'processmapR', 'processanimateR', 'processcheckR', 'eventdataR', 'xesreadR', 'propro', 'petrinetR', 'daqapo', 'heuristicminR', 'pm4py') 
ipak(pkg6)

#devtools::install_github("bupaverse/processmapR")
pkg6b = c('bupaverse/processmapR','bupaverse/logbuildR', 'bupaverse/docker', 'bupaverse/bupaR', 'gertjanssenswillen/petrinetR')
devtools::install_github(pkg6b)
devtools::install_github("gertjanssenswillen/petrinetR")
