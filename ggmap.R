if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("dkahle/ggmap")


library("devtools")
library("ggmap")
library("ggplot2")
library("dplyr")

API = 'AIzaSyAjEyMzTVwqXh4WitXOF2ANhke04Zj0WvI'
register_google(key=API)

map <- get_map(location="seoul", zoom=14, maptype="roadmap", source="google")
g <- ggmap(map)
print(g)

# setwd("c:/Rtest")
# install.packages("devtools")
# library('devtools')
# library()
# install_github("dkahle/ggmap", force=TRUE)
# install.packages("ggmap")

map <- get_map(location="seoul", zoom=14, maptype="satellite", source="google")
g <- ggmap(map)
print(g)

# 랜드마크 설정
landmarks <- c("nseoul tower, seoul", "city hall, seoul")
lbls <- cbind(geocode(landmarks), text=landmarks)
g <- ggmap(map)
g <- g+geom_point(data=lbls, aes(x=lon, y=lat), size=5, colour='orange')
g <- g+geom_text(data=lbls, aes(x=lon, y=lat, label=text), size=5, colour='blue', hjust=0, vjust=0)
print(g)

### 서울시 공공 WIFI 시각화 및 분석
setwd('C:/Users/user/Desktop/JH/R_programmig (2)/data(f)')
wifi = read.csv("wifi.csv")
cent <- c(mean(wifi$LON), mean(wifi$LAT))
attach(wifi)

bmap <- ggmap(get_googlemap(center=c("seoul"), zoom=11, maptype="roadmap"))+
	geom_point(data=wifi, aes(x=LON,y=LAT,colour=INSTL_DIV,size=4))
print(bmap)

ggplot(wifi, aes(x=factor(1))) + geom_bar(aes(fill=INSTL_DIV), width =1) + coord_polar(theta="y")+
	xlab("") + ylab("")

bmap + facet_wrap(~INSTL_DIV)

ggplot(wifi, aes(CATEGORY)) + geom_bar(aes(fill = INSTL_DIV))

ggplot(wifi, aes(INSTL_DIV)) + geom_bar(aes(fill = CATEGORY))





### 수검자수 확인
# 전국 병원개수 파일을 불러온 후 위도 경도 표시
health <- read.csv("./DATA/checkup2.csv", header=T)
head(health)
cent <- c(mean(health$lat), mean(health$lon))
attach(health)

#대한민국 병원 개수를 지도로 확인하기
bmap <- ggmap(get_googlemap(center=c("southkorea"), zoom=7, maptype='roadmap'))+
	geom_point(data=health, aes(x=lon, y=lat, size=number), shape=16, color='purple', alpha=0.5)+
	scale_size_area(max_size=10)
print(bmap)

#대한민국 수검자 색깔별로 표시
library(xlsx)
# people <- read.xlsx("./DATA/checkup2.xlsx", sheetName="Sheet1")
people <- read.csv("./DATA/checkup2.csv", header=T)
head(people)
cent <- c(mean(people$lat), mean(people$lon))
attach(people)
fmap <- ggmap(get_googlemap(center=c("southkorea"), zoom=7, maptype="roadmap")) +
	geom_point(data=people, aes(x=lon, y=lat, color=examinee), shape=16, alpha=0.9, size=3)
print(fmap)



lonlat <- read.csv('./DATA/MF1.csv', header=T)

rmap <- ggmap(get_googlemap(center=c(127.6607, 36.0068), zoom=7, maptype='roadmap')) +
	geom_point(data=lonlat, aes(x=LON, y=LAT, color=RATE), size=2)
print(rmap)

rmap <- ggmap(get_googlemap(center=c(127.6607, 36.0068), zoom=7, maptype='roadmap')) +
	geom_point(data=lonlat, aes(x=LON, y=LAT, color=INCOME), size=2)
print(rmap)

rmap + facet_wrap(~RATE)
rmap + facet_wrap(~INCOME)

## 노래방 위치 확인
singingroom3 <- read.table("종로구_노래방_위치3.csv",sep=",", header=T, fileEncoding="euc-kr")
getwd()
singingroom3
# library(sp)
# install.packages("rgdal")
# library(rgdal)
# 
# convertCoordSystem <- function(long, lat, from.crs, to.crs){
# 	xy <- data.frame(long=long, lat=lat)
# 	coordinates(xy) <- ~long+lat
# 	
# 	from.crs <- CRS(from.crs)
# 	from.coordinates <- SpatialPoints(xy, proj4string=from.crs)
# 	
# 	to.crs <- CRS(to.crs)
# 	changed <- as.data.frame(SpatialPoints(spTransform(from.coordinates, to.crs)))
# 	names(changed) <- c("long", "lat")
# 	
# 	return(changed)
# }
# 
# coord <- data.frame(utmk.long=c(456550.586481, 453010.52834800000), utmk.lat=c(196231.620914, 201911.558892))
# from.crs = "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs"
# 
# to.crs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"
# coord <- cbind(coord, convertCoordSystem(coord$utmk.long, coord$utmk.lat, from.crs, to.crs))
# coord
