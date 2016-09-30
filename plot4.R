#by jguszr on sept/2016

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

#Since Im in Brazil I also change the Timezone in order to set the weekdays in english,but I don't know
# why the weekdays stills being plotted in portuguese. 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "),
                     format = "%d/%m/%Y %H:%M:%S",
                     tz="America/Louisville")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, 
     as.numeric(subSetData$Global_active_power),
     type="l", 
     xlab="", 
     ylab="Global Active Power", 
     cex=0.2)

plot(datetime, 
     as.numeric(subSetData$Voltage), 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

plot(datetime, 
     as.numeric(subSetData$Sub_metering_1), 
     type="l", 
     ylab="Energy Submetering", 
     xlab="")

lines(datetime, 
      as.numeric(subSetData$Sub_metering_2),
      type="l", 
      col="red")

lines(datetime, as.numeric(subSetData$Sub_metering_3),
      type="l", 
      col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, 
       lwd=2.5, 
       col=c("black", "red", "blue"),
       bty="o")

plot(datetime, 
     as.numeric(subSetData$Global_reactive_power),
     type="l", 
     ylab="Global_reactive_power",
     xlab="datetime")

dev.off()