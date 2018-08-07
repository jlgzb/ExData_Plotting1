# read the original data, dim = (2075259, 9)
df <- read.csv("household_power_consumption.txt", 
               sep = ";", 
               dec = ".",
               stringsAsFactors = FALSE)

# extract the data where Date equal to 2007-02-01 and 2007-02-02
df_2007 <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

# change class of global_active_power from character to numeric
df_2007$Global_active_power <- as.numeric(df_2007$Global_active_power)

# plot to plot1.png
png("plot1.png", width = 480, height = 480)

hist(as.numeric(df_2007$Global_active_power), 
     col = "red",
     xlab = "Global Active Power (Kilowatts)",
     main = "Global Active Power")

dev.off()