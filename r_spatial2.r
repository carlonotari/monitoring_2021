## setwd("path/lab")
setwd("C:/Users/User/Desktop/lab/") #setwd("C:/Users/User/Desktop/lab/")
covid <- read.table( "covid_agg.csv", header=TRUE) #true permette di vedere la prima riga, false no, così da vedere solo i dati e non la categoria
head(covid) #per vedere l'inizio del file
summary(covid   #breve analisi di dati--> media max min etc
name(covid) #ti dice il nome delle variabili
# ggplot2
library(ggplot2)
ggplot(covid, aes(x=lon, y=lat)) + geom_point()   #x=longitudine(lon) y=latitudine(lat) --> questo lo vedi dall summary
#change the size of our data according the number of cases
ggplot(covid, aes(x=lon, y=lat, size = cases)) + geom_point() #cambia la dimensione del puntino in vase ai casi 
