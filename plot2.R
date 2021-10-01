#Load the file
dataFile <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Convert the date to ones that readable by R
dataFile$NewTime <-paste(dataFile$Date, dataFile$Time, sep = " ")
dataFile$NewTime<- strptime(dataFile$NewTime, "%d/%m/%Y %H:%M:%S")
dataFile$Date <- strptime(dataFile$Date, "%d/%m/%Y")


#Select the dataset from Feb 1 to Feb 2
dataFile_2Day <- dataFile[(grepl("2007-02-01|2007-02-02", dataFile$Date)),]

#Convert the data to numeric variables
dataFile_2Day$Global_active_power <- as.numeric(dataFile_2Day$Global_active_power)

#Generate the plot and save it as png file
png(filename = "plot2.png", width = 480, height = 480)
plot(dataFile_2Day$NewTime, dataFile_2Day$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

