#new Twitter
#Learning Business Analytics  #businessanalytics   using R  @R_Programming  at @IIMBodhGaya  with @curtisakshay  by @henryharvin_in 

# load twitter library - the rtweet library is recommended now over twitteR
pacman::p_load(rtweet, ggplot2, dplyr, tidytext)

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
#check token
get_token()
#search will Returns Twitter statuses matching a user provided search query. ONLY RETURNS DATA FROM THE PAST 6-9 DAYS. To return more than 18,000 statuses in a single call, set "retryonratelimit" to TRUE.
#DelhiPolls2020
searchString1 = '#DelhiElection'   # change this to see others eg analytics...
## search for 50 tweets using the #sirmaur hashtag
tweets1 <- search_tweets(q = searchString1, n = 50)
# view the first 3 rows of the dataframe
head(tweets1[1:5], n = 3)
tail(tweets1[1:5], n = 3)
tweets1$text
names(tweets1)  #variable names
tweets1$text  #tweet
tweets1[1]
#https://twitter.com/hashtag/sirmaur?lang=en   #see tweets here

# find recent tweets but ignore retweets 
tweets1B <- search_tweets(searchString1, n = 50, include_rts = FALSE)
# view top 2 rows of data
head(tweets1B[1:5], n = 2)

#screen name : who tweeted
head(tweets1B$screen_name)
unique(tweets1B$screen_name)
tweets1B[1, 'text']
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
search_tweets(q="kanikatiwari8", n=100, include_rts = T)

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
#
## search for 10,000 tweets sent from the US
rt <- search_tweets(  "lang:en", geocode = lookup_coords("usa"), n = 10000)

## create lat/lng variables using all available tweet and profile geo-location data
rt <- lat_lng(rt)

## plot state boundaries
par(mar = c(0, 0, 0, 0))
maps::map("state", lwd = .25)

## plot lat and lng points onto state map
with(rt, points(lng, lat, pch = 20, cex = .75, col = rgb(0, .3, .7, .75)))

#----
## random sample for 30 seconds (default)
rt <- stream_tweets("",timeout=30)
rt
summary(rt)
rt$text
## stream tweets from london for 60 seconds
rt <- stream_tweets(lookup_coords("london, uk"), timeout = 60)
#needs api key... which may be on payment mode

#----
## stream london tweets for a week (60 secs x 60 mins * 24 hours *  7 days)
stream_tweets(  "realdonaldtrump,trump",  timeout = 10,  file_name = "tweetsabouttrump.json",  parse = FALSE
)

## read in the data as a tidy tbl data frame
djt <- parse_stream("tweetsabouttrump.json")
djt
djt$text
## get user IDs of accounts followed by CNN
cnn_fds <- get_friends("cnn")
get_friends('dupadhyaya')
## lookup data on those accounts
cnn_fds_data <- lookup_users(cnn_fds$user_id)
lookup_users(get_friends('dupadhyaya')$user_id)
# get user IDs of accounts following CNN
cnn_flw <- get_followers("cnn", n = 75)
get_followers("dupadhyaya", n = 100)


## lookup data on those accounts
cnn_flw_data <- lookup_users(cnn_flw$user_id)
lookup_users(get_friends('dupadhyaya')$user_id)
## how many total follows does cnn have?
cnn <- lookup_users("cnn")

## get them all (this would take a little over 5 days)
#cnn_flw <- get_followers(   "cnn", n = cnn$followers_count, retryonratelimit = TRUE)

# get user IDs of accounts followed by CNN
tmls <- get_timelines(c("cnn", "BBCWorld", "foxnews"), n = 10)

## plot the frequency of tweets for each user over time
tmls %>%  dplyr::filter(created_at > "2019-10-29") %>%
  dplyr::group_by(screen_name) %>%
  ts_plot("days", trim = 1L) +
  ggplot2::geom_point() +
  ggplot2::theme_minimal() +
  ggplot2::theme(
    legend.title = ggplot2::element_blank(),
    legend.position = "bottom",
    plot.title = ggplot2::element_text(face = "bold")) +
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "Frequency of Twitter statuses posted by news organization",
    subtitle = "Twitter status (tweet) counts aggregated by day from October/November 2017",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )

#Get the 30 most recently favorited statuses by JK Rowling.

jkr <- get_favorites("jk_rowling", n = 30)
jkr
#Search for 10 users with the rstats hashtag in their profile bios.

## search for users with #rstats in their profiles
usrs <- search_users("#rstats", n = 100)
usrs
#Posting (tweeting from R console) or reading direct messages require additional permissions
#If you’d like to post Twitter statuses, follow or unfollow accounts, and/or read your direct messages, you’ll need to create your own Twitter app
#To create your own Twitter app, follow the instructions in the authorization vignette on obtaining and using access tokens
#https://rtweet.info/articles/auth.html