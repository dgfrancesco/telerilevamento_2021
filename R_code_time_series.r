# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

# install.packages("raster")
library(raster)

setwd("~/lab/greenland") # Linux
# setwd("C:/lab/greenland") # Windows
# setwd("/Users/name/Desktop/lab/greenland") # Mac 

lst_2000 <- raster("lst_2000.tif")
plot(lst_2000)
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

#par
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#list f files
list.files()

rlist <- list.files(pattern="lst")
rlist

lapply()

import <- lapply(rlist,raster)            #applicare funzione raster su tutta la lista
import

stack        #crea un blocco di file raster tutti insieme invece che lasciarli singoli, plot unico invece di fare par(mfrow)
TGr <- stack(import)
plot(TGr)
plotRGB(TGr, 1,2,3, stretch="lin")
plotRGB(TGr, 2,3,4, stretch="lin")
