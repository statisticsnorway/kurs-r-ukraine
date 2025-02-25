# Solutions to tasks on day 3

#### Exercise 5 ####


install.packages("validate")
library("validate")
library(tidyverse)

# a )Load the retailers dataset from the validate package using data("retailers").
data("retailers")


# b) Set up 3 rules for the variable "profit" with the function validator: 
#     1) profit is numeric
#     2) profit is not missing
#     3) profit is a positive value

rules <- validator(
  is.numeric(profit),
  !is.na(profit),
  profit>0)

# c) Run the rules on the dataset "retailers"

out <- confront(retailers, rules)

# d) check the results with summary and plot

summary(out)
plot(out)


#### Exercise 6 ####

install.packages("dcmodify")
library("dcmodify")



# a)Create a modifier that: 
#    (1) sets other.rev to zero if it is missing, 
#    (2) replaces negative other.rev with the absolute value.

rules <- modifier(
  if (is.na(other.rev)) other.rev <- 0, 
  if ( other.rev <0) other.rev <- abs(other.rev))
  


# b) Modify the data retailers with the rules

out_re <- modify(retailers, rules)


# c) check the results after the modifications
view(out_re)


# d) Install the package simputation, it takes some time

install.packages('simputation')
library("simputation")

# e)  Find number of missing in the variable total.rev in  dataset retailers

retailers %>% summarise(miss=sum(is.na(total.rev)) )

# f)Plot turnover against total.rev and add regression line (geom_smooth(method = "lm"))

retailers %>%
  ggplot(aes(x = turnover, y = total.rev)) + 
  geom_point() +
  geom_smooth(method = "lm")

#  g) Do a linear regression of total.rev (y) against turnover (x) 
# Hint: reg <-lm(data= retailers, total.rev ~ turnover)
# Hint: summary(reg)

# h) Use regression to impute missing values in total.rev
output <- impute_lm(retailers, total.rev ~ turnover)

# i) check the results




