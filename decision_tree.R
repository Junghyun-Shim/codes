library(tidyverse)

country <- c('한국', '일본', '중국', '미국', '일본', '중국', '한국', '한국', 
             '일본', '미국', '중국', '한국', '일본')

class(x = country)

print(x = country)

countryFt <- as.factor(x = country)

class(x = countryFt)

print(x = countryFt)

as.numeric(country)

as.numeric(countryFt)

country[1] <- '대만'

country[1]

countryFt[1] <- '대만'

countryFt[1]

countryFt <- as.character(x = countryFt)

countryFt[1] <- '대만'

countryFt[1]

countryFt <- as.factor(x = countryFt)

countryFt[1]

options('stringsAsFactor')

options()

options(stringsAsFactors = FALSE)

bank <- read.csv(file = 'https://goo.gl/vE8GyN')

str(object = bank)

head(x = bank, n = 10L)

summary(object = bank)

bank %>% select(-ID, -ZIP.Code) -> bank

map_df(.x = bank[, c(6, 8:12)], .f = as.factor) -> bank[, c(6, 8:12)]

str(object = bank)

summary(object = bank)

bank$PersonalLoan %>% table() %>% prop.table()

set.seed(seed = 1234)
index <- sample(x = 1:2, 
                size = nrow(x = bank), 
                prob = c(0.7, 0.3), 
                replace = TRUE)

trainSet <- bank[index == 1, ]
testSet <- bank[index == 2, ]

trainSet$PersonalLoan %>% table() %>% prop.table()
testSet$PersonalLoan %>% table() %>% prop.table()

library(rpart)

set.seed(seed = 1234)
fit1 <- rpart(formula = PersonalLoan ~ ., 
              data = trainSet, 
              control = rpart.control(minsplit = 20, 
                                      cp = 0.01, 
                                      maxdepth = 10))

summary(object = fit1)

plot(x = fit1, 
     uniform = TRUE, 
     compress = TRUE, 
     branch = 0.4, 
     margin = 0.05)

text(x = fit1, 
     use.n = TRUE, 
     all = TRUE, 
     cex = 1.2)

library(rpart.plot)

rpart.plot(x = fit1, 
           type = 2, 
           extra = 101, 
           fallen.leaves = TRUE)

detach('package:tidyverse')

library(tidyverse)

printcp(x = fit1)

plotcp(x = fit1)

set.seed(seed = 1234)
fit1 <- rpart(formula = PersonalLoan ~ ., 
              data = trainSet, 
              control = rpart.control(minsplit = 20, 
                                      cp = 0.001, 
                                      maxdepth = 30))

printcp(x = fit1)

plotcp(x = fit1)

fit2 <- prune.rpart(tree = fit1, cp = 0.0014706)

rpart.plot(x = fit1, 
           type = 2, 
           extra = 101, 
           fallen.leaves = FALSE)

rpart.plot(x = fit2, 
           type = 2, 
           extra = 101, 
           fallen.leaves = FALSE)

getwd()

setwd(dir = '../')

getwd()

saveRDS(object = fit2, file = 'C:/Users/user/Documents/MLwR/data/fitDT1.RDS')

getwd()
setwd(dir = './MLwR/data')
getwd()

fit <- readRDS(file = 'fitDT.RDS')

pred1 <- predict(object = fit1, newdata = testSet, type = 'class')
pred2 <- predict(object = fit2, newdata = testSet, type = 'class')

real <- testSet$PersonalLoan

library(caret)

confusionMatrix(data = pred1, reference = real, positive = '1')

confusionMatrix(data = pred2, reference = real, positive = '1')

library(MLmetrics)

F1_Score(y_true = real, y_pred = pred1, positive = '1')

F1_Score(y_true = real, y_pred = pred2, positive = '1')

library(ROCR)

prediction(predictions = as.numeric(x = pred1),
           labels = as.numeric(x = real)) -> predObj

performance(prediction.obj = predObj, 
            measure = 'tpr', 
            x.measure = 'fpr') -> perform 

plot(x = perform)

prediction(predictions = as.numeric(x = pred2),
           labels = as.numeric(x = real)) -> predObj

performance(prediction.obj = predObj, 
            measure = 'tpr', 
            x.measure = 'fpr') -> perform 

plot(x = perform)

library(pROC)

auc(response = as.numeric(x = real), predictor = as.numeric(x = pred1))

auc(response = as.numeric(x = real), predictor = as.numeric(x = pred2))


