require("data.table")

# Load: Household_power_consumption.txt
hpc <- read.table("./household_power_consumption.txt", header= TRUE,sep = ";" ,na.strings = "?")

# Date & Time conversion
hpc$Datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

# Filter out only February 1 & 2 data
hpc1 <- subset(hpc, hpc$Date>="2007-02-01" & hpc$Date<="2007-02-02")

# Dev setting
dev.copy(png, file = "./GitHub/ExData_Plotting1/plot3.png")

# dev.cur()

# Plot 3 - Line Type -  Global Active Power 
plot(hpc1$Datetime, hpc1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

# Overlay Points in different color and legend at top right
points(hpc1$Datetime, hpc1$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(hpc1$Datetime, hpc1$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))                                                             

# Set Dev off - back to default setting
dev.off()
