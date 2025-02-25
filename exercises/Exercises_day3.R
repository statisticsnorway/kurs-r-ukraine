
#### Exercise 5 ####


install.packages("validate")
library("validate")
library(tidyverse)

# a )Load the retailers dataset from the validate package using data("retailers").



# b) Set up 3 rules for the variable "profit" with the function validator: 
#     1) profit is numeric
#     2) profit is not missing
#     3) profit is a positive value



# c) Run the rules on the dataset "retailers"



# d) check the results with summary and plot




#### Exercise 6 ####

install.packages("dcmodify")
library("dcmodify")



# a)Create a modifier that: 
#    (1) sets other.rev to zero if it is missing, 
#    (2) replaces negative other.rev with the absolute value.





# b) Modify the data retailers with the rules




# c) check the results after the modifications



# d) Install the package simputation, it takes some time



# e)  Find number of missing in the variable total.rev in  dataset retailers



# f)Plot turnover against total.rev and add regression line (geom_smooth(method = "lm"))



#  g) Do a linear regression of total.rev (y) against turnover (x) 
# Hint: reg <-lm(data= retailers, total.rev ~ turnover)
# Hint: summary(reg)

# h) Use regression to impute missing values in total.rev


# i) check the results


