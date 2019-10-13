###--------------------------------------
#Student Name:Neha Lad
#GNumber:G01169261
###--------------------------------------

rm(list=ls())

data <- read.csv(file.choose(), header=T)
head(data)
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
less <- table(data$TotalWorkingYears<='5')/nrow(data)
less<-less*100
print(less)
more<- table(data$TotalWorkingYears >'5')/nrow(data)
more<-more*100
print(more)

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
Male_dataf<-data[(data$Gender=='Male'),]
print(Male_dataf)

print(mean(Male_dataf$EnvironmentSatisfaction))
print(median(Male_dataf$EnvironmentSatisfaction))
print(mode(Male_dataf$EnvironmentSatisfaction))
print(sd(Male_dataf$EnvironmentSatisfaction))
freq_dmale <- table(Male_dataf$EnvironmentSatisfaction)
print(freq_dmale)

Female_dataf1<-data[(data$Gender=='Female'),]
print(Female_dataf1)
print(mean(Female_dataf1$EnvironmentSatisfaction))
print(median(Female_dataf1$EnvironmentSatisfaction))
print(mode(Female_dataf1$EnvironmentSatisfaction))
print(sd(Female_dataf1$EnvironmentSatisfaction))

freq_dfemale <- table(Female_dataf1$EnvironmentSatisfaction)
print(freq_dfemale)

#=====================================================
#part:2
#Use Acme.csv and write R code to find the following:
#=====================================================

install.packages("ggplot2")
library(ggplot2)
install.packages("tidyverse")

acme_dataset <- read.csv(file.choose(),header=T)
acme_dataset
#1.Identify data types for each attribute in the dataset
str(acme_dataset)


#2.Produce a summary statistics for each attribute in the dataset
summary(acme_dataset)
#summary statistics for Years
summary(acme_dataset$Years)
mean(acme_dataset$Years)
median(acme_dataset$Years)
mode(acme_dataset$Years)
sd(acme_dataset$Years)
#summary statistics for StSalary
summary(acme_dataset$StSalary)
mean(acme_dataset$StSalary)
median(acme_dataset$StSalary)
mode(acme_dataset$StSalary)
mode(acme_dataset$StSalary)
sd(acme_dataset$StSalary)
#summary statistics for Gender
summary(acme_dataset$Gender)


#summary statistics for Degree
summary(acme_dataset$Degree)


#3.Produce visualizations for each attribute
#Histogram for Years
hist(acme_dataset$Years,main="Histogram for Years", xlab="Years",border="black",col="blue")
#Histogram for StSalary
hist(acme_dataset$StSalary,main="Histogram for Salary", xlab="Stsalary",border="black",col="blue")
# Gender
counts_Gender <- table(acme_dataset$Gender)
counts_Gender
barplot(counts_Gender, main="Gender", 
        names.arg=c("Female", "Male"))

#Degree
counts_Degree <- table(acme_dataset$Degree)
counts_Degree
barplot(counts_Degree, main="Degree", 
        names.arg=c("BS", "MS","PhD"))

#4. Display the relationship between

#a. Years of Experience and Starting Salary for all employees (5 points)

ggplot(acme_dataset,aes(x=Years, y=StSalary, color="Employee"))+
  geom_point()+
  labs(x="Years of experience", y="StSalary", title="Scatter Plot for Employee")

#b. Years of Experience and Starting Salary for each gender (5 points)

ggplot(acme_dataset,aes(x=Years, y=StSalary, color=Gender))+
  geom_point()+
  labs(x="Years", y="StSalary", title=" Scatter Plot for  Gender")

#c. Years of Experience and Starting Salary for each degree
ggplot(acme_dataset,aes(x=Years, y=StSalary, color=Degree))+
  geom_point()+
  labs(x="Years", y="StSalary", title="Scatter Plot for  Degree")


# Find the correlation between Starting Salary and Years of Experience?

cor.test(~Years + StSalary,  data = acme_dataset,alternative="two.sided")$estimate

#a.1. For male Employee
cor.test(~ Years + StSalary, data = acme_dataset, subset=(Gender=="M"),alternative="two.sided")$estimate
#a.2.for Female Employee
cor.test(~ Years + StSalary, alternative="two.sided", data = acme_dataset, subset=(Gender=="F"))$estimate
#Answer: Yes, the correlation value seems to be different for
#male and female.

#b.1. for BS Degree
cor.test(~ Years + StSalary,data = acme_dataset, subset=(Degree=="BS"), alternative="two.sided")$estimate
#b.2. for MS Degree
cor.test(~ Years + StSalary, data = acme_dataset, subset=(Degree=="MS"),alternative="two.sided")$estimate
#c.3. for PhD Degree
cor.test(~ Years + StSalary,data = acme_dataset, subset=(Degree=="PhD"), alternative="two.sided" )$estimate

#Answer:The corelation value for MS and PHD degree seems to be approximately the same,
#however its different for BS degree.
#6. What can you conclude about Acme with respect to gender bias after your overall analysis? (5
#points)
#The dataset name Acme, has emplyee dataset. The attributes for
#of dataset are  year, monthly salary, gender and degree. As per the given
#dataset, the examined values for a female employee are 18 and Male are 28. From these values,
#we can conclude that Male employee no is more in Job field. As per the correlation
#relationship, correlation between Male and Female depicts how strong the linear relationship
#between job experience and salary. The Correlation between Starting Salary and Years of
#Experience for Female Employee is 0.75 and for Male Employee is 0.67 from theses value We can
#conclude that female's are strongly correlated in terms of experience and starting salary as compared 
#to males.