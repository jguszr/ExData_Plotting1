#by jguszr on sept/2016

dataFile <- "./data/household_power_consumption.txt"
data<- read.csv(dataFile,header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
png("plot1.png", width=480, height=480)

with(subset(data,Date %in% c("1/2/2007","2/2/2007")), hist(as.numeric(Global_active_power),
                  col="red",
                  xlab="Global Active Power(Killowatts)",
                  main="Global Active Power" ))
dev.off()
