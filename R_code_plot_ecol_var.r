# here you can write everyhing

# R code for plotting the relationship among ecological variables 

install.packages("sp")
library(sp)

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
