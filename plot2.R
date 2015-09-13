require("data.table")

# Load: Household_power_consumption.txt
hpc <- read.table("./household_power_consumption.txt", header= TRUE,sep = ";" ,na.strings = "?")

# Date & Time conversion
hpc$Datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

# Filter out only February 1 & 2 data
hpc1 <- subset(hpc, hpc$Date>="2007-02-01" & hpc$Date<="2007-02-02")

# Dev setting
dev.copy(png, file = "./GitHub/ExData_Plotting1/plot2.png")

# dev.cur()

# Plot 2 - Line Type -  Global Active Power 
plot(hpc1$Datetime, hpc1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Set Dev off - back to default setting
dev.off()
