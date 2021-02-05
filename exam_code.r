# exam code 

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
