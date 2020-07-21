power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
mynames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(power) <- mynames
power <- subset(power,power$Date %in% c("1/2/2007","2/2/2007"))

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- strptime(power$Time, format="%H:%M:%S")
power[1:1440,"Time"] <- format(power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


x <- power$Time
gap <- as.numeric(as.character(power$Global_active_power))
grp <- as.numeric(as.character(power$Global_reactive_power))
pv <- as.numeric(as.character(power$Voltage))
y1 <- power$Sub_metering_1
sm1 <- as.numeric(as.character(power$Sub_metering_1))
sm2 <- as.numeric(as.character(power$Sub_metering_2))
sm3 <- as.numeric(as.character(power$Sub_metering_3))

png("plot4.png", width = 480 , height = 480)
par(mfrow=c(2,2))

with(power,{
      plot(x, gap, 
           type = "l",
           xlab = "",
           ylab = "Global Active Power")  
      ###
      plot(x, pv,
           type ="l",
           xlab = "datetime",
           ylab = "Voltage")
      ###
      plot(x, y1,
           type = "n",
           xlab = "",
           ylab = "Energy sub metering")
      with(power,lines(Time, sm1))
      with(power,lines(Time, sm2, col = "red"))
      with(power,lines(Time, sm3, col = "blue"))
      
      legend("topright",
             lty = 1,
             col = c("black","red","blue"),
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      ###
      plot(x, grp,
           type="l",
           xlab="datetime",
           ylab="Global_reactive_power")
})

dev.off()