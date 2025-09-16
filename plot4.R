data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

subset_data$Datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time),
                                   format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(subset_data$Datetime, subset_data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power", xaxt = "n")
axis(1,  
     at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),  
     labels = c("Thu", "Fri", "Sat"))

plot(subset_data$Datetime, subset_data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1,  
     at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),  
     labels = c("Thu", "Fri", "Sat"))

plot(subset_data$Datetime, subset_data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")
axis(1,  
     at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),  
     labels = c("Thu", "Fri", "Sat"))
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subset_data$Datetime, subset_data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis(1,  
     at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),  
     labels = c("Thu", "Fri", "Sat"))

dev.off()