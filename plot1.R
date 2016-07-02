
library(dplyr)

## Read the data from file
file <- "household_power_consumption.txt"
class <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
mydata <- read.table(file, header = TRUE, sep=";", na.strings = c("?"), colClasses = class)

## Subset to get February 1st and 2nd of 2007.  European format D/M/YYYY
mysub <- filter(mydata, Date == "1/2/2007" | Date == "2/2/2007")  

## Remove the big data
rm(mydata)

##Save to file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## Plot that puppy
hist(mysub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()