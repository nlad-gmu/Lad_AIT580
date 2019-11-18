###------------------
###Regression and Clustering
###------------------
###Students Name:Neha Lad
###GNumber:G01169261

rm(list=ls())
install.packages("ggplot2")
library(ggplot2)

data <- read.csv(file.choose(),header=T)
data

#Regression

#a. Show the scatter plot with relationship curve between TotalWorkingYears and
#MonthlyIncome. Briefly explain your observation in the plot (Hint: Use scatter.smooth()
#function in R) (5 points) 	
scatter.smooth(data$TotalWorkingYears, data$MonthlyIncome, span = 0.3, degree = 1,lpars = list(col = "red", lwd = 3, lty = 3))
#Answer:
#Here we have plot Total Working hours against Monthly Icome.
# Its seems that as the totalworking hours increases Monthly income also increases
#hence, they seems to be positively correlated with each other.

#b. Show the scatter plot with relationship curve between Age and DistanceFromHome.
#Briefly explain your observation in the plot (Hint: Use scatter.smooth() function in R) (5points)

scatter.smooth(data$Age, data$DistanceFromHome, span=0.3, lpars = list(col = "red", lwd = 3, lty = 3))
#here we have plotted age against Distance from Home. 
# Both variables are not moving in the same disrection  i.e. it seems to
#be difficult to conclude either increase or decrease in the values of variables.
#they seem to be stable, therefore there is no clear relationship between variables.
#however, the correlation value is -0.00168612, hence it appears to slightly negative.


#c. Calculate	Correlation	for	(a)	and	(b) and	explain	the	values	to	support	your	answer	in	(a)	and	(b)

#1.Correlation	for	(a)
cor(data$TotalWorkingYears, data$MonthlyIncome)
#2.Correlation	for	(b)
cor(data$Age, data$DistanceFromHome)
#The correlation value of a and b are 0.7728932 and -0.0016 respectively, 
#0.77value is more likely closer to the vale +1 which is highly 
#corelated and -0.001 which is negative, so both variables are not corelated 
#to each other as explained in Q. a) and b).

#d. Using Linear Regression, find details of the relationship 
#between TotalWorkingYears and MonthlyIncome. 
#Explain results in terms of p-value at 95% confidence interval and
#determine whether the relationship is significant or not (Hint: Use lm() to create linear
# regression model. Use print() to show coefficients. Use summary() to show more details)
linear_regression<-lm(TotalWorkingYears~MonthlyIncome,data)
print(linear_regression)
summary(linear_regression)

#as shown in the output, intercept is 2.97 and the coefficient 
#for middle income is 0.0012. this equation indicates that the 
#monthly income will increasr by 0.0012 for every 1% increase in totalworkingyears.

#In the summary, there is a close relationship between confidence intervals and significance
#tests. From this result, significantly different from 0 at the 0.05 level, then the 95% confidence
#interval will not contain 0. here, p the value is less than 2.2e-1. The relationship is statistically
#significant as from the p-value its less than 0.

#2. Clustering

#a. Use K-means Clustering algorithm to find groups between HourlyRate and
#TotalWorkingYears. Use number of clusters as 3. Explain how each group is different
#from another in terms of employees representing those groups. (10 points)


data2 <- as.data.frame(cbind(data$HourlyRate,data$TotalWorkingYears))
K_cluster<-kmeans(data2,3)
K_cluster$cluster <- as.factor(K_cluster$cluster)
K_cluster
ggplot(data,aes(HourlyRate,TotalWorkingYears, color = K_cluster$cluster )) + geom_point()

#there are 3 clusters in this plot. the first clustur shows te first grouping, where the hourly rate 
#ranges between 1 to 60 and shows the no of working hours n this range. similarly cluster 2
#ranges from 60 to 80 and thrd cluster ranges from 80 to 100.

#b. Use number of clusters as 5. What did you observe? Did you see any split of groups
#observed in (a)? Observe the splitting groups and explain in terms of employees
#representing those groups. (Hint: Use kmeans() for clustering algorithm. Install
#ggplot2 library in R and use ggplot() function to visualize the clustering results)
#(10 points)
K_cluster2<-kmeans(data2,5)
K_cluter3<-K_cluster2$cluster
ggplot(data,aes(HourlyRate,TotalWorkingYears, color = K_cluter3 )) + geom_point()

#here there are 5 clusters. 
#It classifies Employee total working year in multiple groups of their working Hourly rate, such that total working year
#within the same cluster as high intra-class similarity, whereas total working years from different
#clusters are as low inter-class similarity. In k-means clustering, each cluster is represented by its
#centroid. there are 5 cluster where hourly rate is
#grouping by 10 to 50, 50 to 70 , 70 to 75 , 7 to 100 and also its clustering the total working year
#from 10 years 30 of employee.
