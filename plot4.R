rm(list=ls())
datos <- read.csv("household_power_consumption.txt",header = T,sep=";")
subdatos <- subset(datos,datos$Date=="1/2/2007" | datos$Date=="2/2/2007")


# Transforming the Date and Time 

datetime <- strptime(paste(subdatos$Date, subdatos$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#globalActivePower <- as.numeric(subdatos$Global_active_power)

globalActivePower <- as.numeric(as.character(subdatos$Global_active_power))
globalReactivePower <- as.numeric(as.character(subdatos$Global_reactive_power))


voltage <- as.numeric(as.character(subdatos$Voltage))

subMetering1 <- as.numeric(as.character(subdatos$Sub_metering_1))
subMetering2 <- as.numeric(as.character(subdatos$Sub_metering_2))
subMetering3 <- as.numeric(as.character(subdatos$Sub_metering_3))

##making plots


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)


plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")


plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()






















