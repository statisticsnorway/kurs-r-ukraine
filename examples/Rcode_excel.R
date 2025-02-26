library(openxlsx) # Package for working with excel

#### More on csv files ####
# Read in the labour force 
labourdata <- read_csv2("./data/labour_force.csv")

# Write this file as a csv
write_csv(labourdata, "./data/labour_force_new.csv")



#### Working with excel files ####
library(openxlsx) 
# https://cran.r-project.org/web/packages/openxlsx/vignettes/Introduction.html

# Read in an excel
labour_from_excel <- read.xlsx("./data/labour_data.xlsx")
labour_urban <- read.xlsx("./data/labour_data.xlsx", sheet = "urban_rural")


# Write to an excel file
year <- c(2018, 2019, 2020)
oblasts <- c("Kyiv", "Volyn", "Lviv")
oblast_data <- data.frame(year, oblasts)

write.xlsx(oblast_data, file = "./data/oblast_test.xlsx")


# Write to several sheets
excel_list <- list(test = oblast_data, labour = labour_from_excel)
write.xlsx(excel_list, file = "./data/oblast_test2.xlsx")
