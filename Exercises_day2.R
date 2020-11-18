# Exercises for R introduction
# DAY 2

#### Exercise 3 ####
# a) Read in dataset  inn "employees.csv" (in the data folder)




# b) Create a new variable for the difference in employee numbers between 2017 and 2018





# c) The dataset contains a mix of levels for industry codes (SIC). 
# Create a new variable for the SIC level. You can use "national" for national, 
# "main" for the main letter categories and "subdivision" for the 2 digit calssifications.
# or you are welcome to choose your own labels.
# HINT: use nchar() to count the number of digits in SIC




# d) Create a new dataset (with a new name) including only rows for the main industry groups.
# Use select() to only save the variables SIC and the difference between 2016 and 2017
# Which main industry group had the largest decrease in the number of employee?





# e) Use filter to see how many employees there were in Ukraine in Real estate activities
# HINT: This is SIC group L
# HINT: Since this is a string variable you need quotes around the value being tested ("L")




# f) What is the total number of employees in the groups Industry and Construction for year 2017
# Hint: Industry is SIC D and construction in SIC F




# g) How many main industry groups are mentioned in the dataset?
# HINT: use filter() and summarise() with n()









##################################################################################
#### Exercise 4 ####

# a) Read in the dataset "wages.csv"
# This dataset contains average montly wages for 2017 (wages2017) and percent increase in wages from 2016 to 2017 (perc)




# b) change the variable "year2017" in wages to "wages2017"




# c) Join/merge the average wages for 2017 to the employees dataset
# HINT: Use the SIC variables as the key for joining but check if they are the same name in both datasets.




# d) Create a bar plot for the number of employees for 2017 in the main SIC groups
# Hint: filter for the main groups first then use ggplot() with aes() and geom_bar()





# e) Give the plot some better axes names





# f) create a scatter plot for average wages and number of employees
# Can you see any relation?






# The following transforms the data to "long format" where year is now one variable
employees_long <- employees %>% gather(year, employees, 3:9)

#g) Use the new data to create a line plot for the SIC groups: Industry (D) and Construction(F)

# Hint: filter the SIC groups first
# Hint: use + geom_line()
# Hint: use group = SIC inside aes() to create one line for each SIC



  
# h) If you haven't already add different colors to the lines
# Hint: use aes(color = ... ) inside geom_line 





