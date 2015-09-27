#Q5
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
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

#motor <- grepl("motor", NEISCC$Short.Name, ignore.case=TRUE)
subset1<-NEISCC[NEISCC$fips=="24510",]
subset2<-subset2[NEISCC$type=="ON-ROAD"]
#motor <- NEISCC[motor,]
TotalEmissionsByYear <- aggregate(Emissions ~ year, subset2, sum)

png("plot5.png", width=640, height=480)
g <- ggplot(TotalEmissionsByYear, aes(year, Emissions))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle sources in Baltimore from 1999 to 2008')
print(g)
dev.off()
