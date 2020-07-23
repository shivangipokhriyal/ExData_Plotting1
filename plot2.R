library(data.table)
setwd("C:/Users/comp/Documents/CourseraR/Exploratory Data Analysis")

data<- data.table::fread("household_power_consumption.txt", na.strings="?")
newdata<- data[data$Date%in%c("1/2/2007","2/2/2007"),]
date_time<- paste(newdata$Date, newdata$Time,sep=" ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
png(file="plot2.png",height=480,width=480)
plot(date_time, newdata$Global_active_power, type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
dev.off()
