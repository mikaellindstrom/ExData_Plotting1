## plot1.R
##
## project exercise number 1, plot 3
## 
## Create PNG file with histogram of Global active power consumption for 1-2 February, 2007.


## 1. Read in file
dataset<-read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))

## 2. Create subset of just 1-2 February, 2007
subdataset<-subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")

## 3. Add timestamp column that is combination of Date and Time columns
##    and convert it to POSIXct format
subdataset$timestamp<-strptime(paste(subdataset$Date,
                                     subdataset$Time),
                               "%d/%m/%Y %H:%M:%S")

## 4. Open PNG device to create plot3.png
png("plot3.png", width=480, height=480)

## 5. Create plot
plot(subdataset$timestamp,
     subdataset$Sub_metering_1,
     type="l", col="black",
     xlab="",
     ylab="Energy sub metering")

lines(subdataset$timestamp,
     subdataset$Sub_metering_2,
     col="red")

lines(subdataset$timestamp,
     subdataset$Sub_metering_3,
     col="blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       cex=0.9,
       col=c("black","red","blue"))

## 6. Close file to write out plot to file
dev.off()

