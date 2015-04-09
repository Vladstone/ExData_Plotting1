# Create plot 1 in png file.
run_plot1 <- function() {
    
    # Read data file
    tbl <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

    # Replace date and time columns with a DateTime 
    rng <- cbind(strptime(paste(tbl[,1],tbl[,2]),format='%d/%m/%Y %H:%M:%S'), tbl[3:9])
    names(rng)[1] <- "Date_Time"
    
    # Take subset between Feb 1 2007 and Feb 3 2007
    rw <- (rng[,1] >= as.POSIXct('2007-02-01 00:00')) & (rng[,1] < as.POSIXct('2007-02-03 00:00'))
    rng <- rng[rw,]
    
    # Create Histogram of Global Active Power png file in working directory
    png(file="plot1.png")
    hist(rng$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
    dev.off()
    
}
