#Save file location in a variable
rawData <- "./data/household_power_consumption.txt"

#Read the data and seperate the fields
householdPower <- read.table(rawData, header = TRUE, sep=";", dec=".")

#Subset the data for 2 relevant dates
subSetData <- householdPower[householdPower$Date %in% c("1/2/2007", "2/2/2007") ,]


#Check the data frame
#head (subSetData)
#dim(subSetData)
#[1] 2880    9
#str(subSetData)

#Plot 2

#Set field to numeric
Globalactivepower <- as.numeric(subSetData$Global_active_power)
png("plot1t.png", width=480, height=480)
hist(Globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
