#by jguszr on sept/2016

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

#Since Im in Brazil I also change the Timezone in order to set the weekdays in english,but I don't know
# why the weekdays stills being plotted in portuguese. 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "),
                     format = "%d/%m/%Y %H:%M:%S",
                     tz="America/Louisville") 


png("plot3.png", width=480, height=480)

with(subset(data,Date %in% c("1/2/2007","2/2/2007")), 
     plot(datetime,
          as.numeric(Sub_metering_1),
          type="l", 
          ylab="Energy Submetering", 
          xlab=""))

with(subset(data,Date %in% c("1/2/2007","2/2/2007")),
     lines(datetime, 
           as.numeric(Sub_metering_2), 
           type="l", 
           col="red"))

with(subset(data,Date %in% c("1/2/2007","2/2/2007")),
     lines(datetime, 
           as.numeric(Sub_metering_3), 
           type="l", 
           col="blue"))


legend("topright", 
       c("Sub_metering_1", 
         "Sub_metering_2", 
         "Sub_metering_3"), 
       lty=1, 
       lwd=2.5, 
       col=c("black", "red", "blue")
       )

dev.off()