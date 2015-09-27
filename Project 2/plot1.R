# Q1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all 
#sources for each of the years 1999, 2002, 2005, and 2008.

setwd("/Users/PAN/Desktop/Learn/Coursera/DataScience/Exploratory Data Analysis/Project/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
TotalEmissionsByYear <- aggregate(Emissions ~ year, NEI, sum)
png('plot1.png')
barplot(height=TotalEmissionsByYear$Emissions, names.arg=TotalEmissionsByYear$year, 
        xlab="years", ylab=expression('Total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions in the U.S 1999-2008'))
dev.off()
