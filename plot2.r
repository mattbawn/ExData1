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
png(filename = 'plot2.png', width = 480, height = 480, units = "px")

plot(newdate, newdata$Global_active_power, type = "l" ,xlab = " ",
     ylab = "Global Active Power (kilowatts)")



# Save as .png
#dev.copy(png, file = "plot2.png")
dev.off()