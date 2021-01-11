# Example code for day 4
###############################################################################
#### Part 1 ####

#### Vectors and indexing ####
age <- c(39, 62, 15, 5, 39)

age * 2
age < 20
39 %in% age

# indexing
age[2]
age[c(1,3)]
age[1:3]

seq(1, 5)
seq(1, 5, by = 2)
age[seq(1,5, by = 2)]

# All objects are vectors
city <- "Kyiv"
city[1]
city[2]

# Change an element
age[1]
age[1] <- 37
age[1]

age[1:2] <- c(30, 31)
age[1:2] <- 30

# match
match(5, age)
match(c(5, 30), age)


#### list ####
oblast_list <- list(oblast = c("Kyiv", "Volyn", "Sumy"), 
                     average_age = c(35.8, 40.3, 41.5),
                     level = "oblast")

# Take out an element
oblast_list$oblast
oblast_list$oblast[2]


#### dataset ####
oblast_dataset <- data.frame(oblast = c("Kyiv", "Volyn", "Sumy"),
                             population = c(1775265,1028693,1066055),
                             labour_force = c(820000, 426000, 533000))

# look at a variable
oblast_dataset$population

# look at an element
oblast_datasetpopulation[1]

# dataset functions
nrow(oblast_dataset)
ncol(oblast_dataset)

# tibble dataset
library(tidyverse)
as_tibble(oblast_dataset)








################################################################################
#### Part 2 ####

#### Sort and order ####
# Sorting
age <- c(39, 62, 15, 5, 39)
sort(age)

# order
order(age)
order(age, decreasing = T)

# Sorting with match
id <- 1:5
order_wanted <- c(2,4,3,5,1)

# Join with match run example
# Create data
n <- 50000
dataA <- data.frame(ID = 1:n, x = runif(n))
dataB <- data.frame(ID = 1:n, y = runif(n))
dataB <- dataB[order(runif(n)),]

# Run time for join
s <- Sys.time()
koblet <- full_join(dataA, dataB, by = "ID")
Sys.time() - s

# Run time for match with index
s <- Sys.time()
m <- match(dataA$ID, dataB$ID)
dataA$y <- dataB$y[m]
Sys.time() - s



#######################################################################
# Part 2


#### if and else ####
if (any(age < 20)){
  print("The vector contains children/young adults")
}


if (any(age < 20)){
  print("The vector contains children/young adults")
} else {
  print("The vector contains only adults")
}


#### for loops ####
for (i in 1:5){
  print("This is a loop")
}

for (i in 1:5){
  print(i)
}

for (i in 1:5){
  print(age[i])
}

for (i in age){
  print(i)
}


#### while loops ####
n <- 1
n
while (n < 10){
  print(n)
  n <- n + 1
}
n

# not a specific number of repititions
n <- 1
while (n < 10){
  print(n)
  n <- n + runif(1)
}
n
