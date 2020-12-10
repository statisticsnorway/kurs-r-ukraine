# Solutions to tasks on day 3

#### Exercise 5 ####

#### Sampling ####
# a) Read the dataset population into R and remove the row for Ukraine (total)
library(tidyverse)
popdata <- read_csv("./data/population.csv")
oblastdata <- popdata %>%
  filter(region != "Ukraine")

# b) Draw a random sample of 5 counties and set a seed first
set.seed(45323)
oblastdata %>%
  sample_n(5)


# c) Make a new variable that indicates if the county/oblast is mainly urban or rural
oblastdata <- oblastdata %>% 
  mutate(perc_urban = urban/total,
         urban_strata = ifelse(perc_urban >=.4, 1, 0))


# d) Draw a random sample of 2 counties in both urban and rural counties
oblastdata %>%
  group_by(urban_strata) %>%
  sample_n(2)


# e) Read in the dataset "employees.csv" (in the data folder)
employees <- read_csv2("./data/employees.csv")


# f) Set up two rules that the number of employee in 2017 should not be less than 30 and not greater than 1000
# HINT: use install.packages("validate") to install (one time only)
library(validate)
v <- validator(year2017 >=30, year2017 <= 1000)


# g) Confront the data with the rules
cf <- confront(employees, v)


# h) Analyse the results
summary(cf)
plot(cf)


# i) Write some more rules and confront the data with the rules and analyse the results 
v <- validator(year2016 >= 30, 
               abs(year2017-year2016)/year2017 < 0.1)
               
cf <- confront(employees, v)              
summary(cf)
plot(cf)






##################################################################################
#### Exercise 6 ####
# Use the employees dataset for the following exercises

# a) Set up a rules based correction than all observation for 2017 less than 30 should be missing data (NA)
# HINT: use install.packages("dcmodify") bedore calling the package with library
library(dcmodify)
m <- modifier(if (year2017 < 30) year2017 <- NA)


# b) Modify the employees data from exercise 5 with this rule.
employees_new <- modify(employees, m)
employees_new


# c) plot year2017 against year2016
employees_new %>%
  filter(SIC != "00") %>%
  ggplot(aes(x = year2016, y = year2017)) + 
  geom_point()


# d) Impute the missing data with a linear model (lm) and look at the results
# HINT: use install.packages("simputation") one time to install the package
library(simputation)

employees_lm <- impute_lm(employees_new, year2017 ~ year2016)
View(employees_lm)

employees_lm %>%
  filter(SIC != "00") %>%
  ggplot(aes(x = year2016, y = year2017)) + 
  geom_point()
  
  
# e) impute the missing data with predictive mean matching (pmm)
# Use first help function to see how to set the parameter (?impute_pmm)
employees_pmm <- impute_pmm(employees_new, year2017 ~ year2016)
View(employees_pmm)
