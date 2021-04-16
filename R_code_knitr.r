# R_code_knitr.r

setwd("~/lab/greenland") # Linux
# setwd("C:/lab/greenland") # Windows
# setwd("/Users/name/Desktop/lab/greenland") # Mac 

library(knitr)  # oppure require("knitr")

#stitch("~/Downloads/R_code_greenland.r", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
stitch("C:/lab/R_code_greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
