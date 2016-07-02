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
png(filename = "plot3.png", width = 480, height = 480, units = "px")

## Plot it
plot(timeDate(paste(mysub$Date, mysub$Time), format = "%d/%m/%Y %H:%M:%S"), 
     mysub$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")

lines(timeDate(paste(mysub$Date, mysub$Time), format = "%d/%m/%Y %H:%M:%S"), 
      mysub$Sub_metering_2, col="red", type="l")
 
lines(timeDate(paste(mysub$Date, mysub$Time), format = "%d/%m/%Y %H:%M:%S"), 
      mysub$Sub_metering_3, col="blue", type="l")

legend("topright", lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()