# exam code 
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
# https://cran.r-project.org/web/packages/ncdf4/index.html


library(ncdf4)
library(raster)

setwd("C:/exam_m/")
#####

#visone del mondo ' 99 vs 2020

al99 <- raster("1999.nc") 
al20 <- raster("2020.nc")

clal <- colorRampPalette(c('blue','yellow','red'))(100)

par(mfrow=c(1,2))

plot(al99, col=clal, main="albedo during 1999")
plot(al20, col=clal, main="albedo during 2020") 


##### fin qui bene!!!

# siberia 99 vs siberia 20 e groellandia 99 vs groellandia 20 

sib_al99 <- raster("1999.nc")
ext <- c(0,150,40,60)
zoom(sib_al99, ext=ext)
clal <- colorRampPalette(c('blue','yellow','red'))(100)
sib_al99 <- crop(sib_al99, ext)

sib_al20 <- raster("2020.nc")
ext <- c(0,150,40,60)
zoom(sib_al20, ext=ext)
clal <- colorRampPalette(c('blue','yellow','red'))(100)
sib_al20 <- crop(sib_al20, ext)


gro_al99 <- raster("1999.nc")
ext <- c(-130,-50,40,60)
zoom(gro_al99, ext=ext)
clal <- colorRampPalette(c('blue','yellow','red'))(100)
gro_al99 <- crop(gro_al99, ext)

gro_al20 <- raster("2020.nc")
ext <- c(-130,-50,40,60)
zoom(gro_al20, ext=ext)
clal <- colorRampPalette(c('blue','yellow','red'))(100)
gro_al20 <- crop(gro_al20, ext)


par(mfrow=c(2,2))

plot(sib_al99, col=clal, main="siberia during 1999")
plot(sib_al20, col=clal, main="siberia during 2020")
plot(gro_al99, col=clal, main="greenland 1999")
plot(gro_al29, col=clal, main="greenland 2020")


# ha funzionatoooo

########
#plottare differenza albedo

difs <- sib_al99 - sib_al20
difg <- gro_al99 - gro_al20 

cldif <-colorRampPalette(c('white','blue','red'))(100)


par(mfrow=c(2,1))

plot(difs, col=cldif, main="differenza siberia") 
plot(difg, col=cldif, main="differenza groellandia")
 

## non ci credo: si può fareeeeee
#img:frankestain junior  
############





