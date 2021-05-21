# R_code_variability.r

library(raster)
library(RStoolbox)
library(ggplot2) # for ggplot plotting
library(gridExtra) # for plotting ggplot together
# install.packages("viridis")
library(viridis) # for ggplot colouring  

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
pc1 <- sentpca$map$PC1

pc1devst3 <- focal(pc1, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
cl <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(pc1devst3, col=cl)

pc1 <- sentpca$map$PC1
pc1sd5 <- focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
cl <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(pc1sd5, col=cl)

# with the source function you can upload code from outside! 
source("source_test_lezione.r") # mettiamo dentro un codice senza doverlo scrivere
source("source_ggplot.r")

# https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
ggplot() + geom_raster(pc1sd5, mapping= aes(x=x, y=y, fill=layer)) + scale_fill_viridis()

p1 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis()  +
ggtitle("Standard deviation of PC1 by viridis colour scale")

p2<- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option="magma")  +
ggtitle("Standard deviation of PC1 by magma colour scale")

p3 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option="turbo")  +
ggtitle("Standard deviation of PC1 by turbo colour scale")

p4 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option="inferno")  +
ggtitle("Standard deviation of PC1 by inferno colour scale")

grid.arrange(p1,p2,p3, nrow=1)


