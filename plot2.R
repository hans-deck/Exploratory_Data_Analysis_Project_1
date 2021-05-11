library(data.table)
library(tidyverse)
rm(list = ls())

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

png("plot2.png", width=480, height=480)

# Plot 2
plot(x = subset_powerDT[, dateTime]
     , y = subset_powerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
