# Coursera Exploring Data coursework 1 plot 1

# load data
data = read.table('household_power_consumption.txt',sep = ";", 
                  header = TRUE, na.strings = "?")

data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.

newdata <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]

# open graphics device (must be done before plot commands)
png(filename = 'plot1.png', width = 480, height = 480, units = "px")

# Plot histogram
hist(newdata$Global_active_power, col = "red", main = paste("Global Active Power") 
     , xlab= "Global Active Power (kilowatts)")

# Save as .png
#png(filename = 'plot1.png', width = 480, height = 480, units = "px")
dev.off()