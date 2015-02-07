hpc<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")
revised_hpc<-hpc[(hpc$Date==as.Date("2007-02-01"))|(hpc$Date==as.Date("2007-02-02")),]
revised_hpc$datetime<-as.POSIXlt(paste(revised_hpc$Date,revised_hpc$Time,seq=" "))
png(filename = "plot4.png")
par(mfrow=c(2,2))
with(revised_hpc,{
    plot(datetime,as.numeric(Global_active_power),typ="l",xlab=" ",ylab="Global Active Power")
    plot(datetime,Voltage,typ="l",xlab="datetime",ylab="Voltage")
    plot(revised_hpc$datetime,as.numeric(revised_hpc$Sub_metering_1),
         typ="l",xlab=" ",ylab="Energy sub metering",ylim=c(0,35),yaxt="n")
    par(new=TRUE) 
    plot(revised_hpc$datetime,as.numeric(revised_hpc$Sub_metering_2),
         typ="l",xlab=" ",ylab=" ",col="red",ylim=c(0,35),yaxt="n")
    par(new=TRUE) 
    plot(revised_hpc$datetime,as.numeric(revised_hpc$Sub_metering_3),
         typ="l",xlab=" ",ylab=" ",col="blue",ylim=c(0,35),yaxt="n") 
    axis(side=2,at=c(0,10,20,30))
    legend("topright", lty=c(1,1,1), col = c("black","red","blue"),bty="n",
           legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    plot(datetime,as.numeric(Global_reactive_power),typ="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()