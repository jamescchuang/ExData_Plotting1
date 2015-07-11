setwd("/Users/yellowcc/Dropbox/source/ExploratoryDataAnalysis/project1")

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

plot2 <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

plot2 <- transform(plot2, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(plot2$timestamp, plot2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
