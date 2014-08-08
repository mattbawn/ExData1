# Coursera Exploring Data coursework 1 plot 2

# load data
data = read.table('household_power_consumption.txt',sep = ";", 
                  header = TRUE, na.strings = "?")

# Change date to date format and time to character
data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y")
data$Time <- as.character(data$Time)

# We will only be using data from the dates 2007-02-01 and 2007-02-02.

newdata <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]

# concatenate the date and time values
newdate <- strptime(paste(newdata$Date, newdata$Time), format="%Y-%m-%d %H:%M:%S")


# open graphics device (must be done before plot commands)
png(filename = 'plot4.png', width = 480, height = 480, units = "px")

# Set 2x2 grid for plots, filling across rows
par(mfrow = c(2,2))


# top left

plot(newdate, newdata$Global_active_power, type = "l" ,xlab = "",
     ylab = "Global Active Power (kilowatts)")

# top right

plot(newdate, newdata$Voltage, type = "l", ylab = "Voltage")


# bottom left

plot(newdate, newdata[,7], type = "l", xlab = " ", ylab = "Energy sub metering")
lines(newdate, newdata[,8], col = "Red")
lines(newdate, newdata[,9], col = "Blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("Black","Red","Blue"), lwd = 1, bty = "n")

# bottom right

plot(newdate, newdata$Global_reactive_power, type = "l", ylab = "Global_reactive_power")

# Save as .png
#dev.copy(png, file = "plot4.png")
#png(filename = 'plot4.png', width = 480, height = 480, units = "px")

dev.off()