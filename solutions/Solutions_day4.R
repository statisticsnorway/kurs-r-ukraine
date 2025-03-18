#------------------------------------------------------------------------#
#### Day 4: Conditions and loops ####
#------------------------------------------------------------------------#
library(tidyverse)

# Use the following data to answer the questions
price_df <- data.frame(
  coicop = c("01.1.6.1", "01.1.6.1", "01.1.6.1", "01.1.6.3", "01.1.6.3", "01.1.6.3"), 
  price_jan = c(10.0, 13.0, 14.5, 8.9, 9.0, 8.1),
  price_feb = c(10.0, 13.2, 14.5, 8.9, 9.5, 8.1),
  price_mar = c(10.2, 13.2, 15.0, 8.9, 9.9, 8.2)
  )

# 1) Write a condition statement to check if the price in March ('price_mar') is more than 10.

price_df$price_mar > 10
price_df %>% 
  select (price_mar) > 10


# 2) Use the ifelse() function to create a vector for if the March price is more than 10.

ifelse(price_df$price_mar > 10, 1, 0)
price_df %>% 
  mutate(ifelse(price_mar > 10, 1, 0))


# 3) Count the number of observations over 10 in March 
over10 <- ifelse(price_df$price_mar > 10, 1, 0)
sum(over10)

price_df %>% 
  mutate(over10 = ifelse(price_mar > 10, 1, 0)) %>%
  summarise(sum(over10))


# 4) Create a vector of the names of the price data variables in the data

price_vars <- c("price_jan", "price_feb", "price_mar")


# 5) Write a for-loop to loop through the three months of data and print the number of observations over 10
# Tips: Use the vector from 4 to loop through.

for (v in price_vars){
  vec <- price_df[, v]
  over10 <- ifelse(vec > 10, 1, 0)
  print(sum(over10))
}

for (v in price_vars) {
  over10 <- price_df %>% pull(v) > 10
  print(sum(over10))
}



# 6 (EXTRA) Write a new for-loop to loop through the two coicop groups. Use mean() to find the average price for March.

library(dplyr)

coicop_vec <- unique(price_df$coicop)

for (p in coicop_vec){
  mean_price <- price_df %>% 
    filter(coicop == p) %>%
    summarise(mean(price_mar))
  print(p)
  print(mean_price)
}




#------------------------------------------------------------------------#
#### Day 4: Functions ####
#------------------------------------------------------------------------#

# 1) Create a function with one input which is a vector (x). The function should return the mean of the vector

mean_func <- function(x){
  x_mean <- mean(x)
  x_mean
}


# 2) Check that the function works by calling it with the vector of prices for March.

mean_func(price_df$price_mar)


# 3) Create a new function with two vectors as inputs (x0 and x1). The function should return the chain Dutot index for the two vectors.
# Note: The Dutot index is the ratio of the arithmetic averages: mean of x1 divided by mean of x0

dutot_func <- function(x0, x1){
  mean(x1) / mean(x0)
}

# 4) Check the function using the earlier price data using january as the base year (x0) and March as the current year (x1)

dutot_func(price_df$price_jan, price_df$price_mar)

# 5) Add a boolean argument (na.rm) to determine if NA values should be removed before calculating the means.
# If the argument is TRUE, remove NAs in either x0 or x1.
# Test the function by adding a NA to the data: price_df$price_mar[4] <- NA

dutot_func <- function(x0, x1, na.rm) {
  if (na.rm) {
    x0 <- x0[!is.na(x0)]
    x1 <- na.omit(x1)
  }
  mean(x1) / mean(x0)
}

price_df$price_mar[4] <- NA
dutot_func(price_df$price_jan, price_df$price_mar, na.rm=TRUE)

# 6) Add a default value to the na.rm argument
dutot_func <- function(x0, x1, na.rm=TRUE) {
  if (na.rm) {
    x0 <- na.omit(x0)
    x1 <- na.omit(x1)
  }
  mean(x1) / mean(x0)
}
dutot_func(price_df$price_jan, price_df$price_mar)

# 7) Add a warning if a NA value is found in the x0 vector. 

dutot_func <- function(x0, x1, na.rm = TRUE) {
  if (any(is.na(x0)) || any(is.na(x1))) {
    warning("NA values found in input base vector")
  }
  
  if (na.rm) {
    x0 <- x0[!is.na(x0)]
    x1 <- na.omit(x1)
  }
  mean(x1) / mean(x0)
}
dutot_func(price_df$price_jan, price_df$price_mar)

# 8) (EXTRA) Write a for-loop to calculate the Dutot index for each coicop for March
coicop_vec <- unique(price_df$coicop)

for (p in coicop_vec){
  temp <- price_df %>% 
    filter(coicop == p)
  dutot_ind <- dutot_func(temp$price_jan, temp$price_mar)
  print(p)
  print(dutot_ind)
}

