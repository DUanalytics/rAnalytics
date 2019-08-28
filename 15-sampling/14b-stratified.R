# Stratied Sampling

#Divide data set into groups/strata and select samples from each group

df=mtcars
#group var- cyl, vs, am, gear, carb


#dplyr
library(dplyr)
df %>%  group_by(am, gear) %>%  summarise(count=n())
df %>%  group_by(am, gear) %>%  sample_n(1)



#
library(splitstackshape)
df %>% group_by(am,vs) %>% summarise(count=n()) 
#select 2 from each group
set.seed(1)
#am=0,1; vs=0,1
(stratified(df, c("am", "vs"), 2))
#gear-3,4,5 ; am=0,1
df %>% group_by(gear,am) %>% summarise(count=n()) 
(stratified(df, c("gear", "am"), 1))


#
library(sampling)
summary(df)
names(df)
df %>% group_by(cyl,am) %>% summarise(count=n()) 
interaction(df$cyl, df$am)
levels(factor(df$cyl)); levels(factor(df$am))
#3 x 2 = 6 combinations : vector selecting size from each strat- size
strata(data= df, stratanames = c('cyl', 'am'), size=c(1,2,1,2,1,1), method='srswor')

