plot2<-function(file="household_power_consumption.txt"){
  var_names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  var_class=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  data<-read.csv2(file,skip=66636, nrows=69517-66637, na.strings = "?",  dec = ".",col.names = var_names, colClasses=var_class)
  png("plot2.png")
  plot(strptime(paste(data$Date,data$Time), "%d/%m/%Y %T"), data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
}