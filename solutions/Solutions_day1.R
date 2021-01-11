# R introduction course
# Day 1


#### Exercise 1 ####


# a) What is the sum of 4499 and 35?
4499 + 35


# b) Find the help file for the function sqrt(). What does it do?
?sqrt


# c) What does the function floor() do? What is the answer to floor(2.48)
?floor
floor(2.48)


# d) Create an object which contains a string with the name of an oblast (region). Print the object to the console (Run)
oblast <- "Kyiv"
oblast

# e) Paste the oblast object together with a new string, for example "is a nice place"
paste(oblast, "is a nice place")


# f) Create a vector with 3 different numbers (integers). Call this vector: employees
employees <- c(3, 20, 14)


# g) Find the help file for the function length()
?length


# h) Check the length of the vector, employees, with the function length()
length(employees)









#######################################################################################

#### Exercise 2 ####

# Use the following vector for exercise 2a-b (or the one you created in the previous exercise)
employees <- c(3, 20, 14)
  
# a) Write a condition/test to see which elements in the vector, "employees", are less than 5
employees < 5


# b) Write a test to see if the vector, "employees", contains the number 9
9 %in% employees


# c) Fetch the library tidyverse
#install.packages("tidyverse")
library(tidyverse)



# d) Open the dataset "employees.csv" without reading it in. 
#    What seperator does it use?
# Note: The dataset is in the data folder of the repository. It contains the number 
#    of employees in Ukraine by year in industry groups.
# Hint: Find the dataset under Files and click on it. Choose "View File"



# e) Read in the dataset "employees.csv"
# Hint: Remember to use " " around the path and file name.
employees <- read_csv2("./data/employees.csv")


# f) Look at the dataset. How many variables does it have?
glimpse(employees)


# g) What type of variable is Industry?
glimpse(employees)


# h) What is the smallest number of employees in any industry group in 2017?
summary(employees)
# 27

