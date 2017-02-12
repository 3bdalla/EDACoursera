#Plot1

#import data set
read.csv("./household_power_consumption.txt", 
         sep = ";", stringsAsFactors = FALSE, na.strings = "?") -> fData

#change date class and filter data
as.Date(fData$Date, format = "%d/%m/%Y") -> fData$nDate

pData <- subset(fData, nDate == "2007-02-01" | nDate == "2007-02-02")

#making sure parameters are not set up for multiple plots
par(mfrow = c(1,1)) 

#initialize plot
png("plot1.png", 
    width = 480, 
    height = 480)

  #plot!
  hist(pData$Global_active_power, col = "red", 
       main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)")

#done!
dev.off()
