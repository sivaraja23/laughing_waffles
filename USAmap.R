# We install the ggmap package
# This only needs to be done ONE TIME.
# You will not need to do this again.
install.packages("ggmap")

# We load the ggmap.
# This needs to be done every time
# that you want to make a map.
library(ggmap)


myDF <- read.csv("http://stat-computing.org/dataexpo/2009/airports.csv")

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
USA_center = as.numeric(geocode("USA"))
# Then we build a map of Los Angeles
USAmap <- ggmap(get_googlemap(center=USA_center,zoom=9))
# and we display it.
USAmap

# Finally, we add the points to the map
USAmap<-USAmap+ geom_point(data=mypoints, size=0.1)
# and we display the map again.
USAmap



