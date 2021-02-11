#exam file 2


# exam code 
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
# https://cran.r-project.org/web/packages/ncdf4/index.html

#library 
library(ncdf4)
library(raster)

setwd("C:/exam_m/")  #setting the working directory
#####

#visone del mondo ' 2000 vs 2020

#al00 <- raster("j2000.nc")     #importing images   # https://land.copernicus.vgt.vito.be/PDF/free?productID=30608047&collectionID=1000174&fileIndex=0
#al20 <- raster("j2020.nc")     #importing images   # https://land.copernicus.vgt.vito.be/PDF/free?productID=56032676&collectionID=1000174&fileIndex=0

clal <- colorRampPalette(c('goldenrod1','firebrick1','darkslateblue'))(100)   #it changes the color of the map 

par(mfrow=c(2,1))   #par is used to put multiple graphs in a single plot # mfrow stays for multiframe row in this case # 2 rows and 1 columns

plot(al00, col=clal, main="albedo in january 2000")
plot(al20, col=clal, main="albedo in january 2020") 


##### fin qui bene!!!


# gennaio: alpi  00 vs alpi 20
# giugno: alpi 00 vs 20

gen_al00 <- raster("j2000.nc")  #importing images 
ext <- c(0,20,40,55)        #extantion in which we are goig to zoom     #long and latitude     xmin xmax ymin ymax #long and latitude
clal <- colorRampPalette(c('goldenrod1','firebrick1','darkslateblue'))(100)
gen_al00 <- crop(gen_al00, ext)

gen_al20 <- raster("gen2020_1.nc") #importing images
ext <- c(0,20,40,55)         #xmin xmax ymin ymax #long and latitude
clal <- colorRampPalette(c('goldenrod1','firebrick1','darkslateblue'))(100)
gen_al20 <- crop(gen_al20, ext)

giu_al00 <- raster("al_giugno_2000.nc")  #importing images
ext <- c(0,20,40,55)          #xmin xmax ymin ymax #long and latitude
clal <- colorRampPalette(c('goldenrod1','firebrick1','darkslateblue'))(100)
giu_al00 <- crop(giu_al00, ext)

giu_al20 <- raster("al_giugno2020.nc") #importing images
ext <- c(0,20,40,55)         #xmin xmax ymin ymax #long and latitude
clal <- colorRampPalette(c('goldenrod1','firebrick1','darkslateblue'))(100)
giu_al20 <- crop(giu_al20, ext)


par(mfrow=c(2,2))    #2 rows and 2 columns

plot(gen_al00, col=clal, main="gennaio 2000")
plot(gen_al00, col=clal, main="gennaio 2020")
plot(giu_al00, col=clal, main="giugno 2000")
plot(giu_al20, col=clal, main="giugno 2020")



# ha funzionatoooo

########
#plottare differenza albedo

difgen <- gen_al00 - gen_al20
difgiu <- giu_al00 - giu_al20

cldif <-colorRampPalette(c('blue','red','gold1'))(100)


par(mfrow=c(1,2))

plot(difgen, col=cldif, main="variation gennaio") 
plot(difgiu, col=cldif, main="variation june")
 

## non ci credo: si può fareeeeee
#it could work
#img:frankestain junior  
############
