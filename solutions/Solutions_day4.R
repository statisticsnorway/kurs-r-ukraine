#### DAG 4: Exercise 7 ####

# Use the following vector ("oblast") for the exercises
oblast <- c("Vinnytsya", "Volyn", "Dnipropetrovsk", "Donetsk", "Zhytoyrm")


# 1) Extract element 2 and 3 from the vector, "oblast", using indexing
oblast[2:3]


# 2) Extract all elements in the vector  except index 2 ("Volyn")
oblast[-2]


# 3) Use the function "match()" to find which index "Donetsk" is in the vector
match("Donetsk", oblast)


# 4) Change the element "Donetsk" in the vector to "Zakarpattya"
oblast[4] <- "Zakarpattya"


# 5) Create a "list" containing the vector "oblast" (used previously) and the population counts for the oblasts
# population = c(1538331, 1028693, 3173339, 1208981, 1250958)
oblast_list <- list(oblast = oblast, 
                    population = c(1538331, 1028693, 3173339, 1208981, 1250958))


# 6) Extract/print the population vector from the list
oblast_list$population


# 7) Convert the list to a "tibble" dataset. 
library(tidyverse)
oblast_tib <- as_tibble(oblast_list)


# 8) Extract element in row 2 and column 1 of the "tibble" dataset.
oblast_tib[2, 1]













##############################################################################
# Day 4: Exercise 8
# Use the same "oblast" data from the previous part in this exercise
oblast_df <- tibble(
  oblast = c("Vinnytsya", "Volyn", "Dnipropetrovsk", "Zakarpattya", "Zhytoyrm"), 
  population = c(1538331, 1028693, 3173339, 1208981, 1250958))


# 1) Create a vector with 5 random numbers between 0 and 1. 
rand <- runif(5)


# 2) Sort the "oblast" dataset based on the random numbers in the previous question.
oblast_df[order(rand), ]


# 3) Write an "if" sentence to see if the oblast "Donetsk" is in the dataset
# If it is, print "Donetsk is in the dataset" 
# (If it isn't, you don't need to do anything)
if ("Donetsk" %in% oblast_df$oblast){
  print("Donetsk is in the dataset")
} 


# 4) Write an "if" sentence to see if any of the population number er more than 2 million
# Hint: use "any()" to determine if any in the vector return "TRUE" from the test 
if (any(oblast_df$population > 2000000)){
  print("Some oblasts are greater than 2 million")
}


# 5) Write a "for-loop" to loop through the rows in the dataset. 
# If the population size is greater than 2 million, print the name of the oblast and "is greater than 2 million".
# If the population size is less than 2 million, print the name of the oblast and "is less than 2 million".
for (i in 1:nrow(oblast_df)){
  if (oblast_df$population[i] > 2000000){
    print(paste(oblast_df$oblast[i], "is more than 2 million"))
  } else {
    print(paste(oblast_df$oblast[i], "is less than 2 million"))
  }
}

