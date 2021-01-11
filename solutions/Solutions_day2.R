# Exercises for R introduction
# DAY 2

#### Exercise 3 ####
# a) Read in the dataset "employees.csv" (in the data folder)
#install.packages("tidyverse")
library(tidyverse)
employees <- read_csv2("./data/employees.csv")


# b) Create a new variable for the difference in employee numbers between 2017 and 2016
employees <- employees %>%
  mutate(y2016_2017 = year2017-year2016)
glimpse(employees)



# c) The dataset contains a mix of levels for industry codes (SIC). 
# Create a new variable for the SIC level. You can use "national" for national, 
# "main" for the main letter categories and "subdivision" for the 2 digit classifications.
# or you are welcome to choose your own labels.
# HINT: use nchar() to count the number of digits in SIC
employees <- employees %>%
  mutate(level = ifelse(nchar(SIC) == 1, "main", "subdivision"),
         level = ifelse(Industry == "Total", "national", level))
View(employees)


# d) Create a new dataset (with a new name) including only rows for the main industry groups.
# Use select() to only save the variables SIC and the difference between 2016 and 2017
# Which main industry group had the largest decrease in the number of employees?
main_SIC <- employees %>%
  filter(level == "main") %>%
  select(SIC, y2016_2017)
View(main_SIC)


# e) Use filter to see how many employees there were in Ukraine in Real estate activities
# HINT: This is SIC group L
# HINT: Since this is a string variable you need quotes around the value being tested ("L")
employees %>%
  filter(SIC == "L")



# f) What is the total number of employees in the groups Industry and Construction for year 2017
# Hint: Industry is SIC D and construction in SIC F
employees %>%
  filter(SIC %in% c("D", "F")) %>%
  summarise(total_employees = sum(year2017))


# g) How many main industry groups are mentioned in the dataset?
# HINT: use filter() and summarise() with n()
employees %>%
  filter(level == "main") %>%
  summarise(number_groups = n())

nrow(main_SIC)





##################################################################################
#### Exercise 4 ####

# a) Read in the dataset "wages.csv"
# This dataset contains average montly wages for 2017 (wages2017) and percent increase in wages from 2016 to 2017 (perc)
wages <- read_csv2("./data/wages.csv")

# b) change the variable "year2017" in wages to "wages2017"
wages <- wages %>%
  rename(wages2017 = year2017)

# c) Join/merge the average wages for 2017 to the employees dataset
# HINT: Use the SIC variables as the key for joining but check if they are the same name in both datasets.
employees <- left_join(employees, wages, by = c("SIC"="sic"))


# d) Create a bar plot for the number of employees for 2017 in the main SIC groups
# Hint: filter for the main groups first then use ggplot() with aes() and geom_bar()
employees %>%
  filter(level == "main") %>%
  ggplot(aes(x = SIC, y = year2017)) +
  geom_bar(stat = "identity")


# e) Give the plot some better axes names
employees %>%
  filter(level == "main") %>%
  ggplot(aes(x = SIC, y = year2017)) +
  geom_bar(stat = "identity") + 
  xlab("Standard industry code") +
  ylab("number of employees (1000's)")


# f) create a scatter plot for average wages and number of employees
# Can you see any relation?
employees %>%
  filter(level == "main") %>%
  ggplot(aes(x = year2017, y = wages2017)) + 
  geom_point() + 
  xlab("employees (1000's) ") + 
  ylab("wages")


# g) The following transforms the data to "long format" where year is now one variable
employees_long <- employees %>% gather(year, employees, 3:9)


# Use the new data to create a line plot for the SIC groups: Industry (D) and Construction(F)
# Hint: filter the SIC groups first
# Hint: use + geom_line()
# Hint: use group = SIC inside aes() to create one line for each SIC
employees_long %>%
  filter(SIC %in% c("D", "F")) %>%
  ggplot(aes(x = year, y = employees, group = SIC)) + 
  geom_line()

  
# h) If you haven't already add different colors to the lines
# Hint: use aes(color = ... ) inside geom_line 
employees_long %>%
  filter(SIC %in% c("D", "F")) %>%
  ggplot(aes(x = year, y = employees, group = SIC)) + 
  geom_line(aes(color = SIC))


