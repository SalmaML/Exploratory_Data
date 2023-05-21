
Plot3 <- function(df1) {
  print( "Ploting Plot3...")
  png('Plot3.png', width = 480, height = 480)
  
  par( mfrow = c(1,1), mar=c(4,4,2,1))
  plot(df1$DayTime, df1$Sub_metering_1 , type='l', ylab='Energy Sub metering', xlab ='')
  lines(df1$DayTime, df1$Sub_metering_2, col='red', type='l')
  lines(df1$DayTime, df1$Sub_metering_3, col='blue', type='l')
  legend("topright", lty=1, col=c("black", "red", "blue"), c( 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  dev.off ();
  
}
