setwd("C:/Users/comp/Documents/CourseraR/Exploratory Data Analysis/US air pollution case study")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

library(dplyr)

ems <- NEI %>% select(Emissions,fips,type,year) %>% filter(fips=="24510",type=="ON-ROAD") %>%
  group_by(year) %>% summarise(Total_emissions=sum(Emissions))

png(file="plot5.png")
par(bg="light blue")
with(ems,plot(year, Total_emissions, col="red",type="o",pch=16,cex=2,
            lwd=1.5,xlab="Years",ylab="Total PM2.5 emissions (in tons)",
      main="Total PM2.5 emissions in the Baltimore City from motor vehicle sources"))
dev.off()
