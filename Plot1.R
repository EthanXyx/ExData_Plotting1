setwd("~/Desktop/coursera/Exploratory Data Analysis")
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "project1.zip",method="curl")
file <- unzip("project1.zip")
data <- read.csv(file,header=T,sep =';')
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main ="Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()