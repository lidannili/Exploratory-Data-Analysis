setwd("/Users/PAN/Desktop/Learn/Coursera/DataScience/Exploratory Data Analysis/Project")
unzip("./exdata-data-household_power_consumption.zip", files = NULL,exdir="./")
hpc<- read.table('./household_power_consumption.txt',header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".") 
hpc$Date<- as.Date(hpc$Date,format="%d/%m/%Y")
subhpc <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)
datetime <- paste(as.Date(subhpc$Date), subhpc$Time)
subhpc$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(subhpc$Global_active_power)
png("plot2.png", width=480, height=480)
plot(subhpc$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


