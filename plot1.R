library(data.table)
setwd("C:/Users/comp/Documents/CourseraR/Exploratory Data Analysis")

data<- data.table::fread("household_power_consumption.txt", na.strings="?")
newdata<- data[data$Date%in%c("1/2/2007","2/2/2007"),]
png(file="plot1.png",height=480, width=480)
hist(newdata$Global_active_power,col="red",main="Global Active Power" 
     ,xlab="Global Active Power (kilowatts)",ylab="Frequency",xlim=c(0,6),ylim=c(0,1200))
dev.off()
