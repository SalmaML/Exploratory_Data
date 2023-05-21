
Plot2 <- function(df1) {
  print( "Ploting Plot2...")
  png('Plot2.png', width = 480, height = 480)
  
  par( mfrow = c(1,1), mar=c(4,4,2,1))
  plot(df1$DayTime, df1$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab ='')
  dev.off ();
  
}