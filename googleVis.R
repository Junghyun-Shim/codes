library(googleVis)
demo(googleVis)


df=data.frame(country=c("US", "GB", "BR"), 
							val1=c(10,13,14), 
							val2=c(23,12,32))
df

Line <- gvisLineChart(df)
plot(Line)



Line2 <- gvisLineChart(df, "country", c("val1","val2"),
											 options=list(
											 	series="[{targetAxisIndex: 0},
                                 {targetAxisIndex:1}]",
											 	vAxes="[{title:'val1'}, {title:'val2'}]"
											 ))
plot(Line2)



Bubble <- gvisBubbleChart(Fruits, idvar="Fruit", 
													xvar="Sales", yvar="Expenses",
													colorvar="Year", sizevar="Profit",
													options=list(
														hAxis='{minValue:75, maxValue:125}'))
plot(Bubble)



setwd('C:/Users/user/Desktop/JH/R_programmig (2)/data(f)')


carcinogen <- read.csv("carcinogen.csv")
name <- c("Seoul","Busan","Daegu","Incheon","Gwangju","Daejeon","Ulsan", "Sejong","Gyeonggi", "Gangwon", "Chungbuk","Chungnam","Jeonbuk","Jeoonnam","Gyeongbuk","Gyeongnam")
region <- paste("KR",c(11,26,27,28,29,30,31,32,41,42,43,44,45,46,47,48),sep="-")

Korea <- data.frame(region, carcinogen[,2], name)
colnames(Korea) <- c("region","carcinogen","name")

install.packages("googleVis")
library("googleVis")

Map <- gvisGeoChart(Korea, locationvar = "region", colorvar = "carcinogen", hovervar = "name",
										options = list(region = "KR", displayMode = "regions", resolution = "provinces", 
																	 colorAxis="{colors:['lightgreen','red']}", backgroundColor = "red",
																	 datalessRegionColor = "gray"))
plot(Map)

park <- mydata$html$header 
park <- gsub("charset=utf-8", "charset=euc-kr", header) 
mydata$html$header <- header

windowsFonts(malgun = windowsFont("맑은 고딕"))
windowsFonts()




