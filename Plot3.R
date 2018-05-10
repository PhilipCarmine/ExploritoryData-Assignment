dataset <- read.table('D:/Users/philcarmine/Coursera/datasciencecoursera-master/datasciencecoursera-master/ExploritoryDataAnalysis/Week1Assignment/ProjectData/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt', header = TRUE, sep = ";")

dataset2 <- subset(dataset, Date == "1/2/2007")
dataset3 <- subset(dataset, Date == "2/2/2007")
dataset4 <- rbind(dataset2, dataset3) 

install.packages("tidyr")

library(tidyr)


dataset5 <- unite(dataset4, Datetime, c("Date", "Time"), sep = " ")

d11 <- strptime(dataset5$Datetime,"%d/%m/%Y %H:%M:%S")

submetering1 <- as.numeric(as.character(dataset4[,7]))

submetering2 <- as.numeric(as.character(dataset4[,8]))

submetering3 <- as.numeric(as.character(dataset4[,9]))

d13 <- data.frame(Datetime = d11, Sub_metering = submetering1, Type = "Sub_metering_1")

d14 <- data.frame(Datetime = d11, Sub_metering = submetering2, Type = "Sub_metering_2")

d15 <- data.frame(Datetime = d11 , Sub_metering = submetering3, Type = "Sub_metering_3")

d16 <- rbind(d13, d14, d15)

with(d16, plot(Datetime, Sub_metering, type = "n", xlab = "", ylab = "Energy sub metering"))
with(subset(d16, Type == "Sub_metering_1"), points(Datetime, Sub_metering, col = "black", type = "l"))
with(subset(d16, Type == "Sub_metering_2"), points(Datetime, Sub_metering, col = "red", type = "l"))
with(subset(d16, Type == "Sub_metering_3"), points(Datetime, Sub_metering, col = "blue", type = "l"))
legend("topright", pch = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "D:/Users/philcarmine/Coursera/datasciencecoursera-master/datasciencecoursera-master/ExploritoryDataAnalysis/Week1Assignment/Plot3.png")

dev.off()