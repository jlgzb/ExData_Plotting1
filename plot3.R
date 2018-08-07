# read the original data, dim = (2075259, 9)
df <- read.csv("household_power_consumption.txt", 
               sep = ";", 
               dec = ".",
               stringsAsFactors = FALSE)

# extract the data where Date equal to 2007-02-01 and 2007-02-02
df_2007 <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

# change class from character to numeric
df_2007$Sub_metering_1 <- as.numeric(df_2007$Sub_metering_1)
df_2007$Sub_metering_2 <- as.numeric(df_2007$Sub_metering_2)
df_2007$Sub_metering_3 <- as.numeric(df_2007$Sub_metering_3)

# plot to the plot3.png
png("plot3.png", width = 480, height = 480)

datetime <- strptime(paste(df_2007$Date, df_2007$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

plot(datetime, df_2007$Sub_metering_1, 
     type = "l", 
     col = "black",
     xlab = "",
     ylab = "Energy Submetering")

lines(datetime, df_2007$Sub_metering_2, type = "l", col = "red")
lines(datetime, df_2007$Sub_metering_3, type = "l", col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1,
       lwd = 2.5)

dev.off()

