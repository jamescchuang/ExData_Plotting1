df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

df$Global_active_power <- gsub("?", NA, df$Global_active_power, fixed = TRUE)
df$Global_intensity <- gsub("?", NA, df$Global_intensity, fixed = TRUE)
df$Global_reactive_power <- gsub("?", NA, df$Global_reactive_power, fixed = TRUE)
df$Sub_metering_1 <- gsub("?", NA, df$Sub_metering_1, fixed = TRUE)
df$Sub_metering_2 <- gsub("?", NA, df$Sub_metering_2, fixed = TRUE)
df$Sub_metering_3 <- gsub("?", NA, df$Sub_metering_3, fixed = TRUE)
df$Voltage <- gsub("?", NA, df$Voltage, fixed = TRUE)

df <- na.omit(df)

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

plot3 <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

plot3 <- transform(plot3, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(plot3$timestamp, plot3$Sub_metering_1, type = "l", xlab = "", ylab = "Enger sub metering")
lines(plot3$timestamp, plot3$Sub_metering_2, type = "l", col = "red")
lines(plot3$timestamp, plot3$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(1,1))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
