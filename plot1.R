rm(list=ls())

datos <- read.csv("household_power_consumption.txt",header = T,sep=";")
#colnames(datos)

subdatos <- subset(datos,datos$Date=="1/2/2007" |datos$Date=="2/2/2007")

# hist(as.numeric(subdatos$Global_active_power))
# datos$Global_active_power


png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(subdatos$Global_active_power)),main="Global Active Power",xlab = "Global Active Power (Kilowatts)",col="red")
dev.off()

# str(subdatos$Global_active_power)
# as.character(subdatos$Global_active_power)[1]
# as.numeric(as.character(subdatos$Global_active_power))[1]
# as.numeric(subdatos$Global_active_power)[1]
