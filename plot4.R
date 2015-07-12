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

plot4 <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

plot4 <- transform(plot4, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2), cex.lab = 0.75, cex.axis = 0.75)
with(plot4, {
  plot(plot4$timestamp, plot4$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(plot4$timestamp, plot4$Voltage, type = "l", xlab = "datime", ylab = "Voltage")
  plot(plot3$timestamp, plot3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(plot3$timestamp, plot3$Sub_metering_2, type = "l", col = "red")
  lines(plot3$timestamp, plot3$Sub_metering_3, type = "l", col = "blue")
  legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(1,1), cex = 0.55, bty = "n")
  plot(plot4$timestamp, plot4$Global_reactive_power, type = "l", xlab = "datetime")
})

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
