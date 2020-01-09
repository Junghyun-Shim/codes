setwd('C:/Users/user/Desktop/JH/R_programmig (2)/data(f)')

result <- read.csv("mytelecom.csv", header=TRUE)

result2 <- lm(churn ~ tenure + income + age, data=result)
summary(result2)

plot(result2)

sales <- read.csv("sales.csv", header = TRUE)
str(sales)

sales.lm2 <-lm(profit ~ rd + ad + promotion, data=sales)
summary(sales.lm2)

install.packages("car")
library(car)
vif(sales.lm2)

plot(sales.lm2)


### 일원배치 분산분석
a <- c(100,98,85,90,88,80)
b <- c(73,80,80,75,67,57)
c <- c(110, 104, 91, 109,85,95)
life <- data.frame(a,b,c)
b.life = stack(life)
op=par(mfrow=c(1,2))
boxplot(values~ind, data=b.life)
par(op)
dev.off()

oneway.test(values ~ind, data=b.life, var.equal=TRUE)
