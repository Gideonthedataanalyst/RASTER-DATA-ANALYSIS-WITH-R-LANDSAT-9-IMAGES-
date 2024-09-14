#Install Required Packages

install.packages("sf")
install.packages("terra")
install.packages("ggplot2")
install.packages("raster")

#Load Required Libraries
library(ggplot2)  
library(raster)



#load landsat  images
setwd("C:/Users/Admin/Desktop/MASTERS GIS")

#Load the Landsat Bands
# Load individual bands
band1 <- raster("LC09_L1TP_168061_20240614_20240614_02_T1_B1.TIF")
band2 <- raster("LC09_L1TP_168061_20240614_20240614_02_T1_B2.TIF")
band3 <- raster("LC09_L1TP_168061_20240614_20240614_02_T1_B3.TIF")
band4 <- raster("LC09_L1TP_168061_20240614_20240614_02_T1_B4.TIF")
band5 <- raster("LC09_L1TP_168061_20240614_20240614_02_T1_B5.TIF")

# Print metadata to confirm the data is loaded correctly
print(band1)
print(band2)
print(band3)
print(band4)
print(band5)

#Combine Bands for Visualization
landsat_stack <- stack(band4, band3, band2) 
#for true color composite

#Plot the Data
plotRGB(landsat_stack, stretch = "lin")
plotRGB(landsat_stack, stretch = "hist")

# Convert raster to data frame for ggplot2
landsat_df <- as.data.frame(landsat_stack, xy = TRUE)





#Combine Bands for Visualization
landsat_false_color <- stack(band5, band4, band3)
plotRGB(landsat_false_color, stretch = "lin")

# Plot using histogram equalization to enhance contrast
plotRGB(landsat_false_color, stretch = "hist")





