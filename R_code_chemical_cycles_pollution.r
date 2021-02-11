
library(raster)  #Geographic Data Analysis and Modeling 
                 #Reading, writing, analyzing and modeling of spatial data. 

setwd("C:/lab/")   # setting the working directory

EN01 <- raster("EN_0001.png")   #importing images 
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

cl <- colorRampPalette(c('red','orange','yellow'))(100) #chenging the colours 
par(mfrow=c(1,2))     #par - multiframe # 1 row and 2 columns 
plot(EN01, col=cl)    #plot the january image on the left
plot(EN13, col=cl)    #plot the march image on the right 


difno2 <- EN01 - EN13    #the minus do the difference between the each pixel 
cldif <- colorRampPalette(c('blue','black','yellow'))(100) # 
plot(difno2, col=cldif)   #plot the difference 

#fancy video like a machine gun 
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

par(mfrow=c(4,4))   #create a grid (griglia) 4 times 4
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

# Otherwise:
# rlist <- list.files(pattern="EN")
# rlist 
# list_rast <- lapply(rlist, raster)
# ENstack <- stack(list_rast)



#make a stack
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13) ##metodo più easy per mettere tutte le immagini in colonna/righe
plot(EN, col=cl)                                                              #fast and easy way to do the same thing, putting the images in columns and rows 

# plot(RGB)
dev.off()
plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")  #
#Red-Green-Blue Plot Of A Multi-Layered Raster Object
#Make a Red-Green-Blue plot based on three layers
#we want to make a plot RGB putting the 13 in the red channel the 7 in the green and the 1 in blue 

#boxplot
dev.off()
boxplot(EN,horizontal=T,axes=T,outline=F)   #Produce box-and-whisker plot(s) of the given (grouped) values
                                            # graph with different box of different images        
                                            # we create a graph within 13 box one per images and the median value which rapresent NO2
boxplot(EN,horizontal=T,axes=T,outline=F,col="red",xlab="NO2 - 8bit",ylab="Period") #8 bit: rage from 0 to 256
                                                                                     #lab means label 
