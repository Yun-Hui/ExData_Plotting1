
##1. Read the file

d<-read.csv(file="household_power_consumption.txt",sep=';',stringsAsFactors=FALSE, dec=".")
d$Date<-as.Date(d$Date, format = "%d/%m/%Y")
fd<-subset(d,Date=="2007-02-01"|Date=="2007-02-02")

fd$Global_active_power<-as.numeric(fd$Global_active_power)

##Plot 1.hisgram of Global Active Power

png(filename = "Plot1.png",
    width = 480, height = 480)


hist((fd$Global_active_power),main="Global Active Power",
     col="red",
     xlab="Global Active Power(kilowatts)")

dev.off()