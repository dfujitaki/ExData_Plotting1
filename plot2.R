require('dplyr')

setwd('C:/Users/user/Desktop/Work/data science courses/data/eda')

data <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')

data <- data %>% filter(Date == '1/2/2007' | Date == '2/2/2007' )

data$Global_active_power <- as.numeric(data$Global_active_power)
data$datetime <- as.POSIXct(paste(data$Date, data$Time)
                         , format = "%d/%m/%Y %H:%M:%S")

with(data, plot(y=Global_active_power, x= datetime, type = 'l'
                , main='Global Active Power'
                ,ylab = 'Global Active Power (kilowatts)'
                ,xlab = ""
                ))

dev.copy(png, file='plot2.png')
dev.off()