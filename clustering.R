library(tidyverse)

str(object = USArrests)

head(x = USArrests, n = 10L)

summary(object = USArrests)

#상관관계 확인 - 상관관계에 대한 표가 나오고 같은 속성끼리는 1 상관이 아예 없을 경우 0
#0.5 만 넘어도 나름 관계가 있다? 정도로 해석했던것 같음
cor(x = USArrests)

#분산 확인? 여기에 scale 함수 쓰면 cor 함수 쓴 것과 같아짐 (분산을 정규화 해서 보는거니까?, 거리라서 척도를 맞추기위해?)
var(x = USArrests)

var(x = scale(USArrests))

USAscaled <- scale(x = USArrests)

USAscaled

USAscaled[, 1] %>% mean() %>% round(digits = 1L)

USAscaled[, 1] %>% sd() %>% round(digits = 1L)

class(USAscaled)

temp <- as.data.frame(x = USAscaled)

temp

apply(X = temp, 
      MARGIN = 2, 
      FUN = function(x) mean(x) %>% round(digits = 1L))

apply(X = temp, 
      MARGIN = 2, 
      FUN = function(x) sd(x) %>% round(digits = 1L))

apply(X = USArrests, 
      MARGIN = 2, 
      FUN = function(x) mean(x) %>% round(digits = 1L))

apply(X = USArrests, 
      MARGIN = 2, 
      FUN = function(x) sd(x) %>% round(digits = 1L))

distMat <- dist(x = USAscaled, method = 'euclidean', diag = TRUE, upper = TRUE)

distMat <- dist(x = USAscaled, method = 'euclidean')
distMat

hc <- hclust(d = distMat, method = 'single')

plot(x = hc, main = '최단연결법')
rect.hclust(tree = hc, k = 3, border = 'red')

hclustPlot <- function(d, method, title, k) {
  hc <- hclust(d = d, method = method)
  plot(x = hc, main = title)
  rect.hclust(tree = hc, k = k, border = 'red')
}

hclustPlot(d = distMat, method = 'single', title = '최단연결법', k = 2)

hclustPlot(d = distMat, method = 'complete', title = '최장연결법', k = 2)

hclustPlot(d = distMat, method = 'average', title = '평균연결법', k = 2)

hclustPlot(d = distMat, method = 'centroid', title = '중심연결법', k = 2)

hclustPlot(d = distMat, method = 'ward.D', title = '와드연결법', k = 2)

hclustPlot(d = distMat, method = 'ward.D2', title = '와드연결법2', k = 2)

library(factoextra)

fit1 <- eclust(x = USAscaled, 
               FUNcluster = 'kmeans',
               k = 3, 
               hc_metric = 'euclidean', 
               seed = 1234)

print(x = fit1)

fit1$silinfo

fviz_silhouette(sil.obj = fit1)

fviz_nbclust(x = USAscaled, 
             FUNcluster = kmeans, 
             method = 'wss', 
             linecolor = 'red')

fviz_nbclust(x = USAscaled, 
             FUNcluster = kmeans, 
             method = 'silhouette', 
             linecolor = 'red')

fit2 <- eclust(x = USAscaled, 
               FUNcluster = 'kmeans',
               k =2, 
               hc_metric = 'euclidean', 
               seed = 1234)

fviz_cluster(object = fit2, 
             repel = TRUE, 
             ellipse = TRUE, 
             ellipse.type = 'norm', 
             ggtheme = theme_bw())

apply(X = USArrests, MARGIN = 2, FUN = mean)

mu <- sapply(X = USArrests, FUN = mean)

sd <- sapply(X = USArrests, FUN = sd)

fit2$centers

t(x = fit2$centers)

sd

t(x = fit2$centers) * sd

t(x = fit2$centers) * sd + mu

fit3 <- eclust(x = USAscaled, 
               FUNcluster = 'pam',
               k = 3, 
               hc_metric = 'euclidean', 
               seed = 1234)

print(x = fit3)

fviz_silhouette(sil.obj = fit3)

fviz_nbclust(x = USAscaled, 
             FUNcluster = cluster::pam, 
             method = 'wss', 
             linecolor = 'red')

fviz_nbclust(x = USAscaled, 
             FUNcluster = cluster::pam, 
             method = 'silhouette', 
             linecolor = 'red')

fit4 <- eclust(x = USAscaled, 
               FUNcluster = 'pam',
               k =2, 
               hc_metric = 'euclidean', 
               seed = 1234)

print(fit4)

fviz_cluster(object = fit4, 
             repel = TRUE, 
             ellipse = TRUE, 
             ellipse.type = 'norm', 
             ggtheme = theme_bw())


