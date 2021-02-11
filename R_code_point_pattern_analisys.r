# point pattern analisys

instal.packages("spatstat")
library(spatstat)

#presentation pattern analisys: 20/11/2020
#density of the point releted to analisys

######### IMPORT DATA FROM AN EXTERNAL SOURCE #working directory

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
###il range lo puoi trovare con la funzione summary #summary function helps to find the range 

covid_planar <- ppp(lon, lat, c(-180,+180), c(-90,90)) 
density_map <- density(covid_planar)
plot(density_map)
points(covid_planar) #sovrappone i puntini al  grafico density_map

cl <- colorRampPalette(c('yellow','orange','red'))(100) #change the color of the map

plot(density_map, col = cl)
points(covid_planar)

cl2 <-colorRampPalette(c('darkred','darkgoldenrod1','darkgray'))(100) #change the color of the map

####PUTTING the countries on top the map

##density how much point are there? 
#### lesson 23 november

library(spatstat)

setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
head(covid) #show the initial part of file 
attach(covid)  #he database is searched by R when evaluating a variable

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

#### 27/11
###plotting points with different size related to covid data togheter with the interpolation 

library(spatstat)
library(rgdal)

setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
head(covid)

attach(covid) # if you do not attach: covid$lon
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

marks(covid_planar) <- cases 
cases_map<-Smooth(covid_planar)

cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
##to change colour: https://www.datanovia.com/en/blog/r-colors-amazing-resources-you-want-to-know/

plot(cases_map, col = cl)

install.packages("sf")
library(sf)
Spoints <- st_as_sf(covid, coords = c("lon", "lat"))
plot(Spoints, cex=Spoints$cases, col = 'purple3', lwd = 3, add=T)

cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T)

 ####30/11 °leggiamo i dati di leonardo sulla laguna di venezia #leo's data about venice!

library(spatstat)
setwd("C:/lab/")
leo <- read.table("dati_zabotti.csv", header=T, sep=",")
attach(leo)

summary(leo)
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))

plot(leo_ppp)
density_map <- density(leo_ppp)

plot(density_map)
points(leo_ppp)

###SFASO MIO###

###marks(leo_ppp) <- t
####leo_map<-Smooth(leo_ppp)

#####cl <- colorRampPalette(c('black','darkblue','black','red3','maroon'))(100000)

##### interpolation of student's data

setwd("C:/lab/")
load("point_pattern_analysis.RData")
ls() #vengono fuori un sacco di risultati ma non è un problema se si usa il $. tipo che R salva tutti i nomi usati con la funzione ls 
#list of the file I created
head(leo)

library(spatstat)
attach(leo)
marks(leo_ppp) <- chlh
chlh_map <- Smooth(leo_ppp)
plot(chlh_map, col=cl)
cl <- colorRampPalette(c('yellow','orange','red','green'))(100) # 
points(leo_ppp)

# exercise: do the same with chlorophil in the sediment 

library(spatstat)
attach(leo)
marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp)
plot(chls_map, col=cl)
cl <- colorRampPalette(c('yellow','orange','red','green'))(100)  
points(leo_ppp)

###put all graph in one row using multipanel function 
par(mfrow=c(1,3))
#first graph is density map
plot(density_map, col = cl) 
points(leo_ppp)

#second graph 
plot(chlh_map, col=cl)
points(leo_ppp)
plot(chls_map, col=cl)
points(leo_ppp)

#####questo sotto funziona 
par(mfrow=c(1,3))
 #first graph is density map
plot(density_map, col = cl) 
points(leo_ppp)
 
#second graph 
plot(chlh_map, col=cl)
points(leo_ppp)
plot(chls_map, col=cl)
points(leo_ppp)

##### cambiare l'ordine e invece che in riga in colonna 
par(mfrow=c(3,1))
 #first graph is density map
plot(density_map, col = cl) 
points(leo_ppp)
 
#second graph 
plot(chlh_map, col=cl)
points(leo_ppp)
plot(chls_map, col=cl)
points(leo_ppp)
