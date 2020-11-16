# R spatial 
library(sp)

data(meuse)
head(meuse)

coordinates(meuse) = ~x+y

plot(meuse)
#how the zinc is spaced in our data
#spplot: plot a raster or other object (like zinc) spread in space 

#spplot(dataset, "colomn")
spplot(meuse, "zinc")

#main: title

spplot(meuse, "zinc", main= "zinc concentration")

spplot(meuse, "copper", main= "copper concentration")

#vedere sia zinco che copper
#prima soluzione
spplot(meuse, c("copper", "zinc")

#oppure
blabla <-c("zinc", "copper")
spplot (meuse, blabla)

#rather than using colours, use the function bubble

bubble(meuse, "zinc")

#do the same for lead
bubble(meuse, "lead")
bubble(meuse, "lead", col="red")
       
###install install.packages("ggplot2")
install.packages("ggplot2")
library(ggplot2) bioefuels

#ecological dataframe#	
#biofuels#
biofuels <- c(120, 200, 350, 570, 750) #array of various c
#oxydatavie enzymes#
oxydative <-c(1200, 1300, 21000, 34000, 50000)
	#dataframe

d <- data.frame(biofuels, oxydative)

#ggplot data aes (x=biofuels, y=oxydative)
ggplot(d, aes(x=biofuels, y=oxydative))
	
#funzione: geom_point()  --> geometry to built point inside the graph
	
ggplot(d, aes(x=biofuels, y=oxydative)) + geom_point()
ggplot(d, aes(x=biofuels, y=oxydative)) + geom_point(col ="red", size =5) + geom_line(col="green")
ggplot(d, aes(x=biofuels, y=oxydative)) + geom_polygon()      

## setwd("path/lab")
setwd("C:/Users/User/Desktop/lab/") #setwd("C:/Users/User/Desktop/lab/")
covid <- read.table( "covid_agg.csv", header=TRUE)
