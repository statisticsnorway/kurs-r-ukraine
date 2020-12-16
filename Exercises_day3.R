# Solutions to tasks on day 3

#### Exercise 5 ####


# a) Read the dataset "population.csv" into R and remove the row for Ukraine (total)




# b) Draw a random sample of 5 counties and set a seed first




# c) Make a new variable that indicates if the county/oblast is mainly urban or rural




# d) Draw a random sample of 2 counties in both urban and rural counties




# e) Read in the dataset "employees.csv" (in the data folder)




# f) Set up two rules that the number of employee in 2017 should not be less than 30 and not greater than 1000
# HINT: use install.packages("validate") to install (one time only)




# g) Confront the data with the rules




# h) Analyse the results




# i) Write some more rules and confront the data with the rules and analyse the results 










##################################################################################
#### Exercise 6 ####
# Use the employees dataset for the following exercises

# a) Set up a rules based correction than all observation for 2017 less than 30 should be missing data (NA)
# HINT: use install.packages("dcmodify") before calling the package with library




# b) Modify the employees data from exercise 5 with this rule.




# c) plot year2017 against year2016




# d) Impute the missing data with a linear model (lm) and look at the results
# HINT: use install.packages("simputation") one time to install the package


  
  
# e) impute the missing data with predictive mean matching (pmm)
# Use first help function to see how to set the parameter (?impute_pmm)





# END