## Read data
fileName <- "household_power_consumption.txt"
dataFile <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character",2), rep("numeric", 7)))

## Convert the Date and Time variables to Date/Time classes
dataFile$Time <- strptime(paste(dataFile$Date, dataFile$Time), "%d/%m/%Y %H:%M:%S")
dataFile$Date <- as.Date(dataFile$Date, "%d/%m/%Y")

## Use data only from 2007-02-01 and 2007-02-02
range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(dataFile, Date %in% range)

## Make Plot2 and save it as plot2.png
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
