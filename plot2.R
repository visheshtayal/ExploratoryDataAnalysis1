library(lubridate)
library(data.table)
DT<-data.table::fread("household_power_consumption.txt",na.strings = "?")
DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
DT <-DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png",width=480,height=480)
plot(x=DT$dateTime,type="l",y=DT$Global_active_power,xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()