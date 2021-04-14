# R_code_copernicus.r
# Visualizing Copernicus data

# install.packages("ncdf4")
library(raster)
library(ncdf4)

setwd("C:/lab/")

FCOVER <- raster("c_gls_FCOVER_202006130000_GLOBE_PROBAV_V1.5.1.nc")
FCOVER
cl <- colorRampPalette(c('light blue','green','red','yellow'))(100)
plot(FCOVER, col=cl, main="FCOVER")

#resampling
fcoverres <- aggregate(FCOVER, fact=100) #ricampionamento bilineare
plot(fcoverres, col=c, main="fcoverres")
