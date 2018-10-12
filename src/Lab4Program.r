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
ggplot(data = datcali) + geom_point(mapping = aes(x = year, y = count/population)) + geom_vline(xintercept = 1965)

-----------------------------------------------------------------------------------------------------------------------

#Question 3.
  
dat_caliFocus <- filter(us_contagious_diseases, state == "California", 1980 > year & year > 1949)

dat_caliFocus$yearBlock[1960 > dat_caliFocus$year & dat_caliFocus$year > 1949] <- "1950's"
dat_caliFocus$yearBlock[1970 > dat_caliFocus$year & dat_caliFocus$year > 1959] <- "1960's"
dat_caliFocus$yearBlock[1980 > dat_caliFocus$year & dat_caliFocus$year > 1969] <- "1970's"

#Without the Square Root
ggplot(data = dat_caliFocus) + geom_bar(mapping = aes(x = state,y = count, fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90,hjust = 1, vjust=-0.01))

#Including the Square Root
ggplot(data = dat_caliFocus) + geom_bar(mapping = aes(x = state,y = sqrt(count), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90,hjust = 1, vjust=-0.01))


#Question 4.
dat_allstateFocus <- filter(us_contagious_diseases, between(year,1950,1979))

dat_allstateFocus$yearBlock[1960 > dat_allstateFocus$year & dat_stateFocus$year > 1949] <- "1950's"
dat_allstateFocus$yearBlock[1970 > dat_allstateFocus$year & dat_stateFocus$year > 1959] <- "1960's"
dat_allstateFocus$yearBlock[1980 > dat_allstateFocus$year & dat_stateFocus$year > 1969] <- "1970's"

#Plotting the points
ggplot(data = dat_allstateFocus) + geom_bar(mapping = aes(x = state,y = sqrt(count), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90,hjust = 1, vjust=-0.01))


-----------------------------------------------------------------------------------------------------------------------

  
#Question 5.
dat_allStateFocus <- mutate(dat_allStateFocus, per100000rate = ((count*100000)/population) * (weeks_reporting/52))

ggplot(data = dat_allStateFocus, mapping = aes(x = year, y = state)) + geom_tile(mapping = aes(fill = per100000rate, colour = "grey"))
  

#Question 6.
https://www.jpeds.com/article/S0022-3476(13)00144-3/pdf?ext=.pdf

This research paper provides detailed information on autism and vaccines supporting the fact that vaccines do not cause autism.





