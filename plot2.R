rm(list=ls())
datos <- read.csv("household_power_consumption.txt",header = T,sep=";")

subdatos <- subset(datos,datos$Date=="1/2/2007" | datos$Date=="2/2/2007")

subdatos$Date <- as.Date(subdatos$Date,format="%d/%m/%Y")

subdatos$Time <- strptime(subdatos$Time, format = "%H:%M:%S")

subdatos[1:1440,"Time"] <- format(subdatos[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdatos[1441:2880,"Time"] <- format(subdatos[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


globalActivePower <- as.numeric(as.character(subdatos$Global_active_power))

png("plot2.png", width=480, height=480)
plot(subdatos$Time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

# subdatos$Time
