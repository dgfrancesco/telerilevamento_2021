# R_code_land_cover.r

library(raster)
library(RStoolbox) # classification
# install.packages("ggplot2")
library(ggplot2)
# install.packages("gridExtra")
library(gridExtra)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

# NIR 1, RED 2, GREEN 3

defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# multiframe with ggplot2 and gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)

# unsupervised classification 
d1c <- unsuperClass(defor1, nClasses=2) # 
plot(d1c$map)

#class 1: forest
#class 2: agriculture

#set.seed() would allow to attain the same results
d2c <- unsuperClass(defor2, nClasses=2)

d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)

#frequencies, freq function generate frequency table
freq(d1c$map)
#  value  count
# [1,]     1  35727
# [2,]     2 305565

s1 <- 35727 + 305565
prop1 <- freq(d1c$map)/ s1
prop1
#  value     count
# [1,] 2.930042e-06 0.1046816   # prop agriculture
# [2,] 5.860085e-06 0.8953184   # prop forest

defor2
# class      : RasterBrick 
# dimensions : 478, 717, 342726, 3  (nrow, ncol, ncell, nlayers)
# resolution : 1, 1  (x, y)
# extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
# crs        : NA 
# source     : C:/lab/defor2.jpg 
# names      : defor2.1, defor2.2, defor2.3 
# min values :        0,        0,        0 
# max values :      255,      255,      255 

s2 <- 342726
prop2 <- freq(d2c$map) / s2
prop2
#            value     count
# [1,] 2.917783e-06 0.5231555  # prop agriculture
# [2,] 5.835565e-06 0.4768445  # prop forest

#built a dataframe
cover <- c("Forest", "Agriculture")
percent_1992 <- c(89.53, 10.46)
percent_2006 <- c(52.31,47.68)

percentages <- data.frame(cover, percent_1992, percent_2006)
percentages

#ggplot2 creato per fare dei bei grafici in statistica ( ggplot sarebbe come una specie di par.mfrowcon il + aggiungiamo il grafico)

p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white") 
# geom_bar genera per generare un grafico a barre, identity serve per dire quali dati usiamo, usiamo i dati del dataframe, fill per dare il colore
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1,p2, nrow=1) # funzione che unisce più grafici (in questo caso istogrammi)





