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


#deforastation example 
library(raster)
library(RStoolbox)

setwd("C:/lab/")
defor1 <- brick("defor1_.jpg")

plotRGB(defor1, 1, 2, 3, stretch="Lin")

plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")

defor2 <- brick("defor2_.jpg")
plotRGB(defor2, 1, 2, 3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

##put the images one besides the other 

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")


#DVI for the first period 
dev.off()
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)


par(mfrow=c(2,1))
plot(dvi1, col=cl)
plot(dvi2, col=cl)

#aggiunta di titoli
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

# difference biomass before cut and after cut
difdvi <- dvi1 -dvi2
dev.off()
plot(difdvi)

cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost!")

hist(difdvi, col="red") #istogramma

#final par

#defor1
#defor2
#div1
#div2
#difdvi
#hist

par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi, col="red")
##ggplot is prof prefered##



