# Read the data and extract the subset within the two relevant days
library(lubridate)
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
usedData <- subset(df, dmy(df$Date) >= ymd("2007-02-01") & 
                       dmy(df$Date) <= ymd("2007-02-02"))

# Generate histogram of global active power values
png("plot1.png", width=700, height=700, units="px")
hist(as.numeric(as.character(usedData$Global_active_power)), col="red", 
     xlab="Global Active Power(kilowatts)", main="Global Active Power")

dev.off()