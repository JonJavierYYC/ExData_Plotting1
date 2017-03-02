## this R script will create the plot3.png which is a line plot of
## the 3 sub metering variables for feb 1-2, 2007

##download dataset if necessary
f <- "dataset.zip"
if (!file.exists(f)){
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, f)
}  

## unzip downloaded file 
if (!file.exists("household_power_consumption.txt")) { 
  unzip(f) 
}

##read in complete data set
mydata <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors = FALSE)

##filter for specified days
plot3 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

## combine date and time variables to create single variable
datetime <-strptime(paste(plot3$Date, plot3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## specify device and size parameters
png("plot3.png", width=480, height=480)

## create intial line plot for sub metering 1 with label on y axis
plot(datetime, as.numeric(plot3$Sub_metering_1), type="l", xlab = "", ylab="Energy sub metering")

## add red line into graphic for sub metering 2 
lines(datetime, as.numeric(plot3$Sub_metering_2), type="l", col ="red")

## add blue line into graphic for sub metering 3
lines(datetime, as.numeric(plot3$Sub_metering_3), type="l", col ="blue")

## add legend in top right corner
legend("topright",col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)

##close device
dev.off()
