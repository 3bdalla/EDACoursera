#Plot2

#import data set
read.csv("./household_power_consumption.txt", 
         sep = ";", stringsAsFactors = FALSE, na.strings = "?") -> fData

#date formats
as.Date(fData$Date, format = "%d/%m/%Y") -> fData$nDate

#convert dates to datetime 
as.POSIXct(paste(fData$Date, fData$Time, sep = " "), 
           format = "%d/%m/%Y %H:%M:%S") -> fData$nTDate

#subset data
pData <- subset(fData, nDate == "2007-02-01" | nDate == "2007-02-02")

#initialize plot
png("plot2.png", 
    width = 480, 
    height = 480)
  
  #plot!
  plot(pData$nTDate, pData$Global_active_power, type = "n", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  
    lines(pData$nTDate, pData$Global_active_power)

#end
dev.off()
