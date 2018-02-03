require('dplyr')

setwd('C:/Users/user/Desktop/Work/data science courses/data/eda')

data <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')

data <- data %>% filter(Date == '1/2/2007' | Date == '2/2/2007' )

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$datetime <- as.POSIXct(paste(data$Date, data$Time)
                            , format = "%d/%m/%Y %H:%M:%S")

par(mfrow= c(2,2))

with(data, {
      plot(y=Global_active_power, x= datetime,xlab = ""
           ,ylab = 'Global Active Power', type='l')
      plot(y=Voltage, x=datetime, type='l')
      with(data, plot(y=Sub_metering_1, x=datetime, main='', type='n'
                      ,ylab = 'Energy sub metering'
                      ,xlab = ''))
      with(data, lines(y=Sub_metering_1, x= datetime
                       ,col= 'black'))
      with(data, lines(y=Sub_metering_2, x=datetime
                       ,col = 'red'))
      with(data, lines(y=Sub_metering_3, x=datetime
                       ,col = 'blue'))
      legend('topright', lty = 1, lwd = 1
             ,legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
             ,col=c('black', 'red', 'blue'), cex=.75)
      plot(y=Global_reactive_power, x=datetime, type = 'l')
})

dev.copy(png, file='plot4.png')
dev.off()