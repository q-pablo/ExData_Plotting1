# This script was used to extract the data from the dates that the assignment required.
# It assumes that the data is extracted in the active directory and that the file name is
# unmodified.
# I've added this extra script to save the extract of the data because I like to keep
# the source data to generate the graphs within the github project.
# The original file is too large to include it.

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

# write to file
write.table(data_subset, "household_power_consumption_extract.txt", sep = ";", row.names = FALSE, col.names = TRUE)
