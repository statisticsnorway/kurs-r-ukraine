# R introduction example code
# DAY 3


#### Sampling ####
popdata <- read_csv("./data/population.csv")
sampling_frame <- popdata %>%
  filter(region != "Ukraine")

#simple random sample
sampling_frame %>%
  sample_n(3)

# set the seed
set.seed(35622)
sampling_frame %>%
  sample_n(3)


# stratified sample
sampling_frame <- sampling_frame %>% 
  mutate(perc_urban = urban/total,
         urban_strata = ifelse(perc_urban >=.5, 1, 0))

sample <- sampling_frame %>%
  group_by(urban_strata) %>%
  sample_n(3)

# Random number2
runif(1)
runif(10)






#### Imputation ####


