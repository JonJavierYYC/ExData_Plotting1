## this R script will create the plot2.png which is a line plot of
## the global active power for Feb 1-2, 2007

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
plot2 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

## combine date and time variables to create single variable
datetime <-strptime(paste(plot2$Date, plot2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## specify device and size parameters
png("plot2.png", width=480, height=480)

## create line plot with label on y axis
plot(datetime, as.numeric(plot1$Global_active_power), type="l", xlab ="", ylab="Global Active Power (kilowatts)")

##close device
dev.off()
