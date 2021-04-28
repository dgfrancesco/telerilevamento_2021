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
#str(p224r63_2011res_pca) da info sulla struttura informatica del file
