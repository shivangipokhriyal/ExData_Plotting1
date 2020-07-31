dir<-setwd("C:/Users/comp/Documents/CourseraR/Exploratory Data Analysis/US air pollution case study")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

library(dplyr)
emissions_total<-NEI %>% group_by(year) %>% summarise(NEI=sum(Emissions))

png(file="plot1.png")
par(bg="light blue")
with(emissions_total,plot(year,NEI,type="l",col="dark red",
                lwd=1.9,xlab = "Years",ylab="Total PM2.5 emissions from all sources (in tons)",
                main ="Total emissions from PM2.5 in the United States" ))
points(emissions_total$year,emissions_total$NEI,col="yellow",pch=19)
dev.off()