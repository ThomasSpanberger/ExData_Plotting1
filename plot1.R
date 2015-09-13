plot1 <- function() {
  library(graphics)
  library(data.table)
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  data$Date <- as.Date(data$Date, format= "%d/%m/%Y")
  b <- as.Date("02-02-2007", "%d-%m-%Y")
  a <- as.Date("01-02-2007", "%d-%m-%Y")
  subdata <- subset(data, Date >= a & Date <= b)
  rm(data)
  rm(a)
  rm(b)
  subdata$Global_active_power <- as.numeric(paste(subdata$Global_active_power))
  png(filename ="plot1.png")
  hist(subdata$Global_active_power, col="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power(kilowatts)")
  rm(subdata)
  dev.off()
  
}