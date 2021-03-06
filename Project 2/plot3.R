#3.Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#variable, which of these four sources have seen decreases in emissions from 1999–2008 
#for Baltimore City? Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
setwd("/Users/PAN/Desktop/Learn/Coursera/DataScience/Exploratory Data Analysis/Project/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
subsetNEI  <- NEI[NEI$fips=="24510", ]
TotalEmissionsByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png("plot3.png", width=640, height=480)
g <- ggplot(TotalEmissionsByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore from 1999 to 2008')
print(g)
dev.off()

