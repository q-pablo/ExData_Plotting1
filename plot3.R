library(readr)
library(dplyr)

# read the file into a data frame
data <- read.table("household_power_consumption.txt",sep=";", header = T)

# put the dates in data in the format YYYY-MM-DD
data$Date <- as.Date(data$Date,tryFormats="%d/%m/%Y")

# filter the data to keep only the dates within the desired range
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")
data_subset <- filter(data, Date >= start_date & Date <= end_date)

#labels
days <- c(format(unique(data_subset$Date), "%a"),"Sat")

# Open PNG
png("Plot3.png",width=480,height=480,units="px")

# Create line plot for Global Active Power
plot(as.numeric(data_subset$Sub_metering_1),
     type = "l", xaxt = "n",
     ylab = "Energy sub metering")
lines(as.numeric(data_subset$Sub_metering_2), col = "red")
lines(as.numeric(data_subset$Sub_metering_3), col = "blue")
axis(1, at = c(0,1440,2880), labels = days)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)

# Save to PNG
dev.off()
