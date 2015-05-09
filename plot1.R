# Load the data
#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Global_active_power: household global minute-averaged active power (in kilowatt)
#Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#Voltage: minute-averaged voltage (in volt)
#Global_intensity: household global minute-averaged current intensity (in ampere)
#Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

raw_data<-read.table("./household_power_consumption.txt", header= TRUE, sep=";", na.strings="?", dec=".", stringsAsFactors=FALSE,)

#Subset only data from 2007-02-01 and 2007-02-02.
subSetData <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007") ,]

# build Plot
png(filename="plot1.png", width=480, height=480, units="px")
hist(subSetData$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

