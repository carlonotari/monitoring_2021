R code to view biomass 

install.packages("rasterdiv")
install.packages("rasterVis")

library(rasterVis)
library(rasterdiv)
library(raster)

data(copNDVI)
plot(copNDVI)
copNDVI <- reclassify(copNDVI, cbind(253:255, NA)) #toglie lo sfondo blu
plot(copNDVI)

levelplot(copNDVI) 

clymin <- colorRampPalette(c('yellow','red','blue'))(100) #

plot(copNDVI, col=clymin)



clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 

plot(copNDVI, col=clymed)

clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)


par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)


ext <- c(0,20,35,55)  # xmin xmax ymin ymax
copNDVI_Italy <- crop(copNDVI, ext)

copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_italy, col=clymax)
plot(copNDVI_Italy, col=clymax)


