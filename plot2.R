data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

subset_data$Datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time),
                                   format="%d/%m/%Y %H:%M:%S")

subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(subset_data$Datetime, subset_data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")

axis(1,
     at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))


dev.off()
