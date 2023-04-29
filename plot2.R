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
png("Plot2.png",width=480,height=480,units="px")

# Create line plot for Global Active Power
plot(as.numeric(data_subset$Global_active_power), type = "l", xaxt = "n",
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(0,1440,2880), labels = days)

# Save to PNG
dev.off()
