###------------------
###Hypothesis Testing
###------------------

###Students Name: Neha Lad
###GNumber: G01169261

setwd("~/git/AIT580/")

rm(list=ls())

data <- read.csv(file.choose())
data

# Your hypothesis testings here...

Males <- which(data$Gender=='Male')
Females <- which(data$Gender=='Female')

#1. If the MonthlyIncome of Males is greater than Females (5 points)

t.test(data$MonthlyIncome[Males],data$MonthlyIncome[Females], alternative="greater", conf.level = 0.95)

#Result: Null Hypothesis. 

#a.The statistical analysis shows that, the p-value =0.8891 is greater than the 
#significance level of   0.05. (significant level = 1 - confidence level (0.95)) 
#b.  The range of 95 percent confidence interval is from -718.2378 to Infinity. which indicates that it does not contain 0 mean value. 
#c. Therefore, we support the null hypothesis and reject the alternative hypothesis.


#2. If the WorkLifeBalance of Males is less than Females (5 points)

t.test(data$WorkLifeBalance[Males],data$WorkLifeBalance[Females], alternative="less", conf.level = 0.95) 
#Answer:
#Result: Null Hypothesis. 
#a.The statistical analysis shows that, the p-value =0.4577 is greater than the significance level of   0.05. (significant level = 1 - confidence level (0.95)). 
#b.The range of 95 percent confidence interval is from - Infinity to 0.0570346. 
#c.Therefore, we support the null hypothesis and reject the alternative hypothesis. 

#3. If the YearsAtCompany of Single is less than Married (5 points)

Single <- which(data$MaritalStatus=='Single')
Married <- which(data$MaritalStatus=='Married')
t.test(data$YearsAtCompany[Single],data$YearsAtCompany[Married], alternative="less", conf.level = 0.95)
#Answer:
#Result: Alternative Hypothesis. 
#1.The statistical analysis shows that, the p-value =0.004973 is more overly less than the significance level of   0.05. (significant level = 1 - confidence level (0.95)). 
#2. The range of 95 percent confidence interval is from - Infinity to -0.3382453. 
#3. Therefore, from the test it's possible to support the alternative hypothesis and rejcet the null hypothesis

#4. If the EnvironmentalSatisfaction of Attrition=Yes is less than Attrition=No (5 points)

Yes<- which(data$Attrition=='Yes')
No <- which(data$Attrition=='No')
t.test(data$EnvironmentSatisfaction[Yes],data$EnvironmentSatisfaction[No], alternative="less", conf.level = 0.95)

#Answer:
#Result: Alternative Hypothesis. 
#a.The statistical analysis shows that, the p-value =0.0001046 is less than the significance level of   0.05. (significant level = 1 - confidence level (0.95)) 
#b.The range of 95 percent confidence interval is from Infinity to -0.172078. which indicates that it does not contain 0 mean value. 
#c.Therefore, we support to the alternative hypothesis and reject the null hypothesis. 

#5. If the MonthlyIncome of Manager is greater than Laboratory Technician (Hint: Use JobRole to find Manager and Laboratory Technician) (5 points)

Lab_Tech <- which(data$JobRole=='Laboratory Technician')
Manager <- which(data$JobRole=='Manager')
t.test(data$MonthlyIncome[Manager],data$MonthlyIncome[Lab_Tech], alternative="greater",var.equal=T, conf.level = 0.95)

#Result: Alternative Hypothesis. 
#a.The statistical analysis shows that, the p-value is less than 2.2e-16,which  is less  than the sign ificance level of   0.05. (significant level = 1 - confidence level (0.95)) 
#b.  The range of 95 percent confidence interval is from 13642.06 to Infinity.  
#c. Therefore, we support alternative hypothesis and reject the null hypothesis.

#6. If YearsAtCompany and DailyRate are correlated with each other (5 points)

summary(lm( YearsAtCompany ~ DailyRate, data=data))
#Result: this two variables are very very slightly corelated 
# or in other words they are not that correalted as the adjusted R square 
# value is 0.00047

#7. If YearsAtCompany and MonthlyIncome are correlated with each other (5 points)

summary(lm( YearsAtCompany ~ MonthlyIncome, data=data))

#Result: this two variables seems to be correlated with each
#other as the adjusted R square value is 0.264 i.e. approx 26%

#8. If YearsAtCompany varies depending on individual's MaritalStatus (5 points)

summary(aov(YearsAtCompany ~ MaritalStatus, data=data))
#Result:
#the p value is less than 0.05, and hence we can reject the null hypothesis
#i.e. looking at the f value we can say the mean of all the groups is not statistically same.
#9. If MonthlyIncome varies depending on individual's PerformanceRating (5 points)

summary(aov(MonthlyIncome ~ PerformanceRating, data=data))
#result: here the p value is greater than 0.05, hence we failed to reject the null hypothesis and this by looking at f value we can say variables have equal variances.

#10. If MonthlyIncome varies depending on individual's WorkLifeBalance (5 points)
summary(aov(MonthlyIncome ~ WorkLifeBalance, data=data))
#result: here the p value is greater than 0.05, hence we failed to reject the null, and by looking at the f value we can say varible have equal variance.