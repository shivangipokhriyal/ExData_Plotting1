setwd("C:/Users/comp/Documents/CourseraR/Exploratory Data Analysis/US air pollution case study")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

library(dplyr)

emsBC <- NEI %>% select(Emissions,fips,type,year) %>% filter(fips=="24510",type=="ON-ROAD") %>%
  group_by(year) %>% summarise(Total_emissions=sum(Emissions)) %>% mutate(city="Baltimore City")
emsLAC <-  NEI %>% select(Emissions,fips,type,year) %>% filter(fips=="06037",type=="ON-ROAD") %>%
  group_by(year) %>% summarise(Total_emissions=sum(Emissions)) %>% mutate(city="Los Angeles County")
ems <- rbind(emsBC,emsLAC)

png(file="plot6.png")

g <- qplot(year, Total_emissions,data=ems,col=city,geom=c("point","line"))
g+labs(x="Years",y="Total PM2.5 emissions (in tons)",
       title="Total PM2.5 emissions in the Baltimore City from motor vehicle sources")

dev.off()
