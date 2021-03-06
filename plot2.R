# Unzip the data
fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile = "data.zip",method = "curl")
unzip("data.zip")

# Loading and tyding data
power <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")

# Loading of the subset
subpower <- power[power$Date %in% c("1/2/2007","2/2/2007"),]
gactivep <- as.numeric(subpower$Global_active_power)
timepower <- strptime(paste(subpower$Date,subpower$Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")
# Plots the data "Global Active Power"
png("plot2.png")
plot(timepower,gactivep,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
