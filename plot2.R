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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## Plot it
plot(timeDate(paste(mysub$Date, mysub$Time), format = "%d/%m/%Y %H:%M:%S"), mysub$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()