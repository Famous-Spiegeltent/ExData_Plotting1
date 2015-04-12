## Read data
fileName <- "household_power_consumption.txt"
dataFile <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character",2), rep("numeric", 7)))

## Convert the Date and Time variables to Date/Time classes
dataFile$Time <- strptime(paste(dataFile$Date, dataFile$Time), "%d/%m/%Y %H:%M:%S")
dataFile$Date <- as.Date(dataFile$Date, "%d/%m/%Y")

## Use data only from 2007-02-01 and 2007-02-02
range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(dataFile, Date %in% range)

## Make Plot1 and save it as plot1.png
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")

dev.off()
