png("plot3.png",width = 480, height = 480)
par(mfcol=c(1,1))
##read the power data since. skip the 1st 66637 rows to only extract relevant info.
power<-read.table("household_power_consumption.txt",skip=66637,nrow=2880,na.strings="?",sep=";",stringsAsFactors=FALSE)
##give names to the columns
names(power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Sys.setlocale("LC_TIME", "English")
##concatenate Date and Time columns together for the next step
power$dateraw<-paste(power$Date,power$Time,sep=" ")
##convert character to time
power$datetime<-strptime(power$dateraw,format="%d/%m/%Y %H:%M:%S",tz="UTC")
plot(power$datetime,power$Global_active_power,ylab="Global Active Power (kilowatts)",type="n",xlab="")
lines(power$datetime,power$Global_active_power)
with(power,plot(power$datetime,power$Sub_metering_1,ylab="Energy sub metering",type="n",xlab=""))
lines(power$datetime,power$Sub_metering_1)
lines(power$datetime,power$Sub_metering_2,col="red")
lines(power$datetime,power$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
