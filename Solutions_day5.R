#### DAG 5: Exercise 9 ####

# 1) Create a function with one (numeric) input parameter.
# Let the function return "high" if the input value is over 100 or low otherwise
status <- function(num){
  ifelse(num > 100, "high", "low")
}


# 2) Call and test the function by using the inputs 70 and 120. 
# Does the function work when the input is a vector? (eg. "c(70, 120))
status(70)
status(120)
status(c(70, 120))


# 3) Add a second parameter to the function which will be the threshold for "low and "high". 
# Use this value instead of 100 to determine the return value
status <- function(num, threshold){
  ifelse(num > threshold, "high", "low")
}
status(90, threshold = 80)


# 4) Add a default value to the threshold parameter. Set it to 120.
# Check the function works by calling it with some different values
status <- function(num, threshold = 120){
  ifelse(num > threshold, "high", "low")
}
status(130)
status(110)


# 5) Add control in the function to give a warning message if the input is a negative number.
# Does your function work with a vector input still?
status <- function(num, threshold = 120){
  if (any(num < 0)){
    warning("the input number is a negative")
  }
  ifelse(num > threshold, "high", "low")
}
status(80)
status(-2)
status(c(-2, 70))


# 6) Read the dataset "employees.csv" into R (located in the "data" folder)
library(tidyverse)
employees <- read_csv2("./data/employees.csv")


# 7) Create a new variable in the "employees" dataset using the function in 5). 
# Base the new variable on the number of employees in 2017. 
employees_new <- employees %>%
  mutate(industry_size = status(year2017))
  







#######################################################################