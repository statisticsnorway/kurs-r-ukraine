# R introduction course
# Day 1


#### Exercise 1 ####


# a) What is the sum of 4499 and 35?
4499 + 35


# b) Find the help file for the function floor(). What is the answer to floor(2.48)
?floor
floor(2.48)


# c) Create an object which contains a string with the name of an oblast (region). Print the object to the console
oblast <- "Kyiv"
print(oblast)


# d) Run the following vector so that the object milk_price is in the environment. 
# Check it is listed in the "Environment" pane.
milk_price <- c(43.67, 45.0, 42.7)


# e) Create a vector with 3 strings with milk product names. Call this vector: product_names 
# For example: 'Yagotynske Pasteurized Milk', 'Novus Milk', and 'Galychyna Pasteurized Milk'
product_names <- c('Yagotynske Pasteurized Milk', 'Novus Milk', 'Galychyna Pasteurized Milk')


# e) Check the length of the vector you created in e), with the function length()
length(product_names)


# f) Print the 3rd element in the product_names vector using []
product_names[3]







#######################################################################################

#### Exercise 2 ####

# Use the milk_price and product_names vectors from exercise 1.

  
# a) Write a condition/test to see which elements in the milk_proice vector, are less than 43
milk_price < 43


# b) Write a test to see if the product_names vector contains the string 'Novus Milk'
'Novus Milk' %in% product_names


# c) Fetch the library tidyverse
#install.packages("tidyverse")
library(tidyverse)


# d) Open the data "employees.csv" without reading it in. 
#    What seperator does it use?
# Note: The data is in the data folder of the repository. It contains the number 
#    of employees in Ukraine by year in industry groups.
# Hint: Find the data under Files and click on it. Choose "View File"



# e) Read in the data "employees.csv"
# Hint: Remember to use " " around the path and file name.
employees <- read_csv2("./data/employees.csv")


# f) Look at the dataset. How many variables does it have?
glimpse(employees)


# g) What type of variable is Industry?
glimpse(employees)


# h) What is the smallest number of employees in any industry group in 2017?
summary(employees)
# 27

