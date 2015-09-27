#Q4
#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999–2008?
library(ggplot2)
setwd("/Users/PAN/Desktop/Learn/Coursera/DataScience/Exploratory Data Analysis/Project/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

#grep, grepl, regexpr, gregexpr and regexec search for matches to argument pattern 
#within each element of a character vector: they differ in the format of and amount 
#of detail in the results.
#grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE,
# fixed = FALSE, useBytes = FALSE, invert = FALSE)
#grepl(pattern, x, ignore.case = FALSE, perl = FALSE,
# fixed = FALSE, useBytes = FALSE)

coal <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coal, ]
TotalEmissionsByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

png("plot4.png", width=640, height=480)
g <- ggplot(TotalEmissionsByYear, aes(year, Emissions))
g <- g + geom_line() +
      xlab("year") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions from coal combustion-related sources from 1999 to 2008')
print(g)
dev.off()