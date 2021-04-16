# R_code_knitr.r

setwd("~/lab/greenland") # Linux
# setwd("C:/lab/greenland") # Windows
# setwd("/Users/name/Desktop/lab/greenland") # Mac 

library(knitr)  # oppure require("knitr")

stitch("~/Downloads/R_code_temp.r", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
