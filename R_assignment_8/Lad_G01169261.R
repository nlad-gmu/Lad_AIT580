###--------------------------------------
#Student Name:Neha Lad
#GNumber:G01169261
###--------------------------------------

rm(list=ls())

data <- read.csv('C:/Users/Neha/Desktop/AIT_580/Assignment/data/EmployeeAttrition.csv')

# this is just for testing to use "print" statement.
print(data[1,])



# a. Find the number of rows and columns in the dataset (5 points)
print(nrow(data))
print(ncol(data))

# b. Find the maximum Age in the dataset (5 points)
print(max(data$Age))

# c. Find the minimum DailyRate in the dataset (5 points)
print(min(data$DailyRate))

# d. Find the average/mean MontlyIncome in the dataset (5 points)
print(mean(data$MonthlyIncome))

# e. How many employees rated WorkLifeBalance as 1 (5 points)
count<-length(which(data$WorkLifeBalance==1))
print(count)

# f. What percent of total employees have TotalWorkingYears less than equal to 5? Also calculate the percentage for TotalWorkingYears greater than 5 (5 points)


# g. Print EmployeeNumber, Department and MaritalStatus for those employees whose Attrition is Yes and RelationshipSatisfaction is 1 and YearsSinceLastPromotion is greater than 3 (10 points)
installed.packages("dpylr")
library(dplyr)

  Filt_Data<-filter( data,Attrition=="Yes", RelationshipSatisfaction==1 , YearsSinceLastPromotion>3)
Sel_data<-select(Filt_Data,EmployeeNumber,Department,MaritalStatus)
print(Sel_data)
# h. Find the mean, median, mode, standard deviation 
#and frequency distribution of EnvironmentSatisfaction 
#for males and females separately. 
#(Hint: For frequency distribution use table() function (10 points)
 
