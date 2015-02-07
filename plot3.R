hpc<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")
revised_hpc<-hpc[(hpc$Date==as.Date("2007-02-01"))|(hpc$Date==as.Date("2007-02-02")),]
revised_hpc$datetime<-as.POSIXlt(paste(revised_hpc$Date,revised_hpc$Time,seq=" "))
png(filename = "plot3.png") 
plot(revised_hpc$datetime,as.numeric(revised_hpc$Sub_metering_1),
    typ="l",xlab=" ",ylab="Energy sub metering",yaxt="n",ylim=c(0,39))
par(new=TRUE) 
plot(revised_hpc$datetime,as.numeric(revised_hpc$Sub_metering_2),
     typ="l",xlab=" ",ylab=" ",col="red",yaxt="n",ylim=c(0,39))
par(new=TRUE) 
plot(revised_hpc$datetime,revised_hpc$Sub_metering_3,
     typ="l",xlab=" ",ylab=" ",col="blue",yaxt="n",ylim=c(0,39)) 
axis(side=2,at=c(0,10,20,30))
legend("topright", lty=c(1,1,1), col = c("black","red","blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off() 
