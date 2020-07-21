rm(list = ls())
power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
mynames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(power) <- mynames
power <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

gap <- as.numeric(as.character(power$Global_active_power))

png("plot1.png", width = 480 , height = 480)

hist(gap,
     col = "red",
     xlab = "Global Active Power(kilowatts)",
     main = "Global Active Power")

dev.off()