## this R script will create the plot1.png which is a histogram on 
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
plot1 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

## specify device and size parameters
png("plot1.png", width=480, height=480)

## create histogram with numberic conversion on Global_active_power
hist(as.numeric(plot1$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##close device
dev.off()

