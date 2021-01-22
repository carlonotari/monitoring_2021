#R_code_sdm.r species distribution model

library(sdm)
library(raster)
library(rgdal)

#import the species data
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)  #readOGR 

plot(species, pch=17)

species$Occurrence
path <- system.file("external", package="sdm") 


plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)

path <- system.file("external", package="sdm") 

# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

# stack = pack all of the data in a stack
preds <- stack(lst)

# plot preds
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], pch=17)

plot(preds$elevation, col=cl, main='elevation') #aggiunto il titolo
points(species[species$Occurrence == 1,], pch=17)

plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$precipitation, col=cl, main='precipitation')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,], pch=17)

# model

# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)

m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds) 
# make the raster output layer
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)

# plot the output
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)

# add to the stack
s1 <- stack(preds,p1)
plot(s1, col=cl)



