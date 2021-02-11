# exam code 
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
# https://cran.r-project.org/web/packages/ncdf4/index.html

#library 
library(ncdf4)
library(raster)

setwd("C:/exam_m/")  #setting the working directory
#####

#visone del mondo ' 99 vs 2020

al99 <- raster("inv_99.nc")     #importing images   # https://land.copernicus.vgt.vito.be/PDF/free?productID=30608047&collectionID=1000174&fileIndex=0
al20 <- raster("inv_19.nc")     #importing images   # https://land.copernicus.vgt.vito.be/PDF/free?productID=56032676&collectionID=1000174&fileIndex=0

clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)   #it changes the color of the map 

par(mfrow=c(1,2))   #par is used to put multiple graphs in a single plot # mfrow stays for multiframe row in this case # 1 rows and 2 columns

plot(al99, col=clal, main="albedo in january 1999")
plot(al20, col=clal, main="albedo in january 2019") 


##### fin qui bene!!!

# 4 different plot of the greenland region 

# winter '99
al_inv99 <- raster("inv_99.nc")  #importing images
ext <- c(-80,-10,60,90) 
al_inv99 <- crop(al_inv99, ext)

# summer '99
al_est99 <- raster("est_99.nc")  #importing images
ext <- c(-80,-10,60,90) 
al_est99 <- crop(al_est99, ext)

# winter '19
al_inv19 <- raster("inv_19.nc")  #importing images
ext <- c(-80,-10,60,90) 
al_inv19  <- crop(al_inv19 , ext)

# summer '19
al_est19 <- raster("est_19.nc")  #importing images
ext <- c(-80,-10,60,90) 
al_est19 <- crop(al_est19, ext)


# plot the four images  
clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)
par(mfrow=c(2,2))    #2 rows and 2 columns

plot(al_inv99, col=clal, main="winter '99")
plot(al_est99, col=clal, main="summer '99")
plot(al_inv19, col=clal, main="winter '19")
plot(al_est19, col=clal, main="summer '19")


###differences 


difinv <- al_inv99 - al_inv19
difest <- al_est99 - al_est19

par(mfrow=c(1,2))

cldif <-colorRampPalette(c('blue','red','gold1'))(100)

plot(difinv, col=cldif, main="winter variation")
plot(difest, col=cldif, main="summer variation") 


#dif 2

difinv2 <- al_inv19 - al_inv99
difest2 <- al_est19 - al_est99

cldif <-colorRampPalette(c('blue','red','gold1'))(100)

par(mfrow=c(1,2))

plot(difinv2, col=cldif, main="winter variation")
plot(difest2, col=cldif, main="summer variation") 

# siberia 99 vs siberia 19

sib_al99 <- raster("inv_99.nc")  #importing images 
ext <- c(0,150,40,80)              
sib_al99 <- crop(sib_al99, ext)

sib_al19 <- raster("inv_19.nc") #importing images
ext <- c(0,150,40,80)
sib_al19 <- crop(sib_al19, ext)

par(mfrow=c(1,2))

clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)

plot(sib_al99, col=clal, main="Siberia winter '99")
plot(sib_al19, col=clal, main="Siberia winter '19")

#dif3

difsib <- sib_al19 - sib_al99
plot(difsib, col=cldif, main="siberian variation")




####################################










gro_al99 <- raster("j1999.nc")  #importing images
ext <- c(-130,-50,40,60)
zoom(gro_al99, ext=ext)
clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)
gro_al99 <- crop(gro_al99, ext)

gro_al20 <- raster("j2020.nc") #importing images
ext <- c(-130,-50,40,60)
zoom(gro_al20, ext=ext)
clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)
gro_al20 <- crop(gro_al20, ext)


par(mfrow=c(2,2))    #2 rows and 2 columns

plot(sib_al99, col=clal, main="Siberia 1999")
plot(sib_al20, col=clal, main="Siberia 2020")
plot(gro_al99, col=clal, main="Greenland 1999")
plot(gro_al20, col=clal, main="Greenland 2020")


# ha funzionatoooo

########
#plottare differenza albedo

difs <- sib_al99 - sib_al20
difg <- gro_al99 - gro_al20 

cldif <-colorRampPalette(c('white','blue','gold1'))(100)


par(mfrow=c(2,1))

plot(difs, col=cldif, main="variation Siberia") 
plot(difg, col=cldif, main="variation Greenland")
 

## non ci credo: si può fareeeeee
#it could work
#img:frankestain junior  
############


library(ncdf4)
library(raster)

setwd("C:/exam_m/")

al99 <- raster("l2000.nc")     #importing images   # https://land.copernicus.vgt.vito.be/PDF/free?productID=30608047&collectionID=1000174&fileIndex=0
al20 <- raster("l2019.nc")     #importing images   # https://land.copernicus.vgt.vito.be/PDF/free?productID=56032676&collectionID=1000174&fileIndex=0

clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)   #it changes the color of the map 

par(mfrow=c(1,2))   #par is used to put multiple graphs in a single plot # mfrow stays for multiframe row in this case # 1 rows and 2 columns

plot(al99, col=clal, main="albedo in july 1999")
plot(al20, col=clal, main="albedo in july 2020") 



sib_al99 <- raster("l2000.nc")  #importing images 
ext <- c(0,150,40,60)              
zoom(sib_al99, ext=ext)
clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)
sib_al99 <- crop(sib_al99, ext)

sib_al20 <- raster("l2019.nc") #importing images
ext <- c(0,150,40,60)
zoom(sib_al20, ext=ext)
clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)
sib_al20 <- crop(sib_al20, ext)


gro_al99 <- raster("l2000.nc")  #importing images
ext <- c(-130,-50,40,60)
zoom(gro_al99, ext=ext)
clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)
gro_al99 <- crop(gro_al99, ext)

gro_al20 <- raster("l2019.nc") #importing images
ext <- c(-130,-50,40,60)
zoom(gro_al20, ext=ext)
clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)
gro_al20 <- crop(gro_al20, ext)


par(mfrow=c(2,2))    #2 rows and 2 columns

plot(sib_al99, col=clal, main="Siberia 1999")
plot(sib_al20, col=clal, main="Siberia 2020")
plot(gro_al99, col=clal, main="Greenland 1999")
plot(gro_al20, col=clal, main="Greenland 2020")




#####


difs <- sib_al99 - sib_al20
difg <- gro_al99 - gro_al20 

cldif <-colorRampPalette(c('blue','white','red'))(100)


par(mfrow=c(2,1))

plot(difs, col=cldif, main="variation Siberia") 
plot(difg, col=cldif, main="variation Greenland")


