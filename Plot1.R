dataset <- read.table('D:/Users/philcarmine/Coursera/datasciencecoursera-master/datasciencecoursera-master/ExploritoryDataAnalysis/Week1Assignment/ProjectData/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt', header = TRUE, sep = ";")

dataset2 <- subset(dataset, Date == "1/2/2007")
dataset3 <- subset(dataset, Date == "2/2/2007")
dataset4 <- rbind(dataset2, dataset3) 


d10 <- as.numeric(as.character(dataset4[,3]))

hist(d10, breaks = 24, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


dev.copy(png, file = "D:/Users/philcarmine/Coursera/datasciencecoursera-master/datasciencecoursera-master/ExploritoryDataAnalysis/Week1Assignment/Plot1.png")

dev.off()