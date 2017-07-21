

##1. Read the file
d<-read.csv(file="household_power_consumption.txt",sep=';',stringsAsFactors=FALSE, dec=".")

d$Date<-as.Date(d$Date, format = "%d/%m/%Y")
fd<-subset(d,Date=="2007-02-01"|Date=="2007-02-02")

fd$datetime <-paste(fd$Date, fd$Time)
fd$datetime<-strptime(fd$datetime, "%Y-%m-%d %H:%M:%S")

fd$Sub_metering_1<-as.numeric(fd$Sub_metering_1)
fd$Sub_metering_2<-as.numeric(fd$Sub_metering_2)
fd$Sub_metering_3<-as.numeric(fd$Sub_metering_3)

## Plot3
png(filename = "Plot3.png",
    width = 480, height = 480)

plot(fd$datetime,fd$Sub_metering_1,type = "l",ylim=c(0,40),ylab="Energy sub meltering",xlab=" ")
par(new=T)
plot(fd$datetime,fd$Sub_metering_2,type = "l",col="red",ylim=c(0,40),ylab=" ")
par(new=T)
plot(fd$datetime,fd$Sub_metering_3,type = "l",col="blue",ylim=c(0,40),,ylab=" ")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),
       lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

dev.off()
