library(readr)
library(lubridate)

data <- read_delim('household_power_consumption.txt', ';')
data$Date <- dmy(data$Date)
data <- data[!is.na(data$Global_active_power) &
            (data$Date == '2007-02-01' | data$Date == '2007-02-02'),]
data$DateTime <- ymd(data$Date) + hms(data$Time)

dev.new(width = 480, height = 480, unit = "px")
with(data, plot(DateTime,
                Global_active_power,
                type = 'n',
                xlab = '',
                ylab = 'Global Active Power (killowatts)'))
with(data, lines(DateTime,
                Global_active_power))
dev.copy(png,'plot2.png')
dev.off()
