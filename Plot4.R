############################################################################################
#Prog Name  Author         Date       Description
#Plot4.R  - Som Subbaiah - 5/10/2015 - Exploratory Analysis Project1 - Create Plot3
############################################################################################

# Assumption - Source file exists in \ExpAnalysis_P1_Data (of working dir C:\00_SomSubbaiah\DataScience\)
# File downloaded and zipped as part of Plot1.R

# print current date
workdate<-date()
workdate


#Set working directory
setwd("C:\\00_SomSubbaiah\\DataScience\\")

## read and filter
dataFull<-read.table(".\\ExpAnalysis_P1_Data\\household_power_consumption.txt", sep=";", header=TRUE, dec=".",stringsAsFactors=FALSE)
data <- data[data$Date %in% c( "1/2/2007","2/2/2007"),]
dategpa <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gpa <- as.numeric(data$Global_active_power)
SM1 <- as.numeric(data$Sub_metering_1)
SM2 <- as.numeric(data$Sub_metering_2)
SM3 <- as.numeric(data$Sub_metering_3)
volt <- as.numeric(data$Voltage)
grp <- as.numeric(data$Global_reactive_power)


# Set Graph
png(".\\ExpAnalysis_P1_Data\\plot4.png",480,480)
par(mfrow = c(2, 2))
#Plot 1
plot(dategpa,gpa, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# plot 2
plot(dategpa, volt, type="l", xlab="datetime", ylab="Voltage")
#Plot 3
with (data, plot(dategpa,SM1, type="l", ylab="Energy Sub metering", xlab=""))
with (subset(data, 1==1), points(dategpa, SM2,type="l",col="red"))
with (subset(data, 1==1), points(dategpa, SM3,type="l",col="blue"))
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(1,1))
#Plot 4
plot(dategpa, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

# Check for existence of Plot4.png
if  (file.exists(".\\ExpAnalysis_P1_Data\\Plot4.png")) {  print ("Plot4.png created successfully!") } else { print ("*****ERROR*****: Plot4.png does not exist, please check!!!")     }

#end of code Plot4.R.
