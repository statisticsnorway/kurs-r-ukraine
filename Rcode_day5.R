# Example code for day 5
###############################################################################
#### Part 1 ####

#### Functions ####

# function with no parameter
urban <- function(){
  "urban"
}
urban()


# function one parameter
urban <- function(proportion){
  ifelse(proportion < 0.5, "rural", "urban")
}
urban(proportion = 0.44)
urban(proportion = 0.7)


# return last line (can also use return())
urban <- function(proportion){
  prop <- ifelse(proportion < 0.5, "rural", "urban")
  prop
}
urban(proportion = 0.44)


# function with two parameters
urban <- function(proportion, threshold){
  prop <- ifelse(proportion < threshold, "rural", "urban")
  prop
}
urban(proportion = 0.44, threshold = 0.55)
urban(0.44, 0.55)


# function with default value
urban <- function(proportion, threshold = 0.5){
  prop <- ifelse(proportion < threshold, "rural", "urban")
  prop
}
urban(proportion = 0.44)


# Control in function
urban <- function(proportion, threshold = 0.5){
  if (is.character(proportion)){
    stop("Input proportion must be a number")
  }
  if (proportion > 1) {
    warning("Input proportion is greater than one")
  }
  prop <- ifelse(proportion < threshold, "rural", "urban")
  prop
}
urban(proportion = 1.1)
urban(proportion = "city")

urban(proportion = c(1.1, 0.44))


# Input as a vector
urban <- function(proportion, threshold = 0.5){
  if (any(is.character(proportion))){
    stop("Input proportion must be a number")
  }
  if (any(proportion > 1)) {
    warning("Input proportion is greater than one")
  }
  prop <- ifelse(proportion < threshold, "rural", "urban")
  prop
}
urban(proportion = c(1.1, 0.44))


# Combine function with tidyverse
library(tidyverse)
labour_force <- read_csv2("./data/labour_force.csv")

labour_force_new <- labour_force %>%
  mutate(prop = urban/total,
         strata = urban(prop))






#### local vs global ####
x <- 2
x

fx <- function(){
  x <- 3
  x
}

x
fx()
x

