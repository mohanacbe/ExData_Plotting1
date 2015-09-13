require("data.table")

# Load: Household_power_consumption.txt
hpc <- read.table("./household_power_consumption.txt", header= TRUE,sep = ";" ,na.strings = "?")
hpc$Datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
tail(hpc,100)
hpc1 <- subset(hpc, hpc$Date>="2007-02-01" & hpc$Date<="2007-02-02")

####################################################################### Plot 1 to PNG file
dev.copy(png, file = "./GitHub/ExData_Plotting1/plot1.png")

# Plot 1 - Histogram - Global Active Power 
hist(hpc1$Global_active_power, main = "Global Active Power", 
     ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     breaks = 13, 
     ylim = c(0, 1200), 
     xlim = c(0, 6) ,
     xaxp = c(0, 6, 3),
     yaxp = c(0,1200,12)
)

# Set Dev off - back to default setting
####################################################################### Plot 2 to PNG file
dev.copy(png, file = "./GitHub/ExData_Plotting1/plot2.png")

# Plot 2 - Line Type -  Global Active Power 
plot(hpc1$Datetime, hpc1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Set Dev off - back to default setting
dev.off()

####################################################################### Plot 3 to PNG file
dev.copy(png, file = "./GitHub/ExData_Plotting1/plot3.png")

# Plot 3 - Line Type -  Global Active Power
plot(hpc1$Datetime, hpc1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

# Overlay Points in different color and legend at top right
points(hpc1$Datetime, hpc1$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(hpc1$Datetime, hpc1$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))                                                             

# Set Dev off - back to default setting
dev.off()

####################################################################### Plot 4 to PNG file
dev.copy(png, file = "./GitHub/ExData_Plotting1/plot4.png")

# set up mfrow
par(mfrow = c(2, 2))

# plot 4.1 (1,1)
plot(hpc1$Datetime, hpc1$Global_active_power, type = "l", ylab = "Global Active Power",  xlab = "")

# plot 4.2 (1,2)
plot(hpc1$Datetime, hpc1$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 4.3 (2,1)
plot(hpc1$Datetime, hpc1$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
points(hpc1$Datetime, hpc1$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
points(hpc1$Datetime, hpc1$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# plot 4.4 (2,2)
plot(hpc1$Datetime, hpc1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))

# Set Dev off - back to default setting
dev.off()
