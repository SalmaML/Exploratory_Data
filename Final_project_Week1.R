#clear all variables
rm(list = ls())
source("Plot1.R")
source("Plot2.R")
source("Plot3.R")
source("Plot4.R")


#load the necessary library
# Functions t plot the result

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

# Plot-1: Global Active Power
Plot1(df1)
readkey()

# Plot-2: Global Active Power
df1$time_temp <- paste(df1$Date, df1$Time)
df1$DayTime <- strptime(df1$time_temp, format = "%Y-%m-%d %H:%M:%S")
Plot2(df1)
readkey()

# Plot-3: Sub_metering_1, 2, 3
Plot3(df1)
readkey()

# Plot-4: Sub_metering_1, 2, 3

Plot4(df1)
