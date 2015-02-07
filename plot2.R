hpc<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")
revised_hpc<-hpc[(hpc$Date==as.Date("2007-02-01"))|(hpc$Date==as.Date("2007-02-02")),]
revised_hpc$datetime<-as.POSIXlt(paste(revised_hpc$Date,revised_hpc$Time,seq=" "))
png(filename = "plot2.png") 
with(revised_hpc, plot(datetime,as.numeric(Global_active_power),
    typ="l",xlab=" ",ylab="Global Active Power(kilowatts)"))
dev.off() 
