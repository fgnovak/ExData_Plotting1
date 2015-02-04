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

## Plot 1
png(file = "plot1.png")
hist(data$Glob_act_power,col= "red", main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)")
dev.off()
