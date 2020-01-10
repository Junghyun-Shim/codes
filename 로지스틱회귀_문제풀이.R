## R-point 상관관계 분석 연습문제 1번
setwd('C:/Users/user/Desktop/JH/R_programmig (2)/data(f)')
coffee <- read.csv("coffee.csv", header = TRUE)
View(coffee)

coffee$재방문의도 <- (coffee$재방문의도1 + coffee$재방문의도2)/2
coffee$환경만족도 <- (coffee$내부환경만족도1 + coffee$내부환경만족2 + coffee$내부환경만족3)/3
coffee$커피품질만독도 <- (coffee$커피품질만족도1 + coffee$커피품질만족도2 + coffee$커피품질만족도3)/3

cor.pearson <- cor.test(~ 재방문의도 + 환경만족도, method = "pearson", data= coffee)
cor.pearson
# 재방문의도와 환경만족도의 상관관계를 보면 0.5 정도의 뚜렷한 양의 상관 관계가 있다

cor.pearson <- cor.test(~ 재방문의도 + 커피품질만독도, method = "pearson", data= coffee)
cor.pearson
# 재방문의도와 커피품질만족도의 상관관계를 보면 0.43 정도의 뚜렷한 양의 상관 관계가 있다

cor.pearson <- cor.test(~ 환경만족도 + 커피품질만독도, method = "pearson", data= coffee)
cor.pearson
# 환경만족도와 커피품질만족도의 상관관계를 보면 0.54 정도의 뚜렷한 양의 상관 관계가 있다


## R-point 상관관계 분석 연습문제 2번
##학생들의 수업중 태도들과 학점의 상관관계를 확인

student <- read.csv("student.csv", header = TRUE)
View(student)

student$수업태도 <- (student$ + student$수업태도2 + student$수업태도3)/3

cor.pearson <- cor.test(~ 학점 + 수업태도, method = "pearson", data= student)
cor.pearson
# p밸류 값이 0.05 이하이므로 귀무가설을 기각하고
# 학점과 수업태도의 상관관계를 보면 -0.11 정도의 약한 음의 상관관계가 있다

## R-point 상관관계 분석 연습문제 3번
# 학생들의 수업중 활동들과 학점의 상관관계를 확인

student$수업중활동 <- (student$수업중활동1 + student$수업중활동2 + student$수업중활동3)/3

cor.pearson <- cor.test(~ 학점 + 수업중활동, method = "pearson", data= student)
cor.pearson
# p밸류 값이 0.05 이하이므로 귀무가설을 기각하고
# 학점과 수업중활동의 상관관계를 보면 0.14 정도의 약한 양의 상관관계가 있다

cor(student)
plot(student)



##로지스틱 회귀
# library(car)
# a$satis_dummy <- recode(a$satis, "lo:3=0; 4:hi=1; else='NA'")
# glm(a~b+c+factor(d)+e)
# exp(cbind(OR=coef(A.lm), confint(A.lm)))

library(survival)
attach(colon)
data(colon)
str(colon)
colon1 <- na.omit(colon)
colon
result1 <- glm(status ~ rx+sex+age+obstruct+perfor+adhere+nodes+differ+extent+surg, family = binomial,data=colon1)
summary(result1)
