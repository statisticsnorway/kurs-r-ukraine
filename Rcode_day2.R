# Example code for R Introduction course - DAY 1

#### Create new variables ####
library(tidyverse)

# Read in labour force data
labourdata <- read_csv2("./data/labour_force.csv")
glimpse(labourdata)

# Create a new variable (Number of 15-29 year olds in labour force)
labourdata %>%
  mutate(age15_29 = age15_24 + age25_29)
glimpse(labourdata)

labourdata <- labourdata %>%
  mutate(age15_29 = age15_24 + age25_29)
glimpse(labourdata)

# Percent labour force in population
labourdata <- labourdata %>%
  mutate(labour_perc = age15_70/total * 1000)

# Create a new variable using ifelse
labourdata <- labourdata %>%
  mutate(region_type = ifelse(region == "Ukraine", "national", "oblast"),
         region_type = ifelse(region == "Kyiv_city", "city", region_type))
View(labourdata)




#### Select rows ####
# Look at data for the whole country
labourdata %>%
  filter(region == "Ukraine")

# Look at regions Kyiv and Volyn
labourdata %>%
  filter(region %in% c("Kyiv", "Volyn"))

# Look at data for oblast with labour force more than 1.5 million (but exclude Ukraine total)
labourdata %>%
  filter(labour_force > 1500, region_type == "oblast")






#### Select som variables/rows ####
labourdata %>%
  select(region, age15_70)

labourdata %>%
  filter(labour_force < 500, region_type == "oblast") %>%
  select(region, age15_24)



#### Summary ####
labourdata %>%
  summarise(labour_force_average = mean(age15_70))

labourdata %>%
  filter(region_type == "oblast") %>%
  summarise(oblast_average = mean(age15_70))

# labour force as percentage of total population
labourdata %>%
  filter(region_type == "oblast") %>%
  summarise(oblast_average = mean(labour_perc))

# How many oblasts in data?
labourdata %>%
  filter(region_type == "oblast") %>%
  summarise(count = n())
  


#### Gruppering ####
labourdata %>%
  group_by(region_type) %>%
  summarise(average_labour_force = mean(age15_70))

# create variable for urban/rural
labourdata <- labourdata %>% 
  mutate(perc_urban = urban/total,
         urban_strata = ifelse(perc_urban >=.5, "urban", "rural"))

# create table for number urban by region type
labourdata %>%
  group_by(region_type, urban_strata) %>%
  summarise(antall = n()) 

labourdata %>%
  group_by(region_type, urban_strata) %>%
  summarise(antall = n()) 

labourdata %>%
  group_by(region_type, urban_strata) %>%
  summarise(antall = n()) %>%
  spread(urban_strata, antall)






###########################################################################################
# DAY 2: Part 2

#### Join/merge datasets ####
oblasts <- read_csv2("./data/oblasts.csv")

# rename oblasts to region
oblasts <- oblasts %>%
  rename(region = oblasts)

# Join datasets: keep all in the left/first dataset
labourdata <- left_join(labourdata, oblasts)
View(labourdata)



#### Bar plot ####
labourdata %>% ggplot(aes(urban_strata)) + 
  geom_bar()

# number in labour force by urban/rural
labourdata %>%
  ggplot(aes(x = urban_strata, y = labour_force)) +
  geom_bar(stat = "identity")

# filter for oblasts
labourdata %>%
  filter(region_type == "oblast") %>%
  ggplot(aes(x = urban_strata, y = labour_force)) +
  geom_bar(stat = "identity") #+
  #scale_y_continuous(labels = scales::comma)

# Filter for Kyiv, Volyn, Ternopil and Rivne and colour
labourdata %>%
  filter(region_type == "oblast", 
         region %in% c("Kyiv", "Volyn", "Ternopil", "Rivne")) %>%
  ggplot(aes(x = urban_strata, y = labour_force, fill = region)) +
  geom_bar(stat = "identity")

# add axis names
labourdata %>%
  filter(region_type == "oblast", 
         region %in% c("Kyiv", "Volyn","Ternopil", "Rivne")) %>%
  ggplot(aes(x = urban_strata, y = labour_force, fill = region)) +
  geom_bar(stat = "identity") + 
  xlab("urban/rural oblast") + 
  ylab("Number in labour force (1000's')")


labourdata %>%
  filter(region_type == "oblast", 
         region %in% c("Kyiv", "Volyn","Ternopil", "Rivne")) %>%
  ggplot(aes(x = urban_strata, y = labour_force, fill = region)) +
  geom_bar(stat = "identity", position = "dodge") + 
  xlab("urban/rural oblast") + 
  ylab("Number in labour force (1000's')")




#### Scatter plot ####
labourdata %>%
  ggplot(aes(x = labour_force, y = age15_24)) + 
  geom_point()

# filter for oblasts
labourdata %>%
  filter(region_type == "oblast") %>%
  ggplot(aes(x = labour_force, y = age15_24)) + 
  geom_point()

# Add regression line
labourdata %>%
  filter(region_type == "oblast") %>%
  ggplot(aes(x = labour_force, y = age15_24)) + 
  geom_point() + 
  geom_smooth(method = "lm")

# colour by urban/rural
labourdata %>%
  filter(region_type == "oblast") %>%
  ggplot(aes(x = labour_force, y = age15_24)) + 
  geom_point(aes(color = urban_strata))




#### Save plot ####
png(file = "labour_force_youth.png")

labourdata %>%
  filter(region_type == "oblast") %>%
  ggplot(aes(x = labour_force, y = age15_24)) + 
  geom_point(aes(color = urban_strata))

dev.off()




#### Export to excel ####
library(openxlsx)
write.xlsx(labourdata, file = "labour_data.xlsx")

