# exam code 

# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
 
# nc data: we need library
# https://cran.r-project.org/web/packages/ncdf4/index.html
# install.packages("ncdf4")
library(ncdf4)
library(raster)


setwd("C:/exam_m/") # windows

dec_fire <- raster("c_gls_BA300_201912100000_GLOBE_PROBAV_V1.1.1.nc")
plot(dec_fire)
march_fire <- raster("c_gls_BA300_202003310000_GLOBE_PROBAV_V1.1.1.nc")
plot(march_fire)

