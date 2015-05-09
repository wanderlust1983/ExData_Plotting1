png("plot4.png",width = 480, height = 480)
##read the power data since. skip the 1st 66637 rows to only extract relevant info.
power<-read.table("household_power_consumption.txt",skip=66637,nrow=2880,na.strings="?",sep=";",stringsAsFactors=FALSE)
##give names to the columns
names(power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
##set the language to english so the x axis lable will be in english

Sys.setlocale("LC_TIME", "English")
##concatenate Date and Time columns together for the next step
power$dateraw<-paste(power$Date,power$Time,sep=" ")
##convert character to time
power$datetime<-strptime(power$dateraw,format="%d/%m/%Y %H:%M:%S",tz="UTC")
##set the plotting canvas for 4 graphs 
par(mfcol=c(2,2))
##first plot
plot(power$datetime,power$Global_active_power,ylab="Global Active Power",type="n",xlab="")
lines(power$datetime,power$Global_active_power)
##2nd plot first column 2nd row
with(power,plot(power$datetime,power$Sub_metering_1,ylab="Energy sub metering",type="n",xlab=""))
lines(power$datetime,power$Sub_metering_1)
lines(power$datetime,power$Sub_metering_2,col="red")
lines(power$datetime,power$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),bty="n",cex=0.75,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##3rd plot, 2nd column 1st row
plot(power$datetime,power$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(power$datetime,power$Voltage)

##4th plot, 2nd column 2nd row
plot(power$datetime,power$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime",yaxt="n")
lines(power$datetime,power$Global_reactive_power)
ytick<-seq(from=0,to=0.5,by=0.1)
axis(side=2,at=ytick,las=0,cex.axis=0.7)

dev.off()##cloes the device