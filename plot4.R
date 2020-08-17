# Unzip the data
fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile = "data.zip",method = "curl")
unzip("data.zip")

# Loading and tyding data
power <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")

# Loading of the subset
subpower <- power[power$Date %in% c("1/2/2007","2/2/2007"),]
enersub1 <- as.numeric(subpower$Sub_metering_1)
enersub2 <- as.numeric(subpower$Sub_metering_2)
enersub3 <- as.numeric(subpower$Sub_metering_3)
timepower <- strptime(paste(subpower$Date,subpower$Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")
gactivep <- as.numeric(subpower$Global_active_power)
vol <- as.numeric(subpower$Voltage)
greactivep <- as.numeric(subpower$Global_reactive_power)
# Plots the data
png("plot4.png")
par(mfrow= c(2,2))

#Plot 1
plot(timepower,gactivep,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

#Plot 2
plot(timepower,vol,type = "l",xlab = "datetime",ylab = "Global Active Power (kilowatts)")

#Plot 3
plot(timepower, enersub1, type = "l", ylab = "Energy sub metering", xlab="")
lines(timepower,enersub2, type = "l", col= "red")
lines(timepower,enersub3, type = "l",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 0, lwd= 2.5, col = c("black","red","blue"))

#Plot 4
plot(timepower,greactivep,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()