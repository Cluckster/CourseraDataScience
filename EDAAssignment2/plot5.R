# question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
library(ggplot2)

# read in PM 2.5
NEI <- readRDS("./data/summarySCC_PM25.rds")
#read in classification codes
SCC <- readRDS("./data/Source_Classification_Code.rds")

NEI$year = factor(NEI$year, levels=c("1999", "2002", "2005","2008"))

# Baltimore City, MD is fips 24510, motor vehicles are on-road type
baltCityMotor <- subset(NEI, fips == "24510" & type == "ON-ROAD")


# get the totals for each year
motorEmissions <- aggregate(baltCityMotor[,"Emissions"], by=list(baltCityMotor$year), sum)

colnames(motorEmissions)[1] = "Year"
colnames(motorEmissions)[2] = "PM25"

png(filename = "./plot5.png")

g <- ggplot(data=motorEmissions, aes(x=Year,y=PM25))
g <- g + geom_bar(aes(fill = Year),stat = "identity")
g <- g + geom_text(aes(label=round(PM25,0), size = 1, hjust = 0.5, vjust = 2))
g <- g + ggtitle("Total Motor Vehicle Emissions in Balimore City, MD")
g <- g + ylab(expression("PM"[2.5])) + xlab("Year")
g <- g + theme(legend.position = "none")

print(g)

dev.off()
