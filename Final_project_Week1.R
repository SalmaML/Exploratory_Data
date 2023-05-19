#clear all variables
rm(list = ls())

#load the necessary library
#library(dplyr)

readkey <- function() {
  line <- readline(prompt="Press [enter] to continue")
}

print( "Load file...")

#Load the dataframe
col_names <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

df <- read.table("household_power_consumption.txt", skip = 1, header = FALSE, sep =';')

colnames( df) <- unlist(col_names)

print( "Change the format date..." )

class(df$Date)
df$Date <- as.Date(df$Date, "%d/%m/%Y")                # Convert character to date
class(df$Date)

print( "Subsetting...")
df1 <- df[df$Date>=as.Date('2007-02-01') & df$Date<=as.Date('2007-02-02'),];

#Making Plots
print( "Global_active_power histogram")

# Plot-1: Global Active Power
hist(as.double( df1$Global_active_power ), col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')

readkey()

# Plot-2: Global Active Power
print( "Global_active_power")
df1$time_temp <- paste(df1$Date, df1$Time)
df1$DayTime <- strptime(df1$time_temp, format = "%Y-%m-%d %H:%M:%S")
plot(df1$DayTime, df1$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab ='')
readkey()

# Plot-3: Sub_metering_1, 2, 3
print( "Sub_metering")
plot(df1$DayTime, df1$Sub_metering_1 , type='l', ylab='Energy Sub metering', xlab ='')
lines(df1$DayTime, df1$Sub_metering_2, col='red', type='l')
lines(df1$DayTime, df1$Sub_metering_3, col='blue', type='l')
legend("topright", lty=1, col=c("black", "red", "blue"), c( 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

readkey()

# Plot-4: Sub_metering_1, 2, 3
print( "Plot-4")
par( mfrow = c(2,2), mar=c(4,4,2,1))
plot(df1$DayTime, df1$Global_active_power  , type='l', ylab='Global Active Ppower', xlab ='')
plot(df1$DayTime, df1$Voltage  , type='l', ylab='Voltage', xlab ='datetime')

plot(df1$DayTime, df1$Sub_metering_1 , type='l', ylab='Energy Sub metering', xlab ='')
lines(df1$DayTime, df1$Sub_metering_2, col='red', type='l')
lines(df1$DayTime, df1$Sub_metering_3, col='blue', type='l')
legend("topright", lty=1, col=c("black", "red", "blue"), c( 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

plot(df1$DayTime, df1$Global_reactive_power   , type='l', ylab='Global Reactive Ppower ', xlab ='datetime')



