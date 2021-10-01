#Load the file
dataFile <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Convert the date to ones that readable by R
dataFile$NewTime <-paste(dataFile$Date, dataFile$Time, sep = " ")
dataFile$NewTime<- strptime(dataFile$NewTime, "%d/%m/%Y %H:%M:%S")
dataFile$Date <- strptime(dataFile$Date, "%d/%m/%Y")


#Select the dataset from Feb 1 to Feb 2
dataFile_2Day <- dataFile[(grepl("2007-02-01|2007-02-02", dataFile$Date)),]

#Convert the data to numeric variables
dataFile_2Day$Sub_metering_1 <- as.numeric(dataFile_2Day$Sub_metering_1)
dataFile_2Day$Sub_metering_2 <- as.numeric(dataFile_2Day$Sub_metering_2)
dataFile_2Day$Sub_metering_3 <- as.numeric(dataFile_2Day$Sub_metering_3)
dataFile_2Day$Global_active_power <- as.numeric(dataFile_2Day$Global_active_power)
dataFile_2Day$Voltage <- as.numeric(dataFile_2Day$Voltage)
dataFile_2Day$Global_reactive_power <-as.numeric(dataFile_2Day$Global_reactive_power)

#Generate the plot and save it as png file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(dataFile_2Day$NewTime, dataFile_2Day$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

plot(dataFile_2Day$NewTime, dataFile_2Day$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

plot(dataFile_2Day$NewTime, dataFile_2Day$Sub_metering_1, xlab="",
     ylab="Energy sub metering", type="n")
lines(dataFile_2Day$NewTime, dataFile_2Day$Sub_metering_1)
lines(dataFile_2Day$NewTime, dataFile_2Day$Sub_metering_2, col="red")
lines(dataFile_2Day$NewTime, dataFile_2Day$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red","blue"), lty = 1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(dataFile_2Day$NewTime, dataFile_2Day$Global_reactive_power,type = "l", xlab = "datetime",
     ylab ="Global_reactive_power")

dev.off()

