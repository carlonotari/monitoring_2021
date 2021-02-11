# here you can write everyhing

# R code for plotting the relationship among ecological variables 

install.packages("sp")
library(sp)  #used to modify spatial data 

#data is used to recall datasets
data(meuse)

#llock insiede the set

meuse #horrible list of data

#View is written with capital letter, and allow to see the data like a table 
View(meuse)

#Exercize #mean of all of the variables 

summary(meuse)

#exercise: plot zinc (y)against cadmiunm(x)

# $ allow to link 

plot(meuse$cadium, meuse$zinc)

attach(meuse)
plot(cadmium, zinc)

#Scatterplot Matrices 
pairs(meuse)

#question!!!
#pairing only the element part f the dataset
#caddmium copper lead zinc

###lecture 2###
##recall sp, and meuse##

library(sp)
data(meuse)
meuse
pairs(meuse)

head(meuse)

#cadmium copper lead zinc
#pairs with soil variables
#from the 3rd to 6th

pairs(meuse[,3:6]) #richiamare dalla terza alla sesta colonna

#let's use the name of the coloums:
pairs(~cadmium + copper + lead + zinc, data=meuse) #tilde alt + 126 (dal bloc numb)

#let's prettify the graph
#exercize
data.set(meuse[,3:6])
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red")
#par() function changes colour of single panels 

#exercise: change the symbol to filled triangles 
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17)
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17, cex=6)





