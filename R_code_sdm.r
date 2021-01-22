#R_code_sdm.r species distribution model

library(sdm)
library(raster)
library(rgdal)

#import the species data
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)  #readOGR 

plot(species, pch=17)

species$Occurrence

plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)
