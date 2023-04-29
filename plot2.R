library(readr)
library(dplyr)

# read the file into a data frame
data <- read.table("household_power_consumption_extract.txt",sep=";", header = T)

#labels
days <- c(format(unique(as.Date(data$Date)), "%a"),"Sat")

# Open PNG
png("Plot2.png",width=480,height=480,units="px")

# Create line plot for Global Active Power
plot(as.numeric(data$Global_active_power), type = "l", xaxt = "n",
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(0,1440,2880), labels = days)

# Save to PNG
dev.off()
