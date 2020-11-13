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
