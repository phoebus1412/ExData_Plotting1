hpc<-read.csv("household_power_consumption.txt",sep=";")
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")
revised_hpc<-hpc[(hpc$Date==as.Date("2007-02-01"))|(hpc$Date==as.Date("2007-02-02")),]
png(filename = "plot1.png") 
with(revised_hpc, hist(as.numeric(Global_active_power)/500,col="red",main="Global Active Power",
    xlab="Global Active Power(kilowatts)",breaks=12))
dev.off() 