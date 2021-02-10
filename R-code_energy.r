#R code to view biomass 

install.packages("rasterdiv")
install.packages("rasterVis")

library(rasterVis)
library(rasterdiv)
library(raster)

data(copNDVI)  # means copernicus and NDVI realized image # we should remove the blue and brown part 
plot(copNDVI)  # the map: longterm NDVI= average value for each pixel 1999-2017 

copNDVI <- reclassify(copNDVI, cbind(253:255, NA)) # image can be coded --> different manner from 0 to 100 
plot(copNDVI)                                      # or 8 bit image= 256 values (253-255= blue)
                                                   # overwrite the previous file 
# the blue is not useful for us, the scale il from 0 to 252. 252=green= higher biomass
levelplot(copNDVI) 

clymin <- colorRampPalette(c('yellow','red','blue'))(100) # color yellow minimum 
plot(copNDVI, col=clymin)

clymed <- colorRampPalette(c('red','yellow','blue'))(100) # color yellow medium 
plot(copNDVI, col=clymed)

clymax <- colorRampPalette(c('blue','red','yellow'))(100) # color yellow maximum #the best map
plot(copNDVI, col=clymax)

#differences in the yellow high impact on our eyes. 

par(mfrow=c(1,2))  #do a multiframe (two different graphs one side the other #two columns 1 row
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

dev.off() #is used to remove the previous graph

#let's zoom in a certain part of the map
#italy_ext <- extention(c(0,20,35,55)) #does not work   # xmin xmax ymin ymax #long and latitude
ext <- c(0,20,35,55) #this works #extantion in which we are goig to zoom  

copNDVI_Italy <- crop(copNDVI, ext)  #crop the image based on the extent we decided 
plot(copNDVI_italy, col=clymax)


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



