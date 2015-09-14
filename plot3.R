setwd("/Users/PAN/Desktop/Learn/Coursera/DataScience/Exploratory Data Analysis/Project")
unzip("./exdata-data-household_power_consumption.zip", files = NULL,exdir="./")
hpc<- read.table('./household_power_consumption.txt',header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".") 
hpc$Date<- as.Date(hpc$Date,format="%d/%m/%Y")
subhpc <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)
datetime <- paste(as.Date(subhpc$Date), subhpc$Time)
subhpc$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(subhpc$Global_active_power)

with(subhpc, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
png("plot3.png", width=480, height=480)
dev.off()