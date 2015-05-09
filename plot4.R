# Load the data
raw_data<-read.table("./household_power_consumption.txt", header= TRUE, sep=";", na.strings="?", dec=".", stringsAsFactors=FALSE,)

#Subset only data from 2007-02-01 and 2007-02-02.
subSetData <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#build plot
png(filename="plot4.png", width=480, height=480, units="px")

#Layout Grid for plots
par(mfrow=c(2,2))

#upper left plot
plot(datetime, subSetData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#upper right plot
plot(datetime, subSetData$Voltage, type="l", ylab="Voltage", xlab="datetime")

#lower left plot
plot(datetime,subSetData$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(datetime,subSetData$Sub_metering_2, type="l", col="red")
lines(datetime,subSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2.5, lty=1, col=c("black", "red", "blue"))

#lower right plot
plot(datetime, subSetData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()