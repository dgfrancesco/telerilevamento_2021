# R code complete - Telerilevamento Geo-Ecologico

#------------------------------------------------------------------------------------------

# Summary:

# 1. Remote sensing first code
# 2. R code time series 
# 3. R code Copernicus data
# 4. R code Knitr
# 5. R code multivariate analysis
# 6. R code classification
# 7. R code ggplot2
# 8. R code vegetation indeces
# 9. R code land cover
# 10. R code variability
# 11. R code spectral signature

#------------------------------------------------------------------------------------------------------

# 1. Remote sensing first code

# install.packages("raster")
library(raster)

setwd("~/lab/") # Linux
#setwd("/Users/name/Desktop/lab/") # Mac
#setwd("C:/lab/") # Windows

p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

plot(p224r63_2011)

### Day 2 ###
# colour change -> new

cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)

cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011, col=cls)

### Day 3 ###

#Landsat bands
# B1: blue
# B2: green
# B3: red
# B4: NIR - infrarosso vicino
# B5: MIR - infrarosso medio
# B6: TIR - infrarosso termico
# B7: MIR - infrarosso medio

# dev.off will clean the current graph
dev.off()

plot(p224r63_2011$B1_sre)

# plot band 1 with a predefined color ramp palette
cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011$B1_sre, col=cl)

dev.off()

plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 1 row, 2 columns
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 row, 1 columns
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# if you are using columns first: par(mfcol...)

# plot the first four bands of Landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# a quadrat of bands...:
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# a quadrat of bands...:
par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue","blue","light blue","purple")) (100)
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)

clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)

### Day 4 ###
# Visualizing data by RGB plotting 

#Landsat bands
# B1: blue
# B2: green
# B3: red
# B4: NIR - infrarosso vicino
# B5: MIR - infrarosso medio
# B6: TIR - infrarosso termico
# B7: MIR - infrarosso medio

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")  # natural colours
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")  
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")  # false colours
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Exercise: mount a 2x2 multiframe
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin") 
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# il mio primo pdf
pdf("il_mio_primo_pdf.pdf") 
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")  
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
dev.off()

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

# par natural colours, false colours, and false colours with histogram stretch
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

install.packages("RStoolbox")
library(RStoolbox)

###### Day 5 #############
# Multitemporal set
p224r63_1988 <- brick("p224r63_1988_masked.grd")
p224r63_1988

# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

plot(p224r63_1988)
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

# hist
pdf("multitemp.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
dev.off()

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")


# par natural colours, flase colours, and false colours with histogram stretching
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")


#-----------------------------------------------------------------------------------

# 2. R code time series

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
TGr
plot(TGr)

plotRGB(TGr, 1, 2, 3, stretch="lin")
plotRGB(TGr, 2, 3, 4, stretch="lin")
plotRGB(TGr, 4, 3, 2, stretch="Lin") 

### day 7 ###

levelplot(TGr)
#levelplot(TGr$lst_2000)

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

#----------------------------------------------------------------------------------------------

# 3. R code Copernicus data

# R_code_copernicus.r
# Visualizing Copernicus data

# install.packages("ncdf4")
library(raster)
library(ncdf4)

setwd("C:/lab/")

albedo <- raster("c_gls_FCOVER_202006130000_GLOBE_PROBAV_V1.5.1.nc")
albedo
cl <- colorRampPalette(c('light blue','green','red','yellow'))(100)
plot(albedo, col=cl, main="albedo")

#resampling
albedores <- aggregate(albedo, fact=100) #ricampionamento bilineare
plot(albedores, col=c, main="albedores")

#-------------------------------------------------------------------------------------------

# 4. R code Knitr

#R_code_knitr.r

#install.packages("knitr")
#install.packages("tinytex")

setwd("~/lab/greenland") # Linux
# setwd("C:/lab/greenland") # Windows
# setwd("/Users/name/Desktop/lab/greenland") # Mac 

library(knitr)  # oppure require("knitr")

#stitch("~/Downloads/R_code_greenland.r", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
stitch("C:/lab/R_code_greenland.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

tinytex::install_tinytex()
tinytex::tlmgr_update()

#-------------------------------------------------------------------------------------------

# 5. R code multivariate analysis

# R_code_multivariate_analysis.r

library(raster)
library(RStoolbox)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac 

#funzione raster carica un set per volta
#fuonzione brick carica tutti i set di bande insieme

p224r63_2011 <- brick("p224r63_2011.grd")
p224r63_2011
plot(p224r63_2011)

#Landsat bands
# B1: blue
# B2: green
# B3: red
# B4: NIR - infrarosso vicino
# B5: MIR - infrarosso medio
# B6: TIR - infrarosso termico
# B7: MIR - infrarosso medio

plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2) # plottiamo i valori della banda 1 con quelli della banda 2, 
# pch è il point character, cex aumento il carattere
plot(p224r63_2011$B2_sre, p224r63_2011$B1_sre, col="red", pch=19, cex=2)

pairs(p224r63_2011) # correlazione a 2 a 2 tra tutte le bande. Indice di correlazione di Pearson tra -1 e 1, 
# positivemente correlati valori del coefficiente di Pearson vicino a 1, negativamente correlati più vicino a zero.

# aggregate cells function, per aggregare i pixel (ricampionamento<resample data) passiamo dai pixel più piccoli a pixel molto + grandi
p224r63_2011res <- aggregate(p224r63_2011, fact=10) #aumentiamo linearmente di un fattore 10
# original res=30, newres=300 - non più pixel da 30 m ma 300 m (abbiamo diminuto la risoluzione) 
# aggregate(x, fact=2, fun=mean, expand=TRUE, na.rm=TRUE, filename=
p224r63_2011res

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")

# raster PCA
p224r63_2011m_pca <- rasterPCA(p224r63_2011res) # continene non solo la mappa ma anche il modello e altre info
summary(p224r63_2011m_pca$model) #vediamo quanta varianza spiegano le varie componenti
plot(p224r63_2011m_pca$map)
plotRGB(p224r63_2011m_pca$map, r=1, g=2, b=3, stretch="lin")
#plot(p224r63_2011m_pca$map$PC1, p224r63_2011m_pca$map$PC2)

# add from students:
#str(p224r63_2011res_pca) da info sulla struttura informatica del file

#-------------------------------------------------------------------------------------------

# 6. R code classification

# R code classification.r
library(raster)
library(RStoolbox)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac 

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg") #create a rasterbrick objects, si caricano più livelli insieme RGB
so

#visualize RGB levels
plotRGB(so, 1,2,3, stretch="lin")
plotRGB(so, 2,1,3, stretch="lin")
cplotRGB(so, 3,2,1, stretch="lin")

# Unsupervised Classification
set.seed(42)  # questa funzione serve per avere sempre le stesse repliche per fare il modello
soc <- unsuperClass(so, nClasses=3)

cl <- colorRampPalette(c('yellow','red','black'))(100)
plot(soc$map,col=cl)

# Unsupervised Classification with 20 classes
soe <- unsuperClass(so, nClasses=20)

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soe$map,col=cl)

#Download an image from: https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images
sun <- brick("Sun.png") 
# Unsupervised Classification
set.seed(42)  # questa funzione serve per avere sempre le stesse repliche per fare il modello
sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)

### Day xx ###
#Grand Canyon
#Download an image from: https://landsat.visibleearth.nasa.gov/view.php?id=80948
library(raster)
library(RStoolbox)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
plotRGB(gc, r=1, g=2, b=3, stretch="lin") 
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

gcc2 <- unsuperClass(gc, nClasses=2)
gcc2
plot(gcc2$map)

gcc4 <- unsuperClass(gc, nClasses=4)
gcc4
plot(gcc4$map)

#-------------------------------------------------------------------------------------------

# 7. R code ggplot 2

library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)

setwd("~/lab/")

p224r63 <- brick("p224r63_2011_masked.grd")

ggRGB(p224r63,3,2,1, stretch="lin")
ggRGB(p224r63,4,3,2, stretch="lin")

p1 <- ggRGB(p224r63,3,2,1, stretch="lin")
p2 <- ggRGB(p224r63,4,3,2, stretch="lin")

grid.arrange(p1, p2, nrow = 2) # this needs gridExtra

#-------------------------------------------------------------------------------------------

# 8. R code vegetation indeces

# R_code_vegetation_indeces.r

# install.packages("raster")
# install.packages("rasterdiv")
# install.packages("rasterVis")

library(raster) # oppure funzione require(raster)
library(RStoolbox) # for vegetation indices calculation
library(rasterVis)
library(rasterdiv) # for the worldwide NDVI

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

# difference vegetation index

# time 1

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

# ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)
# plot(ndvi1, col=cl)

ndvi2 <- (defor2$defor2.1-defor2$defor2.2) / (defor2$defor2.1+defor2$defor2.2) 
plot(ndvi2, col=cl)

# ndvi1 <- dvi2 / (defor2$defor2.1 + defor1$defor2.2)
# plot(ndvi2, col=cl)

difndvi <- ndvi1 - ndvi2
 
# dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)

#RStoolbox: spectralIndices
vi <- spectralIndices(defor1, green=3, red= 2, nir=1)
plot(vi, col=cl)

vi2 <- spectralIndices(defor2, green=3, red= 2, nir=1)
plot(vi2, col=cl)

# worldwide NDVI
plot(copNDVI)


# Pixels with values 253, 254 and 255 (water) will be set as NA’s.
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

# rasterVis package needed:
levelplot(copNDVI)

#-------------------------------------------------------------------------------------------

# 9. R code land cover

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
# class 1: agriculture
# class 2: forest

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
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white") 
# geom_bar genera per generare un grafico a barre, identity serve per dire quali dati usiamo, usiamo i dati del dataframe, fill per dare il colore
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1,p2, nrow=1) # funzione che unisce più grafici (in questo caso istogrammi)

#-------------------------------------------------------------------------------------------

# 10. R code variability

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
ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvisd13, col=clsd)

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

#-------------------------------------------------------------------------------------------

# 11. R code spectral signatures

# R_code_spectral_signatures.r

library(raster)
library(rgdal)
library(ggplot2)

setwd("~/lab/")
# setwd("/Users/utente/lab") #mac
# setwd("C:/lab/") # windows

defor2 <- brick("defor2.jpg")

# defor2.1, defor2.2, defor2.3 
# NIR, red, green

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="hist")

click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

# results:
#      x     y  cell defor2.1 defor2.2 defor2.3
# 1 178.5 435.5 30293      206        6       19
#      x     y   cell defor2.1 defor2.2 defor2.3
# 1 571.5 245.5 166916       40       99      139

# define the columns of the dataset:
band <- c(1,2,3)
forest <- c(206,6,19)
water <- c(40,99,139)

# create the dataframe
spectrals <- data.frame(band, forest, water)

# plot the sepctral signatures
ggplot(spectrals, aes(x=band)) +
 geom_line(aes(y=forest), color="green") +
 geom_line(aes(y=water), color="blue") +
 labs(x="band",y="reflectance")

############### Multitemporal

defor1 <- brick("defor1.jpg")

plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

# spectral signatures defor1
click(defor1, id=T, xy=T, cell=T, type="p", pch=16, col="yellow")

#     x     y  cell defor1.1 defor1.2 defor1.3
# 1 89.5 339.5 98622      223       11       33
#     x     y   cell defor1.1 defor1.2 defor1.3
# 1 42.5 336.5 100717      218       16       38
#     x     y  cell defor1.1 defor1.2 defor1.3
# 1 64.5 341.5 97169      213       36       46
#      x     y   cell defor1.1 defor1.2 defor1.3
# 1 80.5 326.5 107895      208        2       22
#     x     y  cell defor1.1 defor1.2 defor1.3
# 1 76.5 374.5 73619      224       21       41

# time t2
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="yellow")

#      x     y  cell defor2.1 defor2.2 defor2.3
# 1 86.5 339.5 99033      197      163      151
#      x     y  cell defor2.1 defor2.2 defor2.3
# 1 104.5 338.5 99768      149      157      133
#      x     y  cell defor2.1 defor2.2 defor2.3
# 1 110.5 354.5 88302      197      132      128
#     x     y   cell defor2.1 defor2.2 defor2.3
# 1 90.5 320.5 112660      169      166      149
#    x     y   cell defor2.1 defor2.2 defor2.3
# 1 97.5 309.5 120554      150      137      129

# define the columns of the dataset:
band <- c(1,2,3)
time1 <- c(223,11,33)
time1p2 <- c(218,16,38)
time2 <- c(197,163,151)
time2p2 <- c(149,157,133)

spectralst <- data.frame(band, time1, time2, time1p2, time2p2)


# plot the sepctral signatures
ggplot(spectralst, aes(x=band)) +
 geom_line(aes(y=time1), color="red", linetype="dotted") +
 geom_line(aes(y=time1p2), color="red", linetype="dotted") +
 geom_line(aes(y=time2), linetype="dotted") +
 geom_line(aes(y=time2p2), linetype="dotted") +
 labs(x="band",y="reflectance")

# image from Earth Observatory

eo <- brick("june_puzzler.jpg")
plotRGB(eo, 1,2,3, stretch="hist")
click(eo, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

# output
#     x     y  cell june_puzzler.1 june_puzzler.2 june_puzzler.3
# 1 93.5 373.5 76414            187            163             11
#      x     y   cell june_puzzler.1 june_puzzler.2 june_puzzler.3
# 1 219.5 285.5 139900             11            140              0
#     x     y   cell june_puzzler.1 june_puzzler.2 june_puzzler.3
# 1 184.5 315.5 118265             41             40             20


# define the columns of the dataset:
band <- c(1,2,3)
stratum1 <- c(187,163,11)
stratum2 <- c(11,140,0)
stratum3 <- c(41,40,20)

spectralsg <- data.frame(band, stratum1, stratum2, stratum3)

# plot the sepctral signatures
ggplot(spectralsg, aes(x=band)) +
 geom_line(aes(y=stratum1), color="yellow") +
 geom_line(aes(y=stratum2), color="green") +
 geom_line(aes(y=stratum3), color="blue") +
 labs(x="band",y="reflectance")

#-----------------------------------------------------------------------------
