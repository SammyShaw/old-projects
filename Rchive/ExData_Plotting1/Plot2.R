setwd("ExData_Plotting1")

mlfile<-"household_power_consumption.txt" # .txt file must be in directory
mldata<-read.table(mlfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
mlsubset<-mldata[mldata$Date %in% c("1/2/2007", "2/2/2007"), ]

# Plot 2
datetime <- strptime(paste(mlsubset$Date, mlsubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap<-as.numeric(mlsubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, gap, type="line", ylab="Global Active Power (kilowatts)")
dev.off()


