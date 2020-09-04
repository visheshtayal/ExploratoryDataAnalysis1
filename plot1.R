library(lubridate)
DT<-data.table::fread("household_power_consumption.txt",na.strings = "?")
DT$Date<-dmy(DT$Date)
DT<-DT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("plot1.png",width=480,height = 480)
hist(DT$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab = "Frequency",col="Red")
dev.off()