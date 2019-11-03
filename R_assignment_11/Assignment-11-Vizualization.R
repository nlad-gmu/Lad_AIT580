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
ggplot(data, aes(x=Age)) + geom_histogram(binwidth=1,color="darkblue", fill="lightblue")
#2. Create Scatter Plot for Age and Monthly Income using R
ggplot(data, aes(x=Age, y=MonthlyIncome)) + geom_point(color="blue")
