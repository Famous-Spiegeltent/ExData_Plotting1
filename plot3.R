## Read data
fileName <- "household_power_consumption.txt"
dataFile <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character",2), rep("numeric", 7)))

## Convert the Date and Time variables to Date/Time classes
dataFile$Time <- strptime(paste(dataFile$Date, dataFile$Time), "%d/%m/%Y %H:%M:%S")
dataFile$Date <- as.Date(dataFile$Date, "%d/%m/%Y")

## Use data only from 2007-02-01 and 2007-02-02
range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(dataFile, Date %in% range)

## Make Plot3 and save it as plot3.png
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

plot(data$Time, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()
