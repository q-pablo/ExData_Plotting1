library(readr)
library(dplyr)

# read the file into a data frame
data <- read.table("household_power_consumption_extract.txt",sep=";", header = T)

# Open PNG
png("Plot1.png",width=480,height=480,units="px")

# Create the histogram for Global Active Power
hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

# Save to PNG
dev.off()
