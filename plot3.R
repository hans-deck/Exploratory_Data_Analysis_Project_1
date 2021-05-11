library(data.table)
library(tidyverse)


# Read the Electric Power Consuption dataset

powerDT <- fread("household_power_consumption.txt", na.strings="?")
str(powerDT)

# New Column  dateTime gernerated
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Subset from 2007-02-01 til 2007-02_02

subset_powerDT <- powerDT %>%
  subset((powerDT$dateTime >= "2007-02-01") & (powerDT$dateTime < "2007-02-03") )
head(subset_powerDT)
tail(subset_powerDT)

png("plot3.png", width=480, height=480)

# Plot 3
plot(subset_powerDT[, dateTime], subset_powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(subset_powerDT[, dateTime], subset_powerDT[, Sub_metering_2],col="red")
lines(subset_powerDT[, dateTime], subset_powerDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()