plot1 <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

plot1$Global_active_power <- as.numeric(as.character(plot1$Global_active_power))

plot1 <- plot1[plot1$Date == "2007-02-01" | plot1$Date == "2007-02-02",]

hist(plot1$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
