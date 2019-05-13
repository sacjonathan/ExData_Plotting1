data <- read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")
sub_data <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

png("plot4.png",height=480,width=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(sub_data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col="red")
  lines(Sub_metering_3~Datetime,col="blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_rective_power")
})

dev.off()