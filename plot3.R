# Read the data and extract the subset within the two relevant days
library(lubridate)
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
usedData <- subset(df, dmy(df$Date) >= ymd("2007-02-01") & 
                       dmy(df$Date) <= ymd("2007-02-02"))

# Plot each energy sub metering column as a separate line vs. time
png("plot3.png", width=650, height=500, units="px")
plot(rownames(usedData), as.numeric(as.character(usedData$Sub_metering_1)), xlab="", 
     ylab="Energy sub metering", pch="", type="o", xaxt="n")
lines(rownames(usedData), as.numeric(as.character(usedData$Sub_metering_2)), 
      col="red")
lines(rownames(usedData), as.numeric(as.character(usedData$Sub_metering_3)), 
      col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty,lwd=1, col=c("black", "red", "blue"))

# Add days on x-axis
axis(1, at=row.names(usedData[1,]), labels=weekdays(dmy(usedData$Date)[1]))
mid <- subset(usedData, usedData$Date == "2/2/2007")
axis(1, at=row.names(mid)[1], labels=weekdays(dmy(mid[1,1])))
axis(1, at=row.names(usedData[length(usedData$Date),]), labels="Saturday")

dev.off()
