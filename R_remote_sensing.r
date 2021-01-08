#R code for remore sensing data analysis in ecosistem monitoring 

library(raster)
library(RStoolbox)

setwd("C:/lab/") 
p224r63_2011 <- brick("p224r63_2011_masked.grd")

plot(p224r63_2011) #leggere il file 
cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)
plot(p224r63_2011$B1_sre, col=clb)

par(mfrow=c(2,2))  #ordinare le immagini

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
 
plot(p224r63_2011$B1_sre, col=clb)




##### ho rifatto tutto####
library(RStoolbox)
setwd("C:/lab/") 
p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011)
cl <- colorRampPalette(c('black','grey','light grey'))(100)
plot(p224r63_2011, col=cl)
plot(p224r63_2011$B1_sre, col=clb)
Error in .asRaster(x, col, breaks, zrange, colNA, alpha = alpha) : 
  oggetto "clb" non trovato
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100)
plot(p224r63_2011$B1_sre, col=clb)
par(mfrow=c(2,2))
par(mfrow=c(2,2))

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
  
plot(p224r63_2011$B1_sre, col=clb)
clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c('dark red','red','pink'))(100) #
plot(p224r63_2011$B3_sre, col=clr)
cln <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_2011$B4_sre, col=cln)



dev.off()
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") ###cambia l'immagine in infrarossi 
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") ##green component
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin") ## blue component

par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
