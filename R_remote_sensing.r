#R code for remore sensing data analysis in ecosistem monitoring 

library(raster)
library(RStoolbox)  #Tools for Remote Sensing Data Analysis

setwd("C:/lab/") 
p224r63_2011 <- brick("p224r63_2011_masked.grd")   #multi-layer

plot(p224r63_2011) #leggere il file 
cl <- colorRampPalette(c('black','grey','light grey'))(100) # change the colors 

plot(p224r63_2011, col=cl)

par(mfrow=c(2,2))  #ordinare le immagini #2 rows and 2 columns 

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # change the color 
plot(p224r63_2011$B1_sre, col=clb)
clg <- colorRampPalette(c('dark green','green','light green'))(100) #
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c('dark red','red','pink'))(100) #
plot(p224r63_2011$B3_sre, col=clr)

clnir <- colorRampPalette(c('red','orange','yellow'))(100) # near infra red
plot(p224r63_2011$B4_sre, col=clnir)


dev.off()
  
plot(p224r63_2011$B1_sre, col=clb)
clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c('dark red','red','pink'))(100) #
plot(p224r63_2011$B3_sre, col=clr)
cln <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_2011$B4_sre, col=cln)



dev.off()
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") ###cambia l'immagine in infrarossi #show infrared
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") ##green component
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin") ## blue component

par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")  #change the component
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
