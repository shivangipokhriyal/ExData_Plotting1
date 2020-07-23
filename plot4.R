library(data.table)
setwd("C:/Users/comp/Documents/CourseraR/Exploratory Data Analysis")

data<- data.table::fread("household_power_consumption.txt", na.strings="?")
newdata<- data[data$Date%in%c("1/2/2007","2/2/2007"),]
date_time<- paste(newdata$Date, newdata$Time,sep=" ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
png(file="plot4.png",height=480,width=480)


par(mfrow=c(2,2),oma=c(0,0,0,0))
plot(date_time, newdata$Global_active_power,xlab=""
     ,ylab="Global Active Power (kilowatts)",type="l")
plot(date_time, newdata$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(date_time, newdata$'Sub_metering_1',type="l",xlab="",ylab="Eneregy sub metering")
lines(date_time, newdata$Sub_metering_2,type="l",col="red")
lines(date_time, newdata$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","sub_metering_3")
         ,col=c("black","red","blue"),lty="solid")
plot(date_time, newdata$Global_reactive_power,xlab="datetime",ylab="Global Reactive Power (kilowatts)",type="l")

dev.off()