# exam code 

library(ncdf4)
library(raster)

setwd("C:/exam_m/")

al99<- raster("1999.nc")
al20<- raster("2020.nc")
plot(al99)
plot(al20)



#zoom siberia 

ext <- c(-150,150,40,150)
zoom(al99, ext=ext)
zoom(al20, ext=ext)

ext <- c(-150,150,40,150)
zoom(al20, ext=ext)


clal99 <- colorRampPalette(c('blue','white','red'))(100)  #CAMBIA STI COLORI BASTA!!
jan20 <- crop(jan20, ext)
plot(jan20, col=cljan20, main="titolo")




dift <- tjan - toct #differenza jennaio meno ottobre 
cldif <- colorRampPalette(c('blue','white','red'))(100) # 
plot(dift, col=cldif)



















# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
 
# nc data: we need library
# https://cran.r-project.org/web/packages/ncdf4/index.html
# install.packages("ncdf4")
library(ncdf4)
library(raster)


setwd("C:/exam_m/") # windows

# importing images #funzione raster 

jan20_fire <- raster("c_gls_BA300_202001100000_GLOBE_PROBAV_V1.1.1.nc")  #prima immagine
plot(jan20_fire)

jan19_fire <- raster("c_gls_BA300_201901100000_GLOBE_PROBAV_V1.1.1.nc")  #seconda immagine 
plot(jan19_fire)

# change the colorramppalette
cljan20 <- colorRampPalette(c('blue','yellow','red'))(100) # 
plot(jan20_fire, col=cljan20)

plot(jan19_fire, col=cljan20)

dift <- tjan - toct #differenza jennaio meno ottobre 
cldif <- colorRampPalette(c('blue','white','red'))(100) # 
plot(dift, col=cldif)


# zoomare australia 
jan20 <-raster("firegen20.nc")
ext <- c(110,160,-45,-10)
zoom(jan20, ext=ext)
cljan20 <- colorRampPalette(c('blue','white','red'))(100)  #CAMBIA STI COLORI BASTA!!
jan20 <- crop(jan20, ext)
plot(jan20, col=cljan20, main="titolo")



### tentativo due ghiaccio 
library(ncdf4)
library(raster)

setwd("C:/exam_m/") # windows

# importing images #funzione raster 

icejan21 <- raster("ice_2021.nc")  #prima immagine
plot(icejan21)

icejan???<- raster("c_gls_BA300_201901100000_GLOBE_PROBAV_V1.1.1.nc")  #seconda immagine 
plot(jan19_fire)

ext <- c(0,20,35,50)
zoom(icejan21, ext=ext)

cljan20 <- colorRampPalette(c('blue','white','red'))(100)  #CAMBIA STI COLORI BASTA!!
jan20 <- crop(jan20, ext)
plot(jan20, col=cljan20, main="titolo")

