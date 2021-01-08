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
