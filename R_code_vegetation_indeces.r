# R_code_vegetation_indeces.r

# install.packages("raster")
# install.packages("rasterdiv")
# install.packages("rasterVis")

library(raster)
library(rasterVis)
library(rasterdiv)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

#B1 = NIR
#B2 = red
#B3 = green

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
