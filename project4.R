# Use the function read.csv to read in the data about the 2019 airplane flights
myDF <- read.csv("http://stat-computing.org/dataexpo/2009/airports.csv")

#this data frame is for the taxi data
myDF2 <- read.csv("/class/datamine/data/taxi/yellow/yellow_tripdata_2019-06.csv")

myDF3 <- read.delim("/class/datamine/data/election/itcont2020.txt", sep="|")

# This file has almost 3 million records, and 110 columns:
dim(myDF)

# Here are the first 6 flights:
head(myDF)

# The names of the columns are:
names(myDF)

# These are the 3-letter codes of the airports where flights have their origins:
table(myDF$ORIGIN)

# Here they are in sorted order:
sort(table(myDF$ORIGIN))

# and the most popular ones are
# Los Angeles, Charlotte, Denver, Dallas-Fort Worth, O'Hare, and Atlanta:
tail(sort(table(myDF$ORIGIN)))

# The origin airports of the first 100 flights are:
head(myDF$ORIGIN, n=100)

# Notice that R starts each line with the number of the current data point.
# This varies, according to the width of your screen!

# The destination airports of the first 100 flights are:
head(myDF$DEST, n=100)

# We can paste the cities and states
head(paste(myDF$city,myDF$state), n=100)

# In other words, the first several flights are all from MSP (Minneapolis) to CVG (Cincinnati)
# and (more generally) we give each origin-to-destination pair, with a space in between.

# We can make a table of all of the possible flight paths
# with the counts about how often they are used:
table(paste(myDF$city, myDF$state))

# It makes more sense to show the results in sorted order:
sort(table(paste(myDF$city, myDF$state)))

# but this is a long table, so we show the tail:
tail(sort(table(paste(myDF$city, myDF$state))))

# OK, so we see that the most popular flight path is from LGA (LaGuardia) to ORD (O'Hare)

# We can insert a new column in our data frame, which we choose to call "myflightpath"
# but you can pick any name that you like, for this new column in the data frame.
myDF$myflightpath <- paste(myDF$ORIGIN, myDF$DEST)
myDF$City_State<- paste(myDF$city,myDF$state)
# and now we see this new column at the end of our data frame:
head(myDF$DEP_DELAY)

# We usually *only* look at the head, because
# there are too many flights to look at them all with our eyeballs.

# The departure delays (in minutes) of flights are given in this column:
head(myDF)

# For instance, the average departure delay is not available, because some of the data is missing
mean(myDF2$fare_amount)
mean(myDF2$fare_amount, na.rm=T)
mean(myDF2$passenger_count)
mean(myDF2$passenger_count, na.rm=T)
mean(myDF2$PULocationID)
mean(myDF2$PULocationID, na.rm=T)

# Paste city and state for question 3
head(paste(myDF3$CITY,myDF3$STATE), n=100)
myDF3$locations<- paste(myDF3$CITY,myDF3$STATE)
names(myDF3)
head(paste(paste(myDF3$TRANSACTION_AMT,myDF3$locations), n=100))
myDF3$Donations_City<- paste(myDF3$TRANSACTION_AMT,myDF3$locations)
max(myDF3$Donations_City)

# We encourage you to try some examples yourself!
# The more that you play with R and with the available functions,
# the more comfort that you will build with this new tool.




