require("data.table")

# Load: Household_power_consumption.txt
hpc <- read.table("./household_power_consumption.txt", header= TRUE,sep = ";" ,na.strings = "?")

# Date & Time conversion
hpc$Datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

# Filter out only February 1 & 2 data
hpc1 <- subset(hpc, hpc$Date>="2007-02-01" & hpc$Date<="2007-02-02")

# Dev setting
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
dev.off()

