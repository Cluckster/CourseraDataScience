dataFile <- "./data/household_power_consumption.txt"
consumption <- read.table(dataFile, sep=";", header = TRUE, stringsAsFactors = FALSE, dec=".")

subSetData <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

energy_sub1 <- as.numeric(subSetData$Sub_metering_1)
energy_sub2 <- as.numeric(subSetData$Sub_metering_2)
energy_sub3 <- as.numeric(subSetData$Sub_metering_3)

par(mfrow = c(2,2))
par(mar = c(2.5,4.1,2.0,2.1))

#global active power
power <- as.numeric(subSetData$Global_active_power)
plot(datetime, power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#voltage
voltage <- as.numeric(subSetData$Voltage)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#energy sub metering
plot(datetime, energy_sub1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, energy_sub2, type="l", xlab="", ylab="Energy sub metering", col = "red")
lines(datetime, energy_sub3, type="l", xlab="", ylab="Energy sub metering", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#global inactive power
reactive_power <- as.numeric(subSetData$Global_reactive_power)
plot(datetime, reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, "./myfigures/plot4.png", width = 480, height = 480)
dev.off()

