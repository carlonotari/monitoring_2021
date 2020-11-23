# point pattern analisys

instal.packages("spatstat")
library(spatstat)

#presentation pattern analisys: 20/11/2020
#density of the point releted to analisys

######### IMPORT DATA FROM AN EXTERNAL SOURCE

 

# setwd("path/lab")

 

# setwd for Windows
# setwd("C:/lab/")

 

# setwd Mac
# setwd("/Users/yourname/lab/")

 

# Linux
setwd("~/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid

###let's see the density of the covi data
###make a planar point pattern in spatstat
attach(covid)
###x cordinate-->lon , y cordinate-->lat,  and the range (max e min of the variables)
###il range lo puoi trovare con la funzione summary

covid_planar <- ppp(lon, lat, c(-180,+180), c(-90,90)) 
density_map <- density(covid_planar)
plot(density_map)
points(covid_planar) #sovrappone i puntini al  grafico density_map

cl <- colorRampPalette(c('yellow','orange','red'))(100) #

plot(density_map, col = cl)
points(covid_planar)

cl2 <-colorRampPalette(c('darkred','darkgoldenrod1','darkgray'))(100)

####PUTTING the countries on top the map

##density how much point are there?  #### lesson 23 november

library(spatstat)

setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
head(covid)
attach(covid)

covid_planar <- ppp(lon, lat, c(-180,+180), c(-90,90))
density_map <- density(covid_planar)
plot(density_map)
points(covid_planar)
cl2 <-colorRampPalette(c('darkred','darkgoldenrod1','darkgray'))(100)
plot(density_map, col = cl2)
 ### cambiano i colori
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100) #
plot(density_map, col = cl)
points(covid_planar)

library(rgdal)
## readOGR--> read vector map into spatial objects 
coastline <-readOGR("ne_10m_coastline.shp")
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100)
plot(density_map, col = cl)
points(covid_planar, pch)

plot(coastline, add = TRUE) #add = TRUE significa che vogliamo aggiungere quella funzione alla mappa precedente
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar)
plot(coastline, add = TRUE)


cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastline, add = TRUE)

#salvare file png
png("figure1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastline, add = TRUE)
dev.off()


#salvare file.pdf
pdf("figure1.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastline, add = TRUE)
dev.off()


#interpolation: case data

marks(covid_planar) <- cases  #cases is a coloum of covid file
#to do intepilation the function is smooth 
cases_map<-Smooth(covid_planar)

plot(cases_map, col = cl)
points(covid_planar)
plot(coastline, add = T)






