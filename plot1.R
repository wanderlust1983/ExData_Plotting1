png("plot1.png",width = 480, height = 480)
par(mfcol=c(1,1))
##read the power data since. skip the 1st 66637 rows to only extract relevant info.
power<-read.table("household_power_consumption.txt",skip=66637,nrow=2880,na.strings="?",sep=";",stringsAsFactors=FALSE)
##give names to the columns
names(power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
hist(power$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
