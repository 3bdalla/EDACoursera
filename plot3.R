#Plot3

#import dataset
read.csv("./household_power_consumption.txt", 
         sep = ";", stringsAsFactors = FALSE, na.strings = "?") -> fData

#change to datetime
as.POSIXct(paste(fData$Date, fData$Time, sep = " "), 
           format = "%d/%m/%Y %H:%M:%S") -> fData$nTDate

#subset data
as.Date(fData$Date, format = "%d/%m/%Y") -> fData$nDate
pData <- subset(fData, nDate == "2007-02-01" | nDate == "2007-02-02")

#initialize plot
png("./plot3.png", 
    width = 480, 
    height = 480)

#plot!
plot(pData$nTDate, pData$Sub_metering_1, type = "n", 
     ylab = "Energy sub metering", xlab = "")

lines(pData$nTDate, pData$Sub_metering_1, col = "black")
lines(pData$nTDate, pData$Sub_metering_2, col = "red")
lines(pData$nTDate, pData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))


#end
dev.off()
