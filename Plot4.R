
d<-read.csv(file="household_power_consumption.txt",sep=';',stringsAsFactors=FALSE, dec=".")

d$Date<-as.Date(d$Date, format = "%d/%m/%Y")
fd<-subset(d,Date=="2007-02-01"|Date=="2007-02-02")

fd$datetime <-paste(fd$Date, fd$Time)
fd$datetime<-strptime(fd$datetime, "%Y-%m-%d %H:%M:%S")


fd$Global_active_power<-as.numeric(fd$Global_active_power)
fd$Sub_metering_1<-as.numeric(fd$Sub_metering_1)
fd$Sub_metering_2<-as.numeric(fd$Sub_metering_2)
fd$Sub_metering_3<-as.numeric(fd$Sub_metering_3)
fd$Voltage<-as.numeric(fd$Voltage)
fd$Global_reactive_power<-as.numeric(fd$Global_reactive_power)

##### Plot 4 

png(filename = "Plot4.png",
    width = 480, height = 480)

par(mfrow=c(2,2))

## top left
plot(fd$datetime,(fd$Global_active_power)
     ,type = "l"
     ,ylab="Global Active Power(kilowatts)"
     ,xlab=" ")

## top right
plot(fd$datetime,fd$Voltage
     ,type="l"
     ,ylab="Voltage"
     ,xlab="datetime")

## bottom left
plot(fd$datetime,fd$Sub_metering_1,type = "l",ylim=c(0,40),ylab="Energy sub meltering",xlab=" ")
par(new=T)
plot(fd$datetime,fd$Sub_metering_2,type = "l",col="red",ylim=c(0,40),ylab=" ",xlab=" ")
par(new=T)
plot(fd$datetime,fd$Sub_metering_3,type = "l",col="blue",ylim=c(0,40),,ylab=" ",xlab=" ")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=c(1,1)
       ,cex = 0.7
       ,lwd=c(2.5,2.5,2.5)
       ,col=c("black","blue","red")
       ,bty = "n" )

## bottom right

plot(fd$datetime,(fd$Global_reactive_power)
     ,type="l"
     ,ylab="Global_reactive_power"
     ,xlab="datetime")

dev.off()


