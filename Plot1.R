

Plot1 <- function(df1) {
  print( "Ploting Plot1...")
  png('Plot1.png', width = 480, height = 480)
  
  par( mfrow = c(1,1), mar=c(4,4,2,1))
  hist(as.double( df1$Global_active_power ), col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
  
  dev.off ();
}