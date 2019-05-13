data <- read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")
sub_data <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

png("plot2.png", height=480, width=480)

plot(sub_data$Datetime,sub_data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()