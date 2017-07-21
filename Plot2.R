
d<-read.csv(file="household_power_consumption.txt",sep=';',stringsAsFactors=FALSE, dec=".")
d$Date<-as.Date(d$Date, format = "%d/%m/%Y")
fd<-subset(d,Date=="2007-02-01"|Date=="2007-02-02")

fd$datetime <-paste(fd$Date, fd$Time)
fd$datetime<-strptime(fd$datetime, "%Y-%m-%d %H:%M:%S")


fd$Global_active_power<-as.numeric(fd$Global_active_power)


## Plot 2: Global Active Power by Day

png(filename = "Plot2.png",
    width = 480, height = 480)

plot(fd$datetime,fd$Global_active_power
     ,type = "l"
     ,ylab="Global Active Power(kilowatts)"
     ,xlab=" ")

dev.off()
