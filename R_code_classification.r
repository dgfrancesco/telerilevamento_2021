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
plot(soe$map)

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
