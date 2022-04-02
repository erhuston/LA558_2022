## ----install-packages---------------------------------------------
install.packages(c("tidycensus", "tidyverse", "tigris", "sf"))
library(tidycensus)
library(tigris)
library(tidyverse)
library(sf)
options(tigris_use_cache = TRUE)
census_api_key('74234dd562aefd0802555e6e149474bec2983418', overwrite=TRUE)



#The following example shows median household income from the 
#2015-2019 ACS for Census tracts in Boone County, Iowa
IowaMedianAgePublicTransport <- get_acs(state = "IA", 
                            geography = "county", 
                            variables = "B08103_004", 
                            geometry = TRUE)
head(IowaMedianIncome)
st_write(IowaMedianAgePublicTransport,"IowaMedianAgePublicTransport.geojson")

#Same as above but no Geometry
IowaMedianAgePublicTransport <- get_acs(state = "IA", 
                            geography = "county", 
                            variables = "B08103_004", 
                            geometry = FALSE)
head(IowaMedianIncome)
write.csv(IowaMedianAgePublicTransport,"IowaMedianAgePublicTransport.csv")





#The following example shows median household income from the 
#2015-2019 ACS for Townships in Boone County, Iowa
PolkMedianAgePublicTransport <- get_acs(state = "IA", 
                             county = "Polk", 
                             geography = "county subdivision", 
                             variables = "B08103_004", 
                             geometry = TRUE)
head(PolkMedianAgePublicTransport)
st_write(PolkMedianAgePublicTransport,"PolkMedianAgePublicTransport.geojson")


#Same as above but no Geometry
PolkMedianAgePublicTransport <- get_acs(state = "IA", 
                             county = "Polk", 
                             geography = "county subdivision", 
                             variables = "B08103_001",
                             geometry = FALSE)
head(PolkMedianAgePublicTransport)
write.csv(PolkMedianAgePublicTransport,"PolkMedianAgePublicTransport.csv")
