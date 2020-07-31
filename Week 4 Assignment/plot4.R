setwd("C:/Users/comp/Documents/CourseraR/Exploratory Data Analysis/US air pollution case study")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")


SCC_coal <- SCC[grepl("Coal",SCC$Short.Name),1]
NEI_CC <- NEI[NEI$SCC %in% SCC_coal ,]
library(dplyr)
ems <- NEI_CC %>% select(Emissions,year) %>% 
       group_by(year) %>% summarise(Total_emissions=sum(Emissions))

png(file="plot4.png")
par(bg="grey")
with(ems,plot(year, Total_emissions, col="purple",type="o",pch=16,cex=2,
              lwd=2,xlab="Years",ylab="Total PM2.5 emissions (in tons)",
              main="Total PM2.5 emissions in the US from Coal combustion sources"))
dev.off()
