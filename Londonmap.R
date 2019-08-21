# We install the ggmap package
# This only needs to be done ONE TIME.
# You will not need to do this again.
install.packages("ggmap")

# We load the ggmap.
# This needs to be done every time
# that you want to make a map.
library(ggmap)

# Now we load the information from the AirBnB data
# for the city of Los Angeles.
myDF <- read.csv("/class/datamine/data/airbnb/united-states/ca/london/2019-07-08/visualisations/listings.csv")

# Here are the first 6 lines of this file:
head(myDF)
# and the dimensions of the file:
dim(myDF)

# These are the longitudes and latitudes:

myDF$longitude
myDF$latitude

# Now we build a new data.frame containing
# only the longitudes and latitudes.
mypoints <- data.frame(lon=myDF$longitude,lat=myDF$latitude)

# We use Dr Ward's Google API key,
# so that we are able to load maps in Google.
register_google(key = "AIzaSyA6sEoICr-nGUtUX0uekAT4Gg94CofSelg", write = TRUE)

# In preparation for making a map,
# we get the center of Los Angeles from Google:
london_center = as.numeric(geocode("London"))
# Then we build a map of Los Angeles
Londonmap <- ggmap(get_googlemap(center=london_center,zoom=9))
# and we display it.
Londonmap

# Finally, we add the points to the map
Londonmap <- Londonmap + geom_point(data=mypoints, size=0.1)
# and we display the map again.
Londonmap
# One final remark:
# 3 locations are far enough away from the center
# of Los Angeles that they do not show up.



