#by jguszr on sept/2016
#Since Im in Brazil I also change the Timezone in order to set the weekdays in english,but I don't know
# why the weekdays stills being plotted in portuguese. 
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

png("plot2.png", width=480, height=480)

with(subset(data,Date %in% c("1/2/2007","2/2/2007")),
     plot(strptime(paste(Date, Time, sep=" "), 
                   format = "%d/%m/%Y %H:%M:%S",
                   tz = "America/Louisville"),
          as.numeric(Global_active_power),
          type="l", 
          xlab="", 
          ylab="Global Active Power (kilowatts)")
     )
dev.off()