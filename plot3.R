rm(list=ls())
datos <- read.csv("household_power_consumption.txt",header = T,sep=";")
subdatos <- subset(datos,datos$Date=="1/2/2007" | datos$Date=="2/2/2007")

# Transforming the formatformat

datetime <- strptime(paste(subdatos$Date, subdatos$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#globalActivePower <- as.numeric(subdatos$Global_active_power)

globalActivePower <- as.numeric(as.character(subdatos$Global_active_power))
subMetering1 <- as.numeric(as.character(subdatos$Sub_metering_1))
subMetering2 <- as.numeric(as.character(subdatos$Sub_metering_2))
subMetering3 <- as.numeric(as.character(subdatos$Sub_metering_3))
# plotplot

png("plot3.png", width=480, height=480)

plot(datetime,subMetering1 , type="l",xlab=" ",ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()