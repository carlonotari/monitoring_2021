# exam code 
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
# https://cran.r-project.org/web/packages/ncdf4/index.html

#library 
library(ncdf4)   #to use the .nc file extention 
library(raster)    #to analyse spatial data

setwd("C:/exam_m/")  #setting the working directory
#####

#visone del mondo ' 99 vs 2019
#world images 99 and 2019 

al99 <- raster("inv_99.nc")     #importing images   # https://land.copernicus.vgt.vito.be/PDF/free?productID=30608047&collectionID=1000174&fileIndex=0
al20 <- raster("inv_19.nc")     #importing images   # https://land.copernicus.vgt.vito.be/PDF/free?productID=56032676&collectionID=1000174&fileIndex=0

clal <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)   #it changes the color of the map 

par(mfrow=c(2,1))   #par is used to put multiple graphs in a single plot # mfrow stays for multiframe row in this case # 2 rows and 1 column

plot(al99, col=clal, main="albedo in january 1999")     #plot function, col=link to colorRampPalette, main=title 
plot(al20, col=clal, main="albedo in january 2019")     #plot function, col=link to colorRampPalette, main=title 


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
al_inv19  <- crop(al_inv19 , ext)       #crop function, cut the image thanks to the value of ext

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


difinv <- al_inv99 - al_inv19       # the minus function, calculate the difference for every pixels of each file 
difest <- al_est99 - al_est19

par(mfrow=c(1,2))        # one rows and two columns 

cldif <-colorRampPalette(c('red','gold1','blue'))(100)

plot(difinv, col=cldif, main="winter variation")
plot(difest, col=cldif, main="summer variation") 





