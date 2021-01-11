# R introduction example code
# DAY 3


#### Sampling ####
library(tidyverse)

sampling_frame <- read_csv("./data/population.csv")

sampling_frame <- read_csv("./data/population.csv") %>%
  filter(region != "Ukraine")
View(sample_frame)


#simple random sample
mysample <- sampling_frame %>%
  sample_n(3)

sample_n(sampling_frame, 3)
mysample



# set the seed
set.seed(-1199)
sampling_frame %>%
  sample_n(3)
sampling_frame %>%
  sample_n(3)


# stratified sample
sampling_frame <- sampling_frame %>% 
  mutate(perc_urban = urban/total,
         urban_strata = ifelse(perc_urban >=.5, 1, 0))

sample <- sampling_frame %>%
  group_by(urban_strata) %>%
  sample_n(2)
sample


# Random number2
runif(1)
runif(10)



