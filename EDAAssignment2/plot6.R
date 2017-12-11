# question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen 
# greater changes over time in motor vehicle emissions?
library(ggplot2)

# read in PM 2.5
NEI <- readRDS("./data/summarySCC_PM25.rds")
#read in classification codes
SCC <- readRDS("./data/Source_Classification_Code.rds")

NEI$year = factor(NEI$year, levels=c("1999", "2002", "2005","2008"))

# Baltimore City, MD is fips 24510, LA 06037, motor vehicles are on-road type
baltCityMotor <- subset(NEI, fips == "24510" & type == "ON-ROAD")
laMotor <- subset(NEI, fips == "06037" & type == "ON-ROAD")

# get the totals for each city, each year
baltimoreEmissions <- aggregate(baltCityMotor[,"Emissions"], by=list(baltCityMotor$year), sum)
baltimoreEmissions$City = "Baltimore"

laEmissions <- aggregate(laMotor[,"Emissions"], by=list(laMotor$year), sum)
laEmissions$City = "LA"

colnames(baltimoreEmissions) = c("Year","PM25","City")
colnames(laEmissions) = c("Year", "PM25", "City")

#combine the emission totals for both into a single data frame
DF = as.data.frame(rbind(baltimoreEmissions, laEmissions))

png(filename = "./plot6.png")

g <- ggplot(data=DF, aes(x=Year,y=PM25))
g <- g + geom_bar(aes(fill = Year),stat = "identity") 
g <- g + facet_grid(. ~ City)
g <- g + geom_text(aes(label=round(PM25,0), size = 1, hjust = 0.5, vjust = 2))
g <- g + ggtitle("Total Motor Vehicle Emissions in Balimore, MD vs. LA County, CA")
g <- g + ylab(expression("PM"[2.5])) + xlab("Year")
g <- g + theme(legend.position = "none")

print(g)

dev.off()

