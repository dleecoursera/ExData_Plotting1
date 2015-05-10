# Read the data and extract the subset within the two relevant days
library(lubridate)
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
usedData <- subset(df, dmy(df$Date) >= ymd("2007-02-01") & 
                       dmy(df$Date) <= ymd("2007-02-02"))

# Plot global active power vs. time
png("plot2.png", width=700, height=700, units="px")
plot(rownames(usedData), as.numeric(as.character(usedData$Global_active_power)), 
     xlab="", ylab="Global Active Power(kilowatts)", pch="", type="o", xaxt="n")

# Add days on x-axis
axis(1, at=row.names(usedData[1,]), labels=weekdays(dmy(usedData$Date)[1]))
mid <- subset(usedData, usedData$Date == "2/2/2007")
axis(1, at=row.names(mid)[1], labels=weekdays(dmy(mid[1,1])))
axis(1, at=row.names(usedData[length(usedData$Date),]), labels="Saturday")

dev.off()