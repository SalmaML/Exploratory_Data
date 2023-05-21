
Plot4 <- function(df1) {
  print( "Ploting Plot4..")
  png('Plot4.png', width = 480, height = 480)
  
  par( mfrow = c(2,2), mar=c(4,4,2,1))
  plot(df1$DayTime, df1$Global_active_power  , type='l', ylab='Global Active Ppower', xlab ='')
  plot(df1$DayTime, df1$Voltage  , type='l', ylab='Voltage', xlab ='datetime')
  
  plot(df1$DayTime, df1$Sub_metering_1 , type='l', ylab='Energy Sub metering', xlab ='')
  lines(df1$DayTime, df1$Sub_metering_2, col='red', type='l')
  lines(df1$DayTime, df1$Sub_metering_3, col='blue', type='l')
  legend("topright", lty=1, col=c("black", "red", "blue"), c( 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  
  plot(df1$DayTime, df1$Global_reactive_power   , type='l', ylab='Global Reactive Ppower ', xlab ='datetime')
  dev.off ();
  
}