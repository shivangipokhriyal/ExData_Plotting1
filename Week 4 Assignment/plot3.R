setwd("C:/Users/comp/Documents/CourseraR/Exploratory Data Analysis/US air pollution case study")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

library(dplyr)
ems <-  NEI %>% select(year,type,fips,Emissions) %>% filter(fips==24510) %>%
       group_by(year,type) %>% summarise(totalEm=sum(Emissions))

png(file="plot3.png")
g <- qplot(year,totalEm,data=ems,color=type,facets=.~type,geom=c("point","line"))
g+labs(x="Years")+labs(y="Total PM2.5 emissions (in tons)")+
       labs(title="Total PM2.5 emissions in the Baltimore City")+theme_light()
dev.off()