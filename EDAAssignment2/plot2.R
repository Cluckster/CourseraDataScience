#question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# read in PM 2.5
NEI <- readRDS("./data/summarySCC_PM25.rds")
#read in classification codes
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Baltimore City, MD is fips 24510 specified in problem statement
baltCity <- subset(NEI, fips == "24510")

# get sums of emissions, by year
emissions <- aggregate(baltCity[,'Emissions'], by=list(baltCity$year), FUN = sum)

colnames(emissions)[1] = "Year"
colnames(emissions)[2] = "PM25"

# plot the graph in the same directory as the .R file
png(filename = "./plot2.png")

barplot(emissions$PM25, names.arg = emissions$Year, 
        main = expression('Total Emission of PM'[2.5]*' in Baltimore City'), 
        xlab = "Year", ylab = expression('PM'[2.5]))
dev.off()

