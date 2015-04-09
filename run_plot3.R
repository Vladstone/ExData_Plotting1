# Create plot 3 in png file.
run_plot3 <- function() {
    
    # Read data file
    tbl <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

    # Replace date and time columns with a DateTime 
    rng <- cbind(strptime(paste(tbl[,1],tbl[,2]),format='%d/%m/%Y %H:%M:%S'), tbl[3:9])
    names(rng)[1] <- "Date_Time"
    
    # Take subset between Feb 1 2007 and Feb 3 2007
    rw <- (rng[,1] >= as.POSIXct('2007-02-01 00:00')) & (rng[,1] < as.POSIXct('2007-02-03 00:00'))
    rng <- rng[rw,]
    
    # Create graph of Sub Metering by day png file in working directory
    png(file="plot3.png")
    plot(rng$Date_Time, rng$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
    lines(rng$Date_Time, rng$Sub_metering_2, type="l", col="red")
    lines(rng$Date_Time, rng$Sub_metering_3, type="l", col="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1))
    dev.off()
    
}
