###------------------
###Visualization
###------------------

###Students Name:Neha Lad
###GNumber:G01169261


rm(list=ls())

data <- read.csv(file.choose())
install.packages("ggplot2")
library(ggplot2)
#1. Create Histogram for Age using R (10 points)
print(ggplot(data, aes(x=Age)) + geom_histogram(binwidth=1,color="darkblue", fill="lightblue"))

#The histogram gives information about number of employees those falling under the age range 20 to 60.
#This is a Symmetric distribution, as the distribution forms an approximate same with
#respect to the center of the distribution.
#In this histogram, the smallest observation of the number of employees falls under two
#different ranges first one is 20-30 and 50-60.
#As the center of the distribution is represented a typical value, the average age of the maximum number of employee is between the range of 30 to 40.
#Here, histogram does not represent a distribution with a probable outlier.

#2. Create Scatter Plot for Age and Monthly Income using R
print(ggplot(data, aes(x=Age, y=MonthlyIncome)) + geom_point(color="blue"))

#This scatterplot shows a strong, positive, linear association between age of the #employee and Monthly Income of employee. 

#thus it depicts a strong relationship between these two variables

#Also, the pattern of scattering is constant for both the age and Monthly income.
