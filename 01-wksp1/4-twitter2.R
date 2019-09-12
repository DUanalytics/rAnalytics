
#https://cran.r-project.org/web/packages/rtweet/vignettes/intro.html
#https://rtweet.info/
#https://www.rdocumentation.org/packages/rtweet/versions/0.4.0
#https://rud.is/books/21-recipes/
#https://rud.is/books/21-recipes/harvesting-tweets.html

library(rtweet)
library(dplyr)


#Two methods of authentical - Browser and Access Token
## autheticate via web browser
## install httpuv if not already
if (!requireNamespace("httpuv", quietly = TRUE)) {
  install.packages("httpuv")
}
twitter_token <- create_token(
  app = "DUrtweet",
  consumer_key = "0glwhLXXAahrusA3Dxvhou82M",
  consumer_secret = "bItULC8KINiNFIWcMBDekO6IztIoHeQ8yD6STqxbvIBxRCePZx")

rt1 <- search_tweets("business analytics", n = 100, token = twitter_token)
rt1
rtweet::write_as_csv(rt1, 'E:/data/tweets1.csv')

get_followers(user= 'dupadhyaya', n = 100, page = "-1", parse = TRUE, token =twitter_token)
get_friends(user= 'dupadhyaya', page = "-1", parse = TRUE, token =twitter_token)
duT = get_timeline(user= 'dupadhyaya', n = 200, max_id = NULL, home = FALSE, parse = TRUE,check = TRUE, usr = TRUE, token =twitter_token )
duT
users_data(duT)
duT[1,]$source

# lookup vector of 1 or more user_id or screen_name
users = c('rahulg_IITK', 'Saurabh84522682', 'Dharmes13753606','dupadhyaya', 'narendramodi', 'imvirat', 'iimahmedabad', 'rahulgandhi')

usr_df <- lookup_users(users)
usr_df
as.data.frame(usr_df)
# view tweet data for these users via tweets_data()
tweets_data(usr_df)

users2 <- c('imvirat')
usr_df2 <- lookup_users(users2)
usr_df2
# view tweet data for these users via tweets_data()
tweets_data(usr_df2)

#get_mentions: Get mentions for the authenticating user.
dugt = get_mentions()
dugt
get_mentions(n = 200, since_id = NULL, max_id = NULL, parse = TRUE, token = NULL)

tweets_with_users(rt)
su = search_users('businessanalytics',n=100, parse=F)
head(su)
users_with_tweets(su)

#get_collections-----
viratT = get_collections(user ='iamvirat', status_id = NULL, n = 200, cursor = NULL, parse = TRUE, token = NULL)

str(viratT)
personid='dupadhyaya'
personid='imVkohli'

## get user IDs of accounts followed by CNN
du_fds <- get_friends(personid)
du_fds
## lookup data on those accounts
du_fds_data <- lookup_users(du_fds$user_id)
du_fds_data
rtweet::write_as_csv(du_fds_data, 'E:/data/tweets2.csv')




## check to see if the token is loaded
identical(twitter_token, get_token())  #not working
#-----------------------------
#Access token/secret method
create_token(
  app = "DUrtweet",
  consumer_key = "0glwhLXXAahrusA3Dxvhou82M",
  consumer_secret = "bItULC8KINiNFIWcMBDekO6IztIoHeQ8yD6STqxbvIBxRCePZx",
  access_token = "14366551-KKd2B8pb5as86RKNf6sgULoM2aoL1JxspMzstXH8h",
  access_secret = "6s3lIn4YtppBLnj9H4xsHvtXWAHeywTfaqcwmfBWfWcO5")

## check to see if the token is loaded
identical(twitter_token, get_token())  #not working



## search for 18000 tweets using the rstats hashtag
rt <- search_tweets(
  "#rstats", n = 180000, include_rts = FALSE
)
#----
rt

#-----
## plot time series of tweets
ts_plot(rt, "3 hours") +
  ggplot2::theme_minimal() +
  ggplot2::theme(plot.title = ggplot2::element_text(face = "bold")) +
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "Frequency of #rstats Twitter statuses from past 9 days",
    subtitle = "Twitter status (tweet) counts aggregated using three-hour intervals",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )

#-----
## search for 250,000 tweets containing the word data
rt <- search_tweets(
  "data", n = 2500, retryonratelimit = TRUE
)

#-----
## search for 10,000 tweets sent from the US
rt <- search_tweets(
  "lang:en", geocode = lookup_coords("usa"), n = 10
)

## create lat/lng variables using all available tweet and profile geo-location data
rt <- lat_lng(rt)

## plot state boundaries
par(mar = c(0, 0, 0, 0))
maps::map("state", lwd = .25)

## plot lat and lng points onto state map
with(rt, points(lng, lat, pch = 20, cex = .75, col = rgb(0, .3, .7, .75)))


#------
## random sample for 30 seconds (default)
rt <- stream_tweets("")

#------
## stream tweets from london for 60 seconds
rt <- stream_tweets(lookup_coords("london, uk"), timeout = 60)


#------
## stream london tweets for a week (60 secs x 60 mins * 24 hours *  7 days)
stream_tweets(
  "realdonaldtrump,trump",
  timeout = 60 * 60 * 24 * 7,
  file_name = "tweetsabouttrump.json",
  parse = FALSE
)

## read in the data as a tidy tbl data frame
djt <- parse_stream("tweetsabouttrump.json")

#------
## get user IDs of accounts followed by CNN
cnn_fds <- get_friends("cnn")

## lookup data on those accounts
cnn_fds_data <- lookup_users(cnn_fds$user_id)

#------
## get user IDs of accounts following CNN
cnn_flw <- get_followers("cnn", n = 75000)

## lookup data on those accounts
cnn_flw_data <- lookup_users(cnn_flw$user_id)

#----
## how many total follows does cnn have?
cnn <- lookup_users("cnn")

## get them all (this would take a little over 5 days)
cnn_flw <- get_followers(
  "cnn", n = cnn$followers_count, retryonratelimit = TRUE)

#-----
## get user IDs of accounts followed by CNN
tmls <- get_timelines(c("cnn", "BBCWorld", "foxnews"), n = 3200)

## plot the frequency of tweets for each user over time
tmls %>%
  dplyr::filter(created_at > "2017-10-29") %>%
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

#------
jkr <- get_favorites("jk_rowling", n = 3000)


#------
## search for users with #rstats in their profiles
usrs <- search_users("#rstats", n = 1000)



#-----
#trends
sf <- get_trends("san francisco")


#-----
## quick overview of rtweet functions
vignette("auth", package = "rtweet")

#----
## quick overview of rtweet functions
vignette("intro", package = "rtweet")

#------
## working with the stream
vignette("stream", package = "rtweet")


#-------
## working with the stream
vignette("FAQ", package = "rtweet")

  




neilfws <- get_timeline("neilfws", n = 100)
neilfws %>%
  glimpse()