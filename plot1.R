library(data.table)
library(tidyverse)
rm(list = ls())

# Read the Electric Power Consuption dataset

powerDT <- fread("household_power_consumption.txt", na.strings="?")
str(powerDT)

# Change the date format

powerDT$Date <- as.Date(powerDT$Date, format = "%d/%m/%Y")

# Subset from 2007-02-01 til 2007-02_02

subset_powerDT <- powerDT %>%
              subset((powerDT$Date >= "2007-02-01") & (powerDT$Date < "2007-02-03") )
head(subset_powerDT)
tail(subset_powerDT)

hist(subset_powerDT$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "red")


# Save  to plot1.png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()