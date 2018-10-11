# Name:
# Date:

# Run the below only if the library is not already installed.
# install.packages(dslabs)

library(dslabs)
library(dplyr)
library(tidyverse)
data(us_contagious_diseases)

#Question 1.
#Creates an object 'dat' that consists of only the Measles data and removes Alaska and Hawaii
dat <- filter(us_contagious_diseases, disease == "Measles", state != "Alaska" & state != "Hawaii")

#Computes the value for the per100000rate by setting the function
per100000rate <- dat$count * 100000 / dat$population * dat$weeks_reporting / 52

#The function represented in the column
$per100000rate <- per100000rate

-----------------------------------------------------------------------------------------------------------------------

#Question 2.
#Creating a new object 'datcali' to include data only from California
datcali <- filter(dat, state == 'California')

#Plotting the points in the graph
ggplot(data = datc) + geom_point(mapping = aes(x = year, y = count/population)) + geom_vline(xintercept = 1965)

-----------------------------------------------------------------------------------------------------------------------

#Question 3.
  
dat_caliFocus <- filter(us_contagious_diseases, state == "California", 1980 > year & year > 1949)

dat_caliFocus$yearBlock[1960 > dat_caliFocus$year & dat_caliFocus$year > 1949] <- "1950's"
dat_caliFocus$yearBlock[1970 > dat_caliFocus$year & dat_caliFocus$year > 1959] <- "1960's"
dat_caliFocus$yearBlock[1980 > dat_caliFocus$year & dat_caliFocus$year > 1969] <- "1970's"


#Question 4.
dat_stateFocus <- filter(us_contagious_diseases, between(year,1950,1979))

dat_allstate$yearBlock[1960 > dat_stateFocus$year & dat_stateFocus$year > 1949] <- "1950's"
dat_allstate$yearBlock[1970 > dat_stateFocus$year & dat_stateFocus$year > 1959] <- "1960's"
dat_allstate$yearBlock[1980 > dat_stateFocus$year & dat_stateFocus$year > 1969] <- "1970's"

WORK ON PLOTTING



-----------------------------------------------------------------------------------------------------------------------

#Question 5.
dat_new <- dat_stateFocus %>% 
ggplot(data = dat_new) + geom_tile(mapping = aes(x = state, y = year, fill = count^(1/2)),colour = "grey50", position = "dodge", stat = "identity") 
  
  

#Question 6.






