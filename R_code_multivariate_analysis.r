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

pairs(p224r63_2011) # correlazione a 2 a 2 tra tutte le bande. Indice di correlazione di Pearson tra 0 e 1, 
# positivemente correlativi valori del coefficiente di Pearson vicino a 1, negativamente correlati più vicino a zero.
