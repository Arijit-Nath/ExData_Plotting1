#Read the Electric usages data from 1/2/2017 to 2/2/2007
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';'
                   ,as.is=F,na.strings=c('?'),stringsAsFactors=F)

#Add Columns names from the inout file 1st row
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

#Convert dat & time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Convert to numeric value
globalActivePower <- as.numeric(data$Global_active_power)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

#Open PNG file for plotting
png("plot4.png", width=480, height=480)

#Change Globar parameter for 2x2 plots
par(mfrow = c(2, 2)) 

#Plot Global Active Power
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plot Voltage
plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot SubMetering1, SubMetering2, & SubMetering3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Plot Golbal Reactive Power
plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()