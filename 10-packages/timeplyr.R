# time dplyr
#https://cran.r-project.org/web/packages/timeplyr/timeplyr.pdf

library(timeplyr)
library(dplyr)
library(nycflights13)
library(lubridate)
flights

flights %>%
  fdistinct(dest) %>%
  farrange(desc(dest))


# Create a calendar for the current year
from <- floor_date(today(), unit = "year")
from
to <- ceiling_date(today(), unit = "year", change_on_boundary = TRUE) - days(1)
to
my_seq <- time_seq(from, to, time_by = "day")
calendar(my_seq)

flights %>%  duplicate_rows()

# Duplicate flights with the same tail number and departure time
flights %>%  duplicate_rows(tailnum, dep_time)


iris %>%  fcount()
iris %>%  fadd_count(name = "count") %>%   fslice_head(n = 10)

# Sorted by group
starwars %>%  fcount(hair_color)
