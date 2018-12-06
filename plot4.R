library(readr)
library(lubridate)

data <- read_delim('household_power_consumption.txt', ';')
data$Date <- dmy(data$Date)
data <- data[!is.na(data$Global_active_power) &
            (data$Date == '2007-02-01' | data$Date == '2007-02-02'),]
data$DateTime <- ymd(data$Date) + hms(data$Time)

dev.new(width = 480, height = 480, unit = "px")
par(mfrow=c(2,2))
par(mfcol=c(2,2))

with(data, plot(DateTime,
                Global_active_power,
                type = 'n',
                xlab = '',
                ylab = 'Global Active Power'))
with(data, lines(DateTime,
                Global_active_power))

with(data, plot(DateTime,
                Sub_metering_1,
                type = 'n',
                xlab = '',
                ylab = 'Energy sub metering'))
with(data, lines(DateTime,
                Sub_metering_1))
with(data, lines(DateTime,
                Sub_metering_2, col = 'red'))
with(data, lines(DateTime,
                Sub_metering_3, col = 'blue'))
legend('topright',
        legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'),
        col = c('black', 'red', 'blue'),
        lty = 1,
        bty = 'n')

with(data, plot(DateTime,
                Voltage,
                type = 'n',
                xlab = 'datetime',
                ylab = 'Voltage'))
with(data, lines(DateTime,
                Voltage))

with(data, plot(DateTime,
                Global_reactive_power,
                type = 'n',
                xlab = 'datetime',
                ylab = 'Global_reactive_power'))
with(data, lines(DateTime,
                Global_reactive_power))
dev.copy(png,'plot4.png')
dev.off()
