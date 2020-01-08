#2020-01-08 in R

getwd()
setwd('C:/Users/user/Desktop/JH/R_programmig (2)/data(f)')
getwd()
mycf <- read.csv('mycf.csv', header=TRUE)
mycf

mycf$group
table(mycf$group)
table(mycf$interest)
table(mycf$group, mycf$interest)

round(prop.table(table(mycf$group, mycf$interest))*100, 1)

prop.test(c(37,23), c(50,50))

prop.test(c(37,23), c(50,50), alter='greater', conf.level=0.95)


// 전단지 광고와 인터넷 광고 중 더 효과 있는거 ㅊ찾기?
museum <- read.csv('museum.csv', header=TRUE)
museum[c('group', 'visit')]

table(museum$group)
table(museum$visit)
table(museum$group, museum$visit)

round(prop.table(table(museum$group, museum$visit))*100, 0)

prop.test(c(20,34), c(100,100))
// p밸류가 0.05 보다 작으니까 둘은 차이가 있다

prop.test(c(20,34), p=0.50, alter = 'greater', conf.level= 0.95)
// 0.05보다 크니까 1번 그룹이 더 작은게 맞다 



//two sample T test
mymethod <- read.csv('mymethod.csv', header =TRUE)

mymethod

groupA <- subset(mymethod, method == 1 & performance <99)
groupB <- subset(mymethod, method == 2 & performance <99)
groupAcount <- length(groupA$method) 
groupAmean <- round(mean(groupA$performance), 2)
groupAcount;groupAmean

groupBcount <- length(groupB$method) 
groupBmean <- round(mean(groupB$performance), 2)
groupBcount;groupAmean

groupcount <- c(groupAcount, groupBcount)
groupmean <- c(groupAmean, groupBmean)
groupcount;groupmean
grouptable <- data.frame(Freq=groupcount, Mean=groupmean)
grouptable

var.test(groupA$performance, groupB$performance)
// p밸류가 0.05 보다 크니까 t-test를 돌릴 수 있다

t.test(groupA$performance, groupB$performance, alter="two.sided", conf.inf=TRUE, conf.level=0.95)
// 양측 검정 했을때 0.05 보다 작으니까 두 평균간 차이가 있다

t.test(groupA$performance, groupB$performance, alter="greater", conf.inf=TRUE, conf.level=0.95)
// p value가 0.05 보다 크니까 B가 크다


// 주/야간 학생듷의 성적과 고등학교 종합성적 데이터를 보고
// 주간/야간 학생들의 성적차이 보자

daygrade <-read.csv('daygrade.csv', header =TRUE)
daygrade


groupA <- subset(daygrade, day == 1 & univ < 5.0)
groupB <- subset(daygrade, day == 2 & univ < 5.0)
groupAcount <- length(groupA$day) 
groupAmean <- round(mean(groupA$univ), 2)
groupAcount;groupAmean
groupA

groupBcount <- length(groupB$day) 
groupBmean <- round(mean(groupB$univ), 2)
groupBcount;groupAmean

groupcount <- c(groupAcount, groupBcount)
groupmean <- c(groupAmean, groupBmean)
groupcount;groupmean
grouptable <- data.frame(Freq=groupcount, Mean=groupmean)
grouptable


var.test(groupA$univ, groupB$univ)
// p밸류가 0.05 보다 크니까 t-test를 돌릴 수 있다

t.test(groupA$univ, groupB$univ, alter="two.sided", conf.inf=TRUE, conf.level=0.95)
// 양측 검정 했을때 0.05 보다 작으니까 두 평균간 차이가 있다

t.test(groupA$univ, groupB$univ, alter="greater", conf.inf=TRUE, conf.level=0.95)
// p value가 0.05 보다 작으니까 A가 크다(그룹A가 1그룹이고 얘가 주간)




// 영화관 만족도 조사
// 성별에 따라 평균 점수가 다른지

install.packages('xls')
library(readxl)

movie <- read_xls('영화관 만족도조사.xls')
View(movie)
movie$관람환경만족1

groupA <- subset(movie, 성별 == 1)
groupA
groupB <- subset(movie, 성별 == 2)
groupB$성별

groupA$관람환경만족 <- (groupA$관람환경만족1+ groupA$관람환경만족2+groupA$관람환경만족3)/3
groupB$관람환경만족 <- (groupB$관람환경만족1+ groupB$관람환경만족2+groupB$관람환경만족3)/3


groupAcount <- length(groupA$성별) 
groupAmean <- round(mean(groupA$관람환경만족), 2)
groupAcount;groupAmean

groupBcount <- length(groupB$성별) 
groupBmean <- round(mean(groupB$관람환경만족), 2)
groupBcount;groupBmean

groupcount <- c(groupAcount, groupBcount)
groupmean <- c(groupAmean, groupBmean)
groupcount;groupmean
grouptable <- data.frame(Freq=groupcount, Mean=groupmean)
grouptable


var.test(groupA$관람환경만족, groupB$관람환경만족)
// p밸류가 0.05 보다 크니까 t-test를 돌릴 수 있다

t.test(groupA$관람환경만족, groupB$관람환경만족, alter="two.sided", conf.inf=TRUE, conf.level=0.95)
// 양측 검정 했을때 0.05 보다 작으니까 두 평균간 차이가 있다

t.test(groupA$관람환경만족, groupB$관람환경만족, alter="greater", conf.inf=TRUE, conf.level=0.95)
// p value가 0.05 보다 크니까 그룹B가 크다(그룹B가 2 선택한 그룹이고 2가 여성 1이 남성)