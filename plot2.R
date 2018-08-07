# read the original data, dim = (2075259, 9)
df <- read.csv("household_power_consumption.txt", 
               sep = ";", 
               dec = ".",
               stringsAsFactors = FALSE)

# extract the data where Date equal to 2007-02-01 and 2007-02-02
df_2007 <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

# change class of global_active_power from character to numeric
df_2007$Global_active_power <- as.numeric(df_2007$Global_active_power)

# plot to the plot2.png
png("plot2.png", width = 480, height = 480)

datetime <- strptime(paste(df_2007$Date, df_2007$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

plot(datetime, df_2007$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()