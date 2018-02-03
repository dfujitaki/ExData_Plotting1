require('dplyr')

setwd('C:/Users/user/Desktop/Work/data science courses/data/eda')

data <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')

data <- data %>% filter(Date == '1/2/2007' | Date == '2/2/2007' )

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$datetime <- as.POSIXct(paste(data$Date, data$Time)
                            , format = "%d/%m/%Y %H:%M:%S")

with(data, plot(y=Sub_metering_1, x=datetime, main='', type='n'
                ,ylab = 'Energy sub metering'
                ,xlab = ''))
with(data, lines(y=Sub_metering_1, x= datetime, type = 'l'
                ,col= 'black'))
with(data, lines(y=Sub_metering_2, x=datetime, type='l'
                ,col = 'red'))
with(data, lines(y=Sub_metering_3, x=datetime, type='l'
                 ,col = 'blue'))
legend('topright', lty = 1, lwd = 1
       ,legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
       ,col=c('black', 'red', 'blue'), cex=.9)

dev.copy(png, file='plot3.png')
dev.off()