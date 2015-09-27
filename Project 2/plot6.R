#Q6
#Compare emissions from motor vehicle sources in Baltimore City with emissions
#from motor vehicle sources in Los Angeles County, California (fips == 06037). 
#Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)
setwd("/Users/PAN/Desktop/Learn/Coursera/DataScience/Exploratory Data Analysis/Project/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#NEISCC <- merge(NEI, SCC, by="SCC")

subset <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

TotalEmissionsByYear <- aggregate(Emissions ~ year+fips, subset, sum)

png("plot6.png", width=640, height=480)
g <- ggplot(TotalEmissionsByYear, aes(year, Emissions,color = fips))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Los Angeles V.S. Baltimore on Total Emissions from motor vehicle sources from 1999 to 2008')
print(g)
dev.off()
