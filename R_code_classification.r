# R code classification.r
library(raster)
library(RStoolbox)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac 

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg") #create a rasterbrick objects
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
plot(soe$map)

#Doenload an image from: https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images
sun <- brick("Sun.png") 
# Unsupervised Classification
set.seed(42)  # questa funzione serve per avere sempre le stesse repliche per fare il modello
sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)
