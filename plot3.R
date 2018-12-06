library(readr)
library(lubridate)

data <- read_delim('household_power_consumption.txt', ';')
data$Date <- dmy(data$Date)
data <- data[!is.na(data$Global_active_power) &
            (data$Date == '2007-02-01' | data$Date == '2007-02-02'),]
data$DateTime <- ymd(data$Date) + hms(data$Time)

dev.new(width = 480, height = 480, unit = "px")
with(data, plot(DateTime,
                Sub_metering_1,
                type = 'n',
                xlab = '',
                ylab = 'Energi sub metering'))
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
        x.intersp=1)
dev.copy(png,'plot3.png')
dev.off()
