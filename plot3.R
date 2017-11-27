# question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make 
# a plot answer this question.
library(ggplot2)

# read in PM 2.5
NEI <- readRDS("./data/summarySCC_PM25.rds")
#read in classification codes
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Baltimore City, MD is fips 24510 specified in problem statement
baltCity <- subset(NEI, fips == "24510")
# convert each year to a factor
baltCity$year <- factor(baltCity$year, levels=c("1999", "2002", "2005","2008"))

# get sums of emissions, by year and type
emissions <- aggregate(Emissions ~ year + type,data = baltCity, FUN = sum)

# plot the graph in the same directory as the .R file
png(filename = "./plot3.png")

g <- ggplot(data=emissions, aes(year,Emissions, color = type, group = type))
g <- g + geom_line() + geom_point()
g <- g +  ylab(expression(paste('PM'[2.5], ' Emissions'))) 
g <- g + ggtitle('Emissions per Type in Baltimore City, Maryland')

print(g)

dev.off()

