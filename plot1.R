data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power, 
     xlab = "Global Active Power (killowats)",
     col="red", main = "Global Active Power")

dev.off() 