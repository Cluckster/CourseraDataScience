dataFile <- "./data/household_power_consumption.txt"
consumption <- read.table(dataFile, sep=";", header = TRUE, stringsAsFactors = FALSE, dec=".")

# format the date, store in Date2
consumption$Date2 <- as.Date(consumption$Date, "%d/%m/%Y")

consumption2 <- subset(consumption, consumption$Date2 > "2007-01-31" & consumption$Date2 < "2007-02-03")

consumption2$Global_active_power <- as.numeric(as.character(consumption2$Global_active_power))

par(mfrow = c(1,1))

hist(consumption2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#export this mofo to a png
dev.copy(png, file = "./myfigures/plot1.png", width = 480, height = 480)

dev.off()

