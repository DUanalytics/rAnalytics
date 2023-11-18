#dttr2
#https://cran.r-project.org/web/packages/dttr2/dttr2.pdf
library(dttr2)

chk::chk_identical(Sys.time(), "UTC")

chk_time(hms::as_hms("10:00:10"))
try(chk_time(1))

dtt_add_units(as.Date("1999-12-31"), units="days",n=2)

dtt_adjust_tz(as.POSIXct("1970-01-01", tz = "Etc/GMT+8"), tz = "UTC")

dtt_aggregate(as.Date(c("1992-01-01", "1991-02-02", "1991-03-03")), "years")

dtt_complete(as.Date(c(x="2002-01-01", from="2001-01-03", to="2001-01-01")))

dtt_date(1L)
dtt_date(-1)
dtt_date("2000-01-01")
as.Date(as.POSIXct("2019-05-01", tz = "Etc/GMT-8"))
dtt_date(as.POSIXct("2019-05-01", tz = "Etc/GMT-8"))
dtt_date(hms::as_hms("23:59:59"))
dtt_date(hms::as_hms("24:00:00"))
dtt_date_from_ints(year = 1972L, month = 1L, day = 1L)

dtt_days_in_month(as.Date(c("2000-02-11", "2001-02-01")))

dtt_excel_to_date(42370)
