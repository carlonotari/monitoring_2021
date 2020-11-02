> # write whatever you want
> 
> # this is an array
> primates <- c(3, 5, 9, 15, 40)
> primates
[1]  3  5  9 15 40
> 
> # new set:
> crabs <- c(100, 70, 30, 10, 5)
crabs
[1] 100  70  30  10   5

#first plot in R

plot( primates, crabs)

plot( primates, crabs, col="red")  #cambia il colore del pallino
plot (primates, crabs, col="red", pch=19)       #cambia la tipologia del pallino
primates <- c(3, 5, 9, 15, 40)
> 
> primates
[1]  3  5  9 15 40
> crabs <- c(100, 70, 30, 10, 5)
> 
> crabs
[1] 100  70  30  10   5
> 
> plot(primates, crabs)
> plot(primates, crabs, col= "red")    #cambia colore pallino
> plot(primates, crabs, col= "red", pch=19, cex=6) #cambia la tipologia del pallino e le dimensioni del pallimo
> plot(primates, crabs, col= "red", pch=19, cex=6, main=" My first ecologycal graph in R")  #main "titolo"
> 
# create a dataframe che è la tabella  
ecoset <- data.frame(primates, crabs)
# ecological numbers 
# mean number of individuals per site
(3+5+9+15+40)/5

#summary of the dataframe
summary(ecoset)
