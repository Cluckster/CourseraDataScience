dataFile <- "./data/household_power_consumption.txt"
consumption <- read.table(dataFile, sep=";", header = TRUE, stringsAsFactors = FALSE, dec=".")

subSetData <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

energy_sub1 <- as.numeric(subSetData$Sub_metering_1)
energy_sub2 <- as.numeric(subSetData$Sub_metering_2)
energy_sub3 <- as.numeric(subSetData$Sub_metering_3)

par(mfrow = c(1,1))

plot(datetime, energy_sub1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, energy_sub2, type="l", xlab="", ylab="Energy sub metering", col = "red")
lines(datetime, energy_sub3, type="l", xlab="", ylab="Energy sub metering", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, "./myfigures/plot3.png", width = 480, height = 480)
dev.off()
