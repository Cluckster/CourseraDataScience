dataFile <- "./data/household_power_consumption.txt"
consumption <- read.table(dataFile, sep=";", header = TRUE, stringsAsFactors = FALSE, dec=".")

subSetData <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

ga_power <- as.numeric(subSetData$Global_active_power)

par(mfrow = c(1,1))

plot(datetime, ga_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, "./myfigures/plot2.png", width = 480, height = 480)
dev.off()

