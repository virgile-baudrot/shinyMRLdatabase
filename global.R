library(lubridate)

df1 <- data.frame(
  soil = 1:55,
  species = "plant",
  element = rep(c("Cu","Cd","N","Fe","K"), each = 11),
  value = rnorm(55, 105,32),
  date = ymd("2013-01-31")
)

df2 <- data.frame(
  soil = 1:10,
  species = "plant",
  element = rep(c("Cu","Cd","N","Fe","K"), each = 2),
  value = rnorm(10, 10,2),
  date = ymd("2013-01-31")
)
