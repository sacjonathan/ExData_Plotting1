data <- read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")
sub_data <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

png("plot3.png",height=480,width=480)

plot(sub_data$Datetime,sub_data$Sub_metering_1,type="l",ylab="Global Active Power (kilowatts)", xlab="")
lines(sub_data$Datetime,sub_data$Sub_metering_2,col="red")
lines(sub_data$Datetime,sub_data$Sub_metering_3,col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()