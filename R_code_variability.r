# R_code_variability.r

library(raster)
library(RStoolbox)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

sent <- brick("sentinel.png")

# NIR 1, RED 2, GREEN 3
# r=1, g=2, b=3
plotRGB(sent, stretch="lin")
# plotRGB(sent, r=1, g=2, b=3, stretch="lin")
# plotRGB(sent, r=2, g=1, b=3, stretch="lin")

nir <- sent$sentinel.1
red <- sent$sentinel.2
ndvi <- (nir-red) / (nir+red)
plot(ndvi)
cl <- colorRampPalette(c('black','white','red','magenta','green'))(100) # 
plot(ndvi,col=cl)

# focal analysis
ndvi_sd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
# w=window indica la finestra, di solito si usa quella quadrata (isotropa). Finesta mobile di 3x3 pixel.
plot(ndvi_sd3)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #
plot(ndvi_sd3, col=clsd)

# mean ndvi with focal
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #
plot(ndvimean3, col=clsd)

# changing window size
ndvimean5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=mean)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #
plot(ndvimean5, col=clsd)

# PCA # calcolo della variabilità all'interno di un'analisi multivariata
sentpca <- rasterPCA(sent)
plot(sentpca$map)
sentpca

summary(sentpca$model)
# the first PC contains 67.36804% of the original information
