## this R script will create the plot4.png which is multi-graphic
## PNG of 4 different graphics  for feb 1-2, 2007

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
plot4 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

## combine date and time variables to create single variable
datetime <-strptime(paste(plot4$Date, plot4$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## specify device and size parameters
png("plot4.png", width=480, height=480)

## set parameter to display 4 graphics in 2x2 layout
par(mfrow = c(2,2))

## create line plot for global_active_power with label no label on x but assign y axis label
plot(datetime, as.numeric(plot4$Global_active_power), type="l", xlab ="", ylab="Global Active Power")

## create line plot for voltage with label default label on x but assign y axis label
plot(datetime, as.numeric(plot4$Voltage), type="l", ylab = "Voltage")

## create intial line plot for sub metering 1 with label on y axis
plot(datetime, as.numeric(plot4$Sub_metering_1), type="l", xlab = "", ylab="Energy sub metering")

## add red line into graphic for sub metering 2 
lines(datetime, as.numeric(plot4$Sub_metering_2), type="l", col ="red")

## add blue line into graphic for sub metering 3
lines(datetime, as.numeric(plot4$Sub_metering_3), type="l", col ="blue")

## add legend in top right corner with no border
legend("topright",col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, bty = "n")

## create line plot for Global_reactive_power with label default label on x but assign y axis label
plot(datetime, as.numeric(plot4$Global_reactive_power), type="l", ylab = "Global_reactive_power")

##close device
dev.off()
