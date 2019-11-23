
# load twitter library - the rtweet library is recommended now over twitteR
library(rtweet)
# plotting and pipes - tidyverse!
library(ggplot2)
library(dplyr)
# text mining library
library(tidytext)

# whatever name you assigned to your created app
appname <- "DUtwitterProject"

#keys
consumerKey="sDToDBULOI4wokzrVEiHPEi7o"
consumerSecret="w3sjSpmUOh9JglcHth9gCNB2ur4MElgVbL0ayhXBNWyFDIyAWf"
AccessToken="14366551-3sCiFAUo8Gj72FaxzQ0kWGG4NFvI0BxWAXUbpYT9l"
AccessTokenSecret="mZf2xtm2Y0O0vj8KSUpD09TccYb6ul6CnrbNKzdbkWZwh"

# create token named "twitter_token"
twitter_token <- create_token(
  app = appname,
  consumer_key = consumerKey,
  consumer_secret = consumerSecret,
  access_token = AccessToken,
  access_secret = AccessTokenSecret)

#search will Returns Twitter statuses matching a user provided search query. ONLY RETURNS DATA FROM THE PAST 6-9 DAYS. To return more than 18,000 statuses in a single call, set "retryonratelimit" to TRUE.

searchString1 = '#sirmaur'   # change this to see others eg analytics...
## search for 50 tweets using the #sirmaur hashtag
tweets1 <- search_tweets(q = searchString1, n = 50)
# view the first 3 rows of the dataframe
head(tweets1[1:5], n = 3)
names(tweets1)  #variable names
tweets1$text  #tweet
#https://twitter.com/hashtag/sirmaur?lang=en   #see tweets here

# find recent tweets but ignore retweets 
tweets1B <- search_tweets(searchString1, n = 50, include_rts = FALSE)
# view top 2 rows of data
head(tweets1B[1:5], n = 2)

#screen name : who tweeted
head(tweets1B$screen_name)
unique(tweets1B$screen_name)

# who are the users tweeting with searchString
users1 <- search_users(searchString1, n = 20)
users1[1:5]

# how many locations are represented
length(unique(users$location))
## [1] 311

users1 %>%  ggplot(aes(location)) + geom_bar() + coord_flip() +  labs(x = "Count",   y = "Location",  title = "Twitter users - unique locations ")

#show in order of count : top 5
users1 %>%   count(location, sort = TRUE) %>%   mutate(location = reorder(location, n)) %>%   top_n(5, wt=n) %>%   ggplot(aes(x = location, y = n)) + geom_col() +   coord_flip() +   labs(x = "Count",   y = "Location", title = "Where Twitter users are from - unique locations ")
#since some rows are same value, they will have same rank, hence more than 5 may be displayed

#remove any rows with missing locations and then plot
users1 %>% count(location, sort = TRUE) %>% mutate(location = reorder(location,n)) %>%   na.omit() %>%   top_n(5) %>%   ggplot(aes(x = location,y = n)) +
  geom_col() +   coord_flip() +   labs(x = "Location",  y = "Count",       title = "Twitter users - unique locations ")
#------------ 

#@IIM_Sirmaur
searchString2 = 'IIM_Sirmaur'   # change this to see others
## search for tweets using the searchString hashtag
tweets2 <- search_tweets(q = searchString2, n = 50, retryonratelimit = T)
# view the first 3 rows of the dataframe
head(tweets2[1:5], n = 3)

searchString3 = 'dupadhyaya'  #change it your twitter id
tweets3 <- search_tweets(q = searchString3, n=100, retryonratelimit = T)
tweets3  #there may be no data


searchString4 = "businessanalytics"
tweets4 <- search_tweets(searchString4, n=50,lang="en")
head(tweets4[1:5])


## perform search for lots of tweets
rt <- search_tweets( "trump OR president OR potus", n = 100, retryonratelimit = TRUE)
## plot time series of tweets frequency
head(rt)
summary(rt$created_at)  #all for one day
ts_plot(rt, by = "mins")

#multiple searches
ds <- Map("search_tweets",  c("\"data science\"", "rstats OR python"),  n = 1000)
## bind by row whilst preserving users data
ds <- do_call_rbind(ds)
ds[,1:5]
dim(ds)  #approx 2000 rows, 90 columns 
ts_plot(ds, by = "days")

#https://rtweet.info/
#https://cran.r-project.org/web/packages/rtweet/rtweet.pdf
#https://www.earthdatascience.org/courses/earth-analytics/get-data-using-apis/use-twitter-api-r/
?search_tweets  
  
