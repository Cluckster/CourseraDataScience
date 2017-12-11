# question 4
# Across the United States, how have emissions from coal combustion-related sources changed 
# from 1999-2008?

# read in PM 2.5
NEI <- readRDS("./data/summarySCC_PM25.rds")
#read in classification codes
SCC <- readRDS("./data/Source_Classification_Code.rds")

# coal classifications
coalClassification <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]

# merge the summary with the classifications based on the SCC code
coal <- merge(x=NEI, y=coalClassification, by="SCC")

# split the respective emission types by year, and sum
coal.Sum <- aggregate(coal[,"Emissions"], by=list(coal$year), sum)

#rename the columns to something more intuitive
colnames(coal.Sum)[1] = "Year"
colnames(coal.Sum)[2] = "Emissions"

png(filename = "./plot4.png")

g <- ggplot(data=coal.Sum, aes(x=Year,y=Emissions/1000))
g <- g + geom_line(aes(group=1, col=Emissions)) + geom_point()
g <- g +  ylab(expression(paste('PM'[2.5], ' Emissions in kilotons'))) 
g <- g + ggtitle(expression("Total Emissions of PM"[2.5]))
g <- g + geom_text(aes(label=round(Emissions/1000, digits = 2), size = 1, hjust = 1.5, vjust = 1.5)) 
g <- g + theme(legend.position = "none")

print(g)

dev.off()

