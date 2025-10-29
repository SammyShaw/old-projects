
setwd("ExData_Plotting1")

mlfile<-"household_power_consumption.txt" # .txt file must be in directory
mldata<-read.table(mlfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
mlsubset<-mldata[mldata$Date %in% c("1/2/2007", "2/2/2007"), ]

# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# first
plot(datetime, gap, type="line", ylab="Global Active Power (kilowatts)")
# second
plot(datetime, mlsubset$Voltage, type="l", ylab="Voltage")
# third
plot(datetime, mlsubset$Sub_metering_1, type="l", ylab="Energy Sub Metering")
lines(datetime, mlsubset$Sub_metering_2, type="l", col="red")
lines(datetime, mlsubset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
# fourth
plot(datetime, mlsubset$Global_reactive_power, type="l", ylab="Global_reactive_power")
dev.off()