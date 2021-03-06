plot2 <- function () {
  library(graphics)
  library(data.table)
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  data$Date <- as.Date(data$Date, format= "%d/%m/%Y")
  b <- as.Date("02-02-2007", "%d-%m-%Y")
  a <- as.Date("01-02-2007", "%d-%m-%Y")
  subdata <- subset(data, Date >= a & Date <= b)
  subdata$DT <- paste(subdata$Date, subdata$Time, sep=" ")
  subdata$DT <- strptime(subdata$DT, format = "%Y-%m-%d %H:%M:%S")
  rm(data)
  rm(a)
  rm(b)
  subdata$Global_active_power <- as.numeric(paste(subdata$Global_active_power))
  png(filename ="plot2.png")
  plot(subdata$DT, subdata$Global_active_power, type="n", ylab = "Global Active Power ( Kilowatts)", xlab="")
  lines(subdata$DT, subdata$Global_active_power, type="l")
  rm(subdata)
  dev.off()
  
}