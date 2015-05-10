############################################################################################
#Prog Name  Author         Date       Description
#Plot3.R  - Som Subbaiah - 5/10/2015 - Exploratory Analysis Project1 - Create Plot3
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
SM1 <- as.numeric(data$Sub_metering_1)
SM2 <- as.numeric(data$Sub_metering_2)
SM3 <- as.numeric(data$Sub_metering_3)

png(".\\ExpAnalysis_P1_Data\\plot3.png",480,480)
with (data, plot(dategpa,SM1, type="l", ylab="Energy Sub metering", xlab=""))
with (subset(data, 1==1), points(dategpa, SM2,type="l",col="red"))
with (subset(data, 1==1), points(dategpa, SM3,type="l",col="blue"))
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(1,1))
dev.off()

# Check for existence of Plot3.png
if  (file.exists(".\\ExpAnalysis_P1_Data\\Plot3.png")) {  print ("Plot3.png created successfully!") } else { print ("*****ERROR*****: Plot3.png does not exist, please check!!!")     }

#end of code Plot3.R.
