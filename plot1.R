plot1<-function(file="household_power_consumption.txt"){
  var_names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  var_class=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  #only reading the neccesary data
  data<-read.csv2(file,skip=66636, nrows=69517-66637, na.strings = "?",  dec = ".",col.names = var_names, colClasses=var_class)
  png("plot1.png")
  hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}