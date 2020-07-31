dir<-setwd("C:/Users/comp/Documents/CourseraR/Exploratory Data Analysis/US air pollution case study")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

library(dplyr)

citysum <- NEI %>% select(fips, Emissions,year) %>% filter(fips=="24510")%>%
        group_by(year)%>% summarise(Etotal=sum(Emissions))

png(file="plot2.png")
par(bg="light yellow")
plot(citysum$year,citysum$Etotal,xlab="Years",ylab="Total PM2.5 emissions from all sources (in tons)",
     main ="Total PM2.5 emissions in the Baltimore City, Maryland",
     type="o",pch=19,cex=1,col="brown",lwd=1.5)
points(col="orange")
dev.off()