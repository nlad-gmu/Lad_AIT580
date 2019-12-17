
data1 <- read.csv(file.choose())
summary(data1)
head(data1)
str(data1)


## Linear Regression

mod <- lm(as.numeric(na.omit(data1$ADM_RATE_ALL)) ~ as.numeric(na.omit(data1$SATVR75)) + as.numeric(na.omit(data1$SATMT75)))

summary(mod)

plot(mod)


## Correlation


plot(as.numeric(na.omit(data1$ADM_RATE_ALL)),as.numeric(na.omit(data1$SATMT75)),main="Scatterplot",las=1)

cor(as.numeric(na.omit(data1$ADM_RATE_ALL)),as.numeric(na.omit(data1$SATMT75)),method="pearson")

cor.test(as.numeric(na.omit(data1$ADM_RATE_ALL)),as.numeric(na.omit(data1$SATMT75)),method="pearson")



## Hypothesis Test


TestResult <- t.test(as.numeric(na.omit(data1$ADM_RATE_ALL)),as.numeric(na.omit(data1$SATMT75)),mu=8,alternative="two.sided",conf.level = 0.95)
TestResult


