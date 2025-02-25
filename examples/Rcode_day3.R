# R introduction example code
# DAY 3


#### Data validation ###
install.packages("validate")
library("validate")
library(tidyverse)


data(cars)
rules <- validator(speed >= 0
                   , dist >= 0
                   , speed/dist <= 1.5
                   )

out   <- confront(cars, rules)

summary(out)
plot(out)
violating(cars, out)
df_out <- as.data.frame(out)

list <- df_out %>% filter(value=="FALSE")  
list

data(SBS2000)

rules <- validator(
  is.character(size),
  is.numeric(turnover),
  !is.na(turnover),
  nchar(as.character(size)) >= 2,
  in_range(incl.prob, min=0, max=1),
  size %in% c("sc0","sc1","sc2","sc3")
)
out <- confront(SBS2000, rules)
summary(out)
plot(out)

#### Rule based imputation ###
install.packages("dcmodify")
library("dcmodify")

water <- data.frame(
     name        = c("Ross", "Robert", "Martin", "Brian", "Simon")
    , consumption = c(110, 105, 0.15, 95, -100) 
    )

water

rules <- modifier(
             if ( abs(consumption) <= 1 ) consumption <- 1000*consumption  ,
           if ( consumption < 0 ) consumption <- -1 * consumption ) 


out <- modify(water, rules)

out


#### Imputation ###

#Load data----
data(women)

women <- women %>% mutate(id =1:nrow(women), hoyde=round( height*2.54,1), vekt= round(weight*0.453592,1), 
                          kmi= round(vekt/(hoyde/100)^2,1),kmi_org= round(vekt/(hoyde/100)^2,1))
women$kmi[c(2,5,8, 9)] <- NA # Remove 4 values that we are going to impute


women <- women %>% mutate( imp=ifelse(is.na(kmi), 2, 1))

women

#install.packages("plotly")
library(plotly)
fig <- women %>% 
  plot_ly( x = ~hoyde, y= ~kmi,
           type ="scatter",mode ="markers",              
           hovertemplate = paste(     
             "%{yaxis.title.text}: %{y:}",
             "%{xaxis.title.text}: %{x:}",
             ""
           ) ) %>%
  layout(title = "Dataset Women", xaxis = list(title = "Height"),
         yaxis = list(title = "BMI") )
fig

# mean imputation
women_1 <-women %>% impute_proxy(kmi ~ mean(kmi, na.rm = TRUE)) 

fig <- women_1 %>% 
  plot_ly( x = ~hoyde, y= ~kmi,
           type ="scatter",mode ="markers",split = ~imp,             
           hovertemplate = paste(     
             "%{yaxis.title.text}: %{y:}",
             "%{xaxis.title.text}: %{x:}",
             ""
           ) ) %>%
  layout(title = "mean impute", xaxis = list(title = "Height"),
         yaxis = list(title = "BMI") , legend=list(title=list(text='Outlier:')))
fig

# Grouped mean
women <- women %>% mutate(gruppe=cut(women$hoyde, breaks = c(0, 155, 165, 175, 190),labels = c("gr1", "gr2", "gr3", "gr4")))
women_2 <- women %>% impute_proxy(kmi ~ mean(kmi, na.rm = TRUE)|gruppe)

vline <- function(x = 0, color = "red") {
  list(
    type = "line", 
    y0 = 0, 
    y1 = 1, 
    yref = "paper",
    x0 = x, 
    x1 = x, 
    line = list(color = color)
  )
}

fig2 <- women_2 %>% 
  plot_ly( x = ~hoyde, y= ~kmi,
           type ="scatter",mode ="markers",split = ~imp,             
           hovertemplate = paste(     
             "%{yaxis.title.text}: %{y:}",
             "%{xaxis.title.text}: %{x:}",
             ""
           ) ) %>%
  layout(title = "Mean impuitation in groups ", xaxis = list(title = "Heights"),
         yaxis = list(title = "BMI") , legend=list(title=list(text='Outlier:')),
         shapes= list(vline(155), vline(165), vline(175)))
fig2


# Regression imputation

women_4 <- women %>% impute_lm(kmi ~ hoyde ) 

fig4 <- women_4 %>% 
  plot_ly( x = ~hoyde, y= ~kmi,
           type ="scatter",mode ="markers",split = ~imp,             
           hovertemplate = paste(     
             "%{yaxis.title.text}: %{y:}",
             "%{xaxis.title.text}: %{x:}",
             ""
           ) ) %>%
  layout(title = "Regression impute", xaxis = list(title = "Height"),
         yaxis = list(title = "BMI") , legend=list(title=list(text='Outlier:')))



fig4





