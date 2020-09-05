library(lubridate)
library(data.table)
DT<-data.table::fread("household_power_consumption.txt",na.strings = "?")
DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
DT <-DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot3.png",height=480,width=480)
plot(DT[, dateTime],DT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(DT[, dateTime], DT[, Sub_metering_2],col="red")
lines(DT[, dateTime], DT[, Sub_metering_3],col="blue")
dev.off()