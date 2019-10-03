

myDF <- read.csv("/class/datamine/data/airbnb/united-states/ca/los-angeles/2019-07-08/visualisations/listings.csv")

#1a) code
#gets the largest value of all 6 hostid reviews
tail(sort(tapply(myDF$number_of_reviews,myDF$host_id,sum)), n=1)
#The host id with most amount of reviews is 21013529

#1b)
tail(sort(tapply(myDF$number_of_reviews,myDF$neighbourhood,sum)),n=1)
#The city vencie has the most number of reviews, with 151629 reviews currently


# Question 2
myDF2<-read.csv("/class/datamine/data/flights/2019.csv")
myDF$flightpath<-paste(myDF2$ORIGIN,myDF2$DEST)
#gets the  longest mean delay time for flight path
tail(sort(tapply(myDF2$DEP_DELAY,myDF2$flightpath,mean)),n=1)

#OUTPUT: VPS SRQ 720


#Question 3

myDF3<- read.delim("/class/datamine/data/election/itcont2020.txt", sep="|")

myDF3location<-paste(myDF3$CITY,myDF3$STATE)
#3a
tapply(myDF3$TRANSACTION_AMT,myDF3$location)

#3b
tail(sort(tapply(myDF3$TRANSACTION_AMT,myDF3$CMTE_ID,sum)))


