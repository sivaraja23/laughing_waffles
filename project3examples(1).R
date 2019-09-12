# Use the function read.csv to read in the file called:
#    "The_Complete_Journey_2_Master/5000_transactions.csv"
# in the Data Mine data directory, from 8451.
# FYI, 8451 is owned by Kroger.
# They use data science to give Kroger more customer insights.

# The file is large, so it takes a couple minutes to read in:
myDF <- read.csv("/class/datamine/data/8451/The_Complete_Journey_2_Master/5000_transactions.csv")

# This file has 10 million records, and 9 columns:
dim(myDF)

# Here are the first 6 transactions:
head(myDF)

# These transactions are 38 million dollars altogether:
sum(myDF$SPEND)

# The variable "myDF" is a data.frame which is like a spreadsheet.
class(myDF)

# Each column must have the same type of data.
# In our case, there are 9 columns.  These are the names:
names(myDF)

# Notice that the 3rd column has an underscore at the end of the name.
# Strange, but strange things happen sometimes when we work with data.

# The fifth column, called "SPEND", has the amount of money
# that was spent in the transaction.
# Here are the amounts of the first 6 transactions:
head(myDF$SPEND)

# The "dollar sign" tells R that we want to see a column of the data.frame.

# The values in that column are numbers,
# so they are said to be of type "numeric".
# We say that this column is a vector of numbers.
class(myDF$SPEND)

# We can save the first 6 values in the SPEND column into a vector v:
v <- head(myDF$SPEND)
# Here are those values again:
v
# Some are negative:
v < 0
# and those values are:
v[v < 0]
# Notice that we are using the two TRUE values as indices into v.

# Some values are positive:
v > 0
# and those values are:
v[v > 0]
# As another way to see the 3rd through 6th values,
# we can concatenate the indices 3 through 6
# and then ask R for the 3rd through 6th values of vector v:
v[c(3,4,5,6)]
# or we can simply do:
v[3:6]

# The 9th column has the year, which is also numeric,
# but it is a special kind of numeric, without decimal places.
# It is a vector of integers.
class(myDF$YEAR)

# The first six transactions all take place in 2016:
head(myDF$YEAR)

# Indeed, all of the transactions take place in 2016 or 2017,
# with approximately 5 million transactions per year.
table(myDF$YEAR)

# This is typical of R.  We write a function that
# runs on an entire vector of data.  We do this a lot.
# The table function just tabulates how many entries of each type.

# The third column is a special kind of vector, called a factor.
# There are only certain types of values that are allowed.
class(myDF$PURCHASE_)

# In this case, when we ask R for the first 6 values,
# it will show them (the first six are each "03-JAN-16")
# and it tries to help,
# by listing all of the values that can appear.

# Just FYI: since some of you will ask:
# There are 726 possible values because
# 366 values from 2016 but 1 Jan, 2 Jan, 25 Dec are missing,
# so 363 values in 2016.
# 365 values from 2017 but 25 Dec and 31 Dec are missing,
# so 363 values in 2017 too.
# Thus, 726 values altogether.

# So when we ask for the head of this column,
# we see that the first 6 purchases were each made on "03-JAN-16"
# and we see a glimpse of all 726 possible values
# that are possible in this column.
head(myDF$PURCHASE_)
# Remember that the length of the column is not 726.  It is 10 million!
length(myDF$PURCHASE_)
# Here are the first 50 purchase dates:
head(myDF$PURCHASE_, 50)

# We can tabulate all 10 million dates:
table(myDF$PURCHASE_)

# We can sort those results, to see that
# most of the shopping is done on 23 Dec:
sort(table(myDF$PURCHASE_))

# If you only want to see the 6 most popular shopping dates,
# you can consider the tail of this resulting vector:
tail(sort(table(myDF$PURCHASE_)))

# Here are the 10 most popular shopping dates:
tail(sort(table(myDF$PURCHASE_)), n=10)


