library(dlookr) # for exploratory data analysis and imputation
library(visdat)      # for visualizing NAs
library(plotly)      # for interactive visualization
library(missRanger)  # to generate and impute NAs
library(tidyverse)
library(VIM)
library(dlookr)# for exploratory data analysis and imputation
plot_na_pareto(sleep, only_na = TRUE)
view(sleep)


data(sleep, package = "VIM")
summary(sleep)

plot_na_intersect(sleep)

library(visdat)      # for visualizing NAs
library(plotly)   # for interactive visualization

vis_miss(sleep) %>% ggplotly()
sum(is.na(sleep))
#more NAs with missRanger package
library(missRanger)
set.seed(111)
sleep_NA <- generateNA(sleep)
sum(is.na(sleep_NA))
# check out NAs
plot_na_pareto(sleep_NA)
plot_na_intersect(sleep_NA)

blip <- imputate_na(sleep_NA, NonD, Dream, method = "mean")
plot(blip)
bla <- imputate_na(sleep_NA, NonD, Dream, method = "rpart")
summary(bla)

plot(bla)

blah <- imputate_na(sleep_NA, NonD, Dream, method = "mice", seed = 111)
plot(blah)

sleep_imputet <- missRanger(
  sleep_NA, 
  formula = . ~ . ,
  num.trees = 1000, 
  verbose = 1, seed = 111)


# numeric imputation
ggplot()+
  geom_point(data = sleep_imputet, aes(NonD, BrainWgt), 
             color = "red")+
  geom_point(data = sleep_NA, aes(NonD, BrainWgt))+
  theme_minimal()

ggplot()+
  geom_point(data = sleep_imputet, aes(Span, Gest), 
             color = "red")+
  geom_point(data = sleep_NA, aes(Span, Gest))+
  theme_minimal()
#categorical imputation is not possible since this data contains no categorical variables

