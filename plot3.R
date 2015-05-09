
# Set locale time language to English to force EN weekdays on x-axis
Sys.setlocale("LC_TIME", "English")

# Load the data
raw_data<-read.table("./household_power_consumption.txt", header= TRUE, sep=";", na.strings="?", dec=".", stringsAsFactors=FALSE,)

#Subset only data from 2007-02-01 and 2007-02-02.
subSetData <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#build plot
png(filename="plot3.png", width=480, height=480, units="px")

plot(datetime,subSetData$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(datetime,subSetData$Sub_metering_2, type="l", col="red")
lines(datetime,subSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2.5, lty=1, col=c("black", "red", "blue"))

dev.off()