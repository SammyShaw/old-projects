
setwd("ExData_Plotting1")

mlfile<-"household_power_consumption.txt" # .txt file must be in directory
mldata<-read.table(mlfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
mlsubset<-mldata[mldata$Date %in% c("1/2/2007", "2/2/2007"), ]

# Plot 1
png("plot1.png", width=480, height=480)
with(mlsubset, hist(as.numeric(Global_active_power), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)"))
dev.off()



