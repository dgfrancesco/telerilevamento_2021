# R_code_vegetation_indeces.r

# install.packages("raster")
# install.packages("rasterdiv")
# install.packages("rasterVis")

library(raster) # oppure funzione require
library(RStoolbox) # for vegetation indices
library(rasterVis)
library(rasterdiv)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

#B1 = NIR, B2 = red, B3 = green

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

### DVI1 ###
defor1
# band1: NIR, defor1.1
# band2: red, defor1.2
dvi1 <- defor1$defor1.1 - defor1$defor1.2
plot(dvi1)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl, main="DVI at time 1")

# time 2
defor2
# band1: NIR, defor2_.1
# band2: red, defor2_.2
dvi2 <- defor2$defor2.1 - defor2$defor2.2 
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl, main="DVI at time 2")

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

difdvi <- dvi1-dvi2
#Raster objects have different extents. Result for their intersection is returned, vuol dire che un'immagine ha più pixel, ha un estensione, uno spazio maggiore,
# quindi la differenza è calcolata all'intersezione
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld) 
#dove la differenza è più forte ho valori rossi, dove la diff. è più bassa ho le parti bianche e celesti

### NDVI ###
# (NIR-RED) / (NIR+RED)
ndvi1 <- (defor1$defor1.1-defor1$defor1.2) / (defor1$defor1.1+defor1$defor1.2) 
plot(ndvi1, col=cl)

ndvi2 <- (defor2$defor2.1-defor2$defor2.2) / (defor2$defor2.1+defor2$defor2.2) 
plot(ndvi2, col=cl)

difndvi <- ndvi1 - ndvi2
 
# dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)

#RStoolbox: spectralIndices
vi <- spectralIndices(defor1, green=3, red= 2, nir=1)
plot(vi, col=cl)

vi2 <- spectralIndices(defor2, green=3, red= 2, nir=1)
plot(vi2, col=cl)
