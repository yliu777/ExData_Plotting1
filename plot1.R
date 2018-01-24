# read and process data
data <- read.table('household_power_consumption.txt',header=TRUE, sep=';',na.strings='?')
data$Time<-strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

sdata<-subset(data,Date<='2007-02-02'& Date>='2007-02-01')

# making histogram
par(mfrow=c(1,1))
hist(sdata$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
