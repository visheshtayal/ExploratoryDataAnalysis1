library(lubridate)
library(data.table)
DT<-data.table::fread("household_power_consumption.txt",na.strings = "?")
DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
DT <-DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot4.png",height=480,width=480)
par(mfrow=c(2,2))
plot(DT[,dateTime],DT[,Global_active_power],type="l",xlab = "",ylab = "Global Active Power")
plot(DT[,dateTime],DT[,Voltage],type="l",xlab = "datetime",ylab = "Voltage")
plot(DT[, dateTime],DT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(DT[, dateTime], DT[, Sub_metering_2],col="red")
lines(DT[, dateTime], DT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"),c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=1, lwd=1,bty="n",cex=.5)
plot(DT[, dateTime], DT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
