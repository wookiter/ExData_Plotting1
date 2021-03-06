library(dplyr)
#setwd("./EDA_Assignment/ExData_Plotting1")
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=("?"))
data <- mutate (data, Date = as.Date(strptime (Date, "%d/%m/%Y")))
data <- filter (data, Date > "2007-01-31" & Date < "2007-02-03")
data <- mutate (data, DateTime = as.POSIXct(strptime(paste (factor(Date),Time),format="%Y-%m-%d %H:%M:%S")))

par(mfcol = c(2,2))
plot (data$DateTime, data$Global_active_power, type="l",ylab="Global Active Power",xlab="")
plot (data$DateTime, data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines (data$DateTime,data$Sub_metering_2, col="red")
lines (data$DateTime,data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1),cex=0.8)
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()