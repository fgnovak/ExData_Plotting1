## Exploratory Data Analysis Project 1
## Read the data
setwd("./R")
file <- "./4 - Exploring Data/household_power_consumption.txt"

data <- read.table(file, sep = ";" , skip = 66637, nrow = 2 * 1440)

names(data) <- c("date","time","Glob_act_power",
                 "Glob_react_power","Voltage","Glob_intensity",
                 "Sub_metering_1", "sm2","sm3")

data$date <- as.POSIXct(data$date,format = "%d/%m/%Y")

dt <- as.POSIXct(paste(data$date, data$time), format="%Y-%m-%d %H:%M:%S")
data <- cbind(data,dt)

## Plot 3
leg <- c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")

png(file = "plot3.png")
plot(data$dt,data$Sub_metering_1,type = "l",
     ylab = "Energy sub metering", xlab ="")
lines(data$dt,data$sm2, type = "l", col = "red", axes = F)
lines(data$dt,data$sm3, type = "l", col = "blue", axes = F)
par(new = T)
legend("topright",leg, lty = c(1,1,1), col = c("black","red","blue"))
dev.off()
