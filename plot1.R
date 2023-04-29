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

# Open PNG
png("Plot1.png",width=480,height=480,units="px")

# Create the histogram for Global Active Power
hist(as.numeric(data_subset$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

# Save to PNG
dev.off()
