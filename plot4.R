# read the original data, dim = (2075259, 9)
df <- read.csv("household_power_consumption.txt", 
               sep = ";", 
               dec = ".",
               stringsAsFactors = FALSE)

# extract the data where Date equal to 2007-02-01 and 2007-02-02
df_2007 <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

# change class from character to numeric
df_2007$Global_active_power <- as.numeric(df_2007$Global_active_power)
df_2007$Global_reactive_power <- as.numeric(df_2007$Global_reactive_power)

df_2007$Voltage <- as.numeric(df_2007$Voltage)

df_2007$Sub_metering_1 <- as.numeric(df_2007$Sub_metering_1)
df_2007$Sub_metering_2 <- as.numeric(df_2007$Sub_metering_2)
df_2007$Sub_metering_3 <- as.numeric(df_2007$Sub_metering_3)

# plot to the plot4.png
png("plot4.png", width = 480, height = 480)

datetime <- strptime(paste(df_2007$Date, df_2007$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

plot(datetime, df_2007$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     col = "black",
     type = "l")

plot(datetime, df_2007$Voltage,
     xlab = "datetime",
     ylab = "Voltate",
     col = "black",
     type = "l")

plot(datetime, df_2007$Sub_metering_1, 
     xlab = "",
     ylab = "Energy Sub metering",
     col = "black",
     type = "l")

lines(datetime, df_2007$Sub_metering_2, type = "l", col = "red")
lines(datetime, df_2007$Sub_metering_3, type = "l", col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1,
       lwd = 2.5,
       bty = "n")

plot(datetime, df_2007$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     col = "black",
     type = "l")

dev.off()