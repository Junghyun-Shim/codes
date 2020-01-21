# getwd()

# x4 = read.csv("test2.csv", encoding="UTF-8", sep=",")
# View(x4)
setwd("C:/Users/shim1/Desktop/SJH/Projects/")
install.packages("readxl")
library(readxl)
x4 = read_excel("TEST.xlsx")
View(x4)

d4 = dist(x4)
d4

fit4 = cmdscale(d4, eig=TRUE, k=3)
fit4

xdash4 = fit4$points[,1]
ydash4 = fit4$points[,2]
zdash4 = fit4$points[,3]

cdash2 = c("blue","blue","darkorange3","darkorange3","blue","darkorange3", "grey", "grey")
cdash2l = c("blue","blue","darkorange4","darkorange4","blue","darkorange4", "grey", "grey")
ldash = c("D 260 d", "D 85 d", "B 85 d", "B 183 d", "D 183 d", "B 246 d", "Filter1", "Filter2")

install.packages("plot3D")
library(plot3D)

plot.3D(xdash4, ydash4, zdash4, col=cdash2, type="s", size =3, lwd=4)
text3d(xdash4, ydash4, zdash4+0.08, ldash, fontweight="bold", cex= 2, col=cdash2l)



install.packages("stats")
library(stats)
install.packages("MASS")
library(MASS)

install.packages("HSAUR")
library(HSAUR)
d4
data(x4, packages="HSAUR")
voles_mds <- cmdscale(d4)
voles_mds

vole_mds <- cmdscale(watervoles, eig=TRUE)
vole_mds

plot()

mds3 <- cmdscale(d4, k=3)
mds3

install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(mds3, color="dark blue", pch=1, main="Mulitmensional Scaling 3-D Plot", sub="Three Dimensional Solution", grid=TRUE, box=TRUE)

install.packages(c("rgl","car"))
require(car)
sep.x <-  x4$`1`
sep.y <- x4$`2`
sep.z <- x4$`3`

scatter3d(x=sep.x, y=sep.y, z=sep.z)
