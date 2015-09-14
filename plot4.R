setwd("/Users/PAN/Desktop/Learn/Coursera/DataScience/Exploratory Data Analysis/Project")
unzip("./exdata-data-household_power_consumption.zip", files = NULL,exdir="./")
hpc<- read.table('./household_power_consumption.txt',header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".") 
hpc$Date<- as.Date(hpc$Date,format="%d/%m/%Y")
subhpc <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)
datetime <- paste(as.Date(subhpc$Date), subhpc$Time)
subhpc$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(subhpc$Global_active_power)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subhpc, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

png("plot4.png", width=480, height=480)
dev.off()