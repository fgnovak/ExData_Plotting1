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

## Plot 4
png(file = "plot4.png")
par(mfrow = c(2,2))
## upper left (Same as Plot 2)

plot(data$dt,data$Glob_act_power,type ="l",xlab="",
     ylab = "Global Active Power (kilowatts")

## upper right
plot(data$dt,data$Voltage,type = "l",
     xlab = "datetime", ylab = "Voltage")

## lower left (Same as Plot 3, except no border on legend)

leg <- c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
plot(data$dt,data$Sub_metering_1,type = "l",
     ylab = "Energy sub metering", xlab ="")
lines(data$dt,data$sm2, type = "l", col = "red", axes = F)
lines(data$dt,data$sm3, type = "l", col = "blue", axes = F)
par(new = T)
legend("topright",leg, lty = c(1,1,1), col = c("black","red","blue"),
       bty = "n")

## lower right
plot(data$dt,data$Glob_react_power, type ="l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
