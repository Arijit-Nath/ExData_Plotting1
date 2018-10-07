#Read the Electric usages data from 1/2/2017 to 2/2/2007
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';'
                   ,as.is=F,na.strings=c('?'),stringsAsFactors=F)

#Add Columns names from the inout file 1st row
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(data$Global_active_power)
#Open PNG file for the plot
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", ylab="Global Active Power (kilowatts)")
dev.off()