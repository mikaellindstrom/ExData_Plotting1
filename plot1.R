## plot1.R
##
## project exercise number 1, plot 1
## 
## Create PNG file with histogram of Global active power consumption for 
## 1-2 February, 2007.


## 1. Read in file
dataset<-read.csv("household_power_consumption.txt",
                  sep=";",
                  header=TRUE,
                  na.strings=c("?"))

## 2. Create subset of just 1-2 February, 2007
subdataset<-subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")

## 3. Add timestamp column that is combination of Date and Time columns
subdataset$timestamp<-strptime(paste(subdataset$Date,
                                     subdataset$Time),
                               "%d/%m/%Y %H:%M:%S")

## 4. Open PNG device to create plot1.png
png("plot1.png", width=480, height=480)

## 5. Create histogram
hist(subdataset$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

## 6. Close file to write out histogram to file
dev.off()

