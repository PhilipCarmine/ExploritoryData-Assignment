dataset <- read.table('D:/Users/philcarmine/Coursera/datasciencecoursera-master/datasciencecoursera-master/ExploritoryDataAnalysis/Week1Assignment/ProjectData/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt', header = TRUE, sep = ";")

dataset2 <- subset(dataset, Date == "1/2/2007")
dataset3 <- subset(dataset, Date == "2/2/2007")
dataset4 <- rbind(dataset2, dataset3) 

install.packages("tidyr")

library(tidyr)


dataset5 <- unite(dataset4, Datetime, c("Date", "Time"), sep = " ")

d11 <- strptime(dataset5$Datetime,"%d/%m/%Y %H:%M:%S")

d12 <- as.numeric(as.character(dataset4[,3]))

d13 <- data.frame(Datetime = d11, Global_active_power = d12)

plot(d13$Datetime, d13$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "D:/Users/philcarmine/Coursera/datasciencecoursera-master/datasciencecoursera-master/ExploritoryDataAnalysis/Week1Assignment/Plot2.png")

dev.off()