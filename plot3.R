setwd("~/Desktop/coursera/Exploratory Data Analysis")
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "project1.zip",method="curl")
file <- unzip("project1.zip")
data <- read.csv(file,header=T,sep =';')
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Time<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
plot(data$Time,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
