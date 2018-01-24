# read and process data
data <- read.table('household_power_consumption.txt',header=TRUE, sep=';',na.strings='?')
data$Time<-strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

sdata<-subset(data,Date<='2007-02-02'& Date>='2007-02-01')
attach(sdata)

# making plot
png("plot3.png", width=480, height=480)
plot(Time,Sub_metering_1,type='l',col='black',ylab='Energy sub metering')
lines(Time, Sub_metering_2,col='red')
lines(Time, Sub_metering_3,col='blue')
legend("topright",col=c('black','red','blue'),lty=1,legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
# dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()