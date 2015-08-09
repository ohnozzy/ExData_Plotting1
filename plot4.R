plot4<-function(file="household_power_consumption.txt"){
  var_names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  var_class=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  data<-read.csv2(file,skip=66636, nrows=69517-66637, na.strings = "?",  dec = ".",col.names = var_names, colClasses=var_class)
  x=strptime(paste(data$Date,data$Time), "%d/%m/%Y %T")
  png("plot4.png")
  par(mfrow=c(2,2))
  #1st
  hist(data$Global_active_power, main=NULL, xlab="Global Active Power (kilowatts)", col="red")
  #2nd
  plot(x, data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="datetime")
  #3rd
  plot(x, data$Sub_metering_1,type="n", ylab="Energy sub metering", xlab="")
  lines(x, data$Sub_metering_1)
  lines(x, data$Sub_metering_2, col="red")
  lines(x, data$Sub_metering_3, col="blue")
  legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"), box.lty=0)
  #4th
  plot(x, data$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime")
  
  dev.off()
}