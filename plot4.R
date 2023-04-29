library(readr)
library(dplyr)

# read the file into a data frame
data <- read.table("household_power_consumption_extract.txt",sep=";", header = T)

#labels
days <- c(format(unique(as.Date(data$Date)), "%a"),"Sat")

# Open PNG
png("Plot4.png",width=480,height=480,units="px")

#Multiple plots
par(mfrow = c(2,2))

# Top Left
plot(as.numeric(data$Global_active_power), type = "l", xaxt = "n",
     ylab = "Global Active Power")
axis(1, at = c(0,1440,2880), labels = days)

# Top Right
plot(as.numeric(data$Voltage), type = "l", xaxt = "n",
     ylab = "Voltage")
axis(1, at = c(0,1440,2880), labels = days)

# Bottom Left
plot(as.numeric(data$Sub_metering_1),
     type = "l", xaxt = "n",
     ylab = "Energy sub metering")
lines(as.numeric(data$Sub_metering_2), col = "red")
lines(as.numeric(data$Sub_metering_3), col = "blue")
axis(1, at = c(0,1440,2880), labels = days)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)

# Bottom Right
plot(as.numeric(data$Global_reactive_power),
     type = "l", xaxt = "n",
     ylab = "Global_reactive_power")
axis(1, at = c(0,1440,2880), labels = days)


# Save to PNG
dev.off()
