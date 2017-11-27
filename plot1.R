# question 1 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the 
# base plotting system, make a plot showing the total PM2.5 emission from all sources for each
# of the years 1999, 2002, 2005, and 2008.

# read in PM 2.5
NEI <- readRDS("./data/summarySCC_PM25.rds")
#read in classification codes
SCC <- readRDS("./data/Source_Classification_Code.rds")

# get sums of emissions, by year
emissions <- aggregate(NEI[,'Emissions'], by=list(NEI$year), FUN = sum)

colnames(emissions)[1] = "Year"
colnames(emissions)[2] = "PM25"

#rescale the emission units to make it more readable on the plot
emissions$PM25 = emissions[,2]/1000

# plot the graph in the same directory as the .R file
png(filename = "./plot1.png")

barplot(emissions$PM25, names.arg = emissions$Year, 
        main = expression("Total Emissions of PM"[2.5]), 
        xlab = "Year", 
        ylab = expression("PM"[2.5]*" in Kilotons"))
dev.off()
