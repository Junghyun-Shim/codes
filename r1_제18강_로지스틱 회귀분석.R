#=====================================================================
# 제18강. 로지스틱 회귀분석
#=====================================================================
# 1 로지스틱 회귀분석이란?
# 2 로지스틱 회귀분석의 이론적 배경
# 3 로지스틱 회귀분석 통계량 이해

#=====================================================================
#=== 3. 로지스틱 회귀분석 통계량 이해
#=====================================================================

# (1) 가중치를 이용한 경우
time <- c(1,1,2,2,3,3)      # 약 투여량
pass <- c(0,1,0,1,0,1)  #
count <- c(7,3,5,5,2,8) 
aaa <- data.frame(time,pass,count) 
aaa
glm(pass~time,weight=count,family=binomial,data=aaa)

# (2) 로지스틱 회귀분석 예제 1
(time <- c(rep(1,10),rep(2,10),rep(3,10)) )   # 운전연습 시간
(pass <-c(rep(0,7),rep(1,3),rep(0,5),rep(1,5), rep(0,2),rep(1,8)) )
aaa <- data.frame(time,pass)
aaa
glm(pass~time,family=binomial,data=aaa)

logit <- function(x) {
  p <- exp(-2.050+1.105*x)/(1+exp(-2.050+1.105*x))
  return(p)
}
x <- c(1,2,3,4,5)
logit(x)

# (3) iris 로지스틱 회귀분석
#--- versicolor와 veginica 를 추출
iris.1 <- subset(iris,Species=="versicolor" | Species=="virginica")
iris.1
str(iris.1)  # Factor 의 라벨이 살아있다.
iris.1$Species <- factor(iris.1$Species)
str(iris.1)
# versicolor :1, virginica:2
glm(Species~., family=binomial, data=iris.1)

#--- 모델 적용 만들기 - fitted
m_glm <- glm(Species~., family=binomial,data=iris.1)
#names(m_glm)
m_glm$fitted.values
round(m_glm$fitted.values,digits=5)
round(m_glm$fitted.values[c(1:50)],digits=5)
round(m_glm$fitted.values[c(51:100)],digits=5)

ifelse(m_glm$fitted.values[c(1:50)] < 0.5,0,1)
sum(ifelse(m_glm$fitted.values[c(1:50)] < 0.5,0,1))
ifelse(m_glm$fitted.values[c(51:100)] < 0.5,0,1)
sum(ifelse(m_glm$fitted.values[c(51:100)] < 0.5,0,1))


