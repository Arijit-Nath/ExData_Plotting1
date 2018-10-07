#Read the Electric usages data from 1/2/2017 to 2/2/2007
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';'
                   ,as.is=F,na.strings=c('?'),stringsAsFactors=F)

#Add Columns names from the inout file 1st row
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

#Plot histogram
#PNG file with 480x480
png("plot 1.png", width=480, height=480)
#Draw histogram into the png file
hist(data$Global_active_power, col = "red"
     , xlab = "Global Active Power (killowatts)", main = "Global Active Power")

dev.off()