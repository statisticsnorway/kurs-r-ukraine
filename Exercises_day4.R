#### DAG 4: Exercise 7 ####

# Use the following vector ("oblast") for the exercises
oblast <- c("Vinnytsya", "Volyn", "Dnipropetrovsk", "Donetsk", "Zhytoyrm")


# 1) Extract element 2 and 3 from the vector, "oblast", using indexing



# 2) Extract all elements in the vector  except index 2 ("Volyn")



# 3) Use the function "match()" to find which index "Donetsk" is in the vector



# 4) Change the element "Donetsk" in the vector to "Zakarpattya"



# 5) Create a "list" containing the vector "oblast" (used previously) and the population counts for the oblasts
# population = c(1538331, 1028693, 3173339, 1208981, 1250958)



# 6) Extract/print the population vector from the list



# 7) Convert the list to a "tibble" dataset. 



# 8) Extract element in row 2 and column 1 of the "tibble" dataset.














##############################################################################
# Day 4: Exercise 8
# Use the same "oblast" data from the previous part in this exercise
oblast_df <- tibble(
  oblast = c("Vinnytsya", "Volyn", "Dnipropetrovsk", "Zakarpattya", "Zhytoyrm"), 
  population = c(1538331, 1028693, 3173339, 1208981, 1250958))


# 1) Create a vector with 5 random numbers between 0 and 1. 



# 2) Sort the "oblast" dataset based on the random numbers in the previous question.



# 3) Write an "if" sentence to see if the oblast "Donetsk" is in the dataset
# If it is, print "Donetsk is in the dataset" 
# (If it isn't, you don't need to do anything)


 


# 4) Write an "if" sentence to see if any of the population number er more than 2 million
# Hint: use "any()" to determine if any in the vector return "TRUE" from the test 





# 5) Write a "for-loop" to loop through the rows in the dataset. 
# If the population size is greater than 2 million, print the name of the oblast and "is greater than 2 million".
# If the population size is less than 2 million, print the name of the oblast and "is less than 2 million".




