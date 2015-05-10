# Read the data and extract the subset within the two relevant days
library(lubridate)
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
usedData <- subset(df, dmy(df$Date) >= ymd("2007-02-01") & 
                       dmy(df$Date) <= ymd("2007-02-02"))

png("plot4.png", width=800, height=800, units="px")
# Generate a 2x2 grouping of plots
par(mfrow=c(2,2))

# Global active power plot
plot(rownames(usedData), as.numeric(as.character(usedData$Global_active_power)), 
     xlab="", ylab="Global Active Power(kilowatts)", pch="", type="o", xaxt="n")
axis(1, at=row.names(usedData[1,]), labels=weekdays(dmy(usedData$Date)[1]))
mid <- subset(usedData, usedData$Date == "2/2/2007")
axis(1, at=row.names(mid)[1], labels=weekdays(dmy(mid[1,1])))
axis(1, at=row.names(usedData[length(usedData$Date),]), labels="Saturday")

# Voltage plot
plot(rownames(usedData), as.numeric(as.character(usedData$Voltage)), 
     xlab="datetime", ylab="Voltage", pch="", type="o", xaxt="n")
axis(1, at=row.names(usedData[1,]), labels=weekdays(dmy(usedData$Date)[1]))
mid <- subset(usedData, usedData$Date == "2/2/2007")
axis(1, at=row.names(mid)[1], labels=weekdays(dmy(mid[1,1])))
axis(1, at=row.names(usedData[length(usedData$Date),]), labels="Saturday")

# Energy sub metering plot
plot(rownames(usedData), as.numeric(as.character(usedData$Sub_metering_1)), xlab="", 
     ylab="Energy sub metering", pch="", type="o", xaxt="n")
lines(rownames(usedData), as.numeric(as.character(usedData$Sub_metering_2)), 
      col="red")
lines(rownames(usedData), as.numeric(as.character(usedData$Sub_metering_3)), 
      col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty,lwd=1, col=c("black", "red", "blue"))
axis(1, at=row.names(usedData[1,]), labels=weekdays(dmy(usedData$Date)[1]))
mid <- subset(usedData, usedData$Date == "2/2/2007")
axis(1, at=row.names(mid)[1], labels=weekdays(dmy(mid[1,1])))
axis(1, at=row.names(usedData[length(usedData$Date),]), labels="Saturday")

# Global reactive power plot
plot(rownames(usedData), as.numeric(as.character(usedData$Global_reactive_power)), 
     xlab="datetime", ylab="Global_reactive_power", pch="", type="o", xaxt="n")
axis(1, at=row.names(usedData[1,]), labels=weekdays(dmy(usedData$Date)[1]))
mid <- subset(usedData, usedData$Date == "2/2/2007")
axis(1, at=row.names(mid)[1], labels=weekdays(dmy(mid[1,1])))
axis(1, at=row.names(usedData[length(usedData$Date),]), labels="Saturday")

dev.off()