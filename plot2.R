power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
mynames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(power) <- mynames
power <- subset(power,power$Date %in% c("1/2/2007","2/2/2007"))

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- strptime(power$Time, format="%H:%M:%S")
power[1:1440,"Time"] <- format(power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

x <- power$Time
y <- as.numeric(as.character(power$Global_active_power))

###
png("plot2.png", width = 480 , height = 480)

plot(x, y,
     type="l",
     xlab="", 
     ylab = "Global Active Power (kilowatts)",
     main = "Global Active Power Vs Time") 

dev.off()
