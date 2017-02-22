library(dplyr)
#setwd("./EDA_Assignment/ExData_Plotting1")
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=("?"))
data <- mutate (data, Date = as.Date(strptime (Date, "%d/%m/%Y")))
data <- filter (data, Date > "2007-01-31" & Date < "2007-02-03")
data <- mutate (data, DateTime = as.POSIXct(strptime(paste (factor(Date),Time),format="%Y-%m-%d %H:%M:%S")))

plot (data$DateTime, data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()

