# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

# install.packages("raster")
 install.packages("rasterVis")

library(raster)
library(ratserVis)
###install.packages("rgdal") se manca un pezzo di computer

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
# list.files()   #fa la lista di tutti i file che hanno lo stesso nome, eg. "lst"

rlist <- list.files(pattern="lst")
rlist

# lapply()           #applica la funzione raster su tutta la lista

import <- lapply(rlist,raster)            
import

# stack        #crea un blocco di file raster tutti insieme invece che lasciarli singoli, plot unico invece di fare par(mfrow)
TGr <- stack(import)
plot(TGr)
plotRGB(TGr, 1,2,3, stretch="lin")
plotRGB(TGr, 2,3,4, stretch="lin")

### day 7 ###

levelplot(TGr)
levelplot(TGr$lst_2000)

cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(TGr, col.regions=cl)

levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

levelplot(TGr, col.regions=cl, main="LST variation in time", names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

# Melt
meltlist <- list.files(pattern="melt")
melt_import <- lapply(meltlist,raster)
melt <- stack(melt_import)
melt

levelplot(melt)

melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)

levelplot(melt_amount, col.regions=clb)
