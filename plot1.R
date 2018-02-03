require('dplyr')

setwd('C:/Users/user/Desktop/Work/data science courses/data/eda')

data <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')
            
data <- data %>% filter(Date == '1/2/2007' | Date == '2/2/2007' )

data$Global_active_power <- as.numeric(data$Global_active_power)

with(data, hist(Global_active_power, main='Global Active Power'
                ,col='red',xlab='Global Active Power (kilowatts)'))

dev.copy(png, file='plot1.png')
dev.off()