#Q2
#Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.
setwd("/Users/PAN/Desktop/Learn/Coursera/DataScience/Exploratory Data Analysis/Project/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
subsetNEI  <- NEI[NEI$fips=="24510", ]
TotalEmissionsByYear <- aggregate(Emissions ~ year, subsetNEI, sum)
png('plot2.png')
barplot(height=TotalEmissionsByYear$Emissions, names.arg=TotalEmissionsByYear$year, 
        xlab="years", ylab=expression('Total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions in the Baltimore 1999-2008'))
dev.off()

