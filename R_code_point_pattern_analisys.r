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
