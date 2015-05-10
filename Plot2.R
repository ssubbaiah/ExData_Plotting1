
############################################################################################
#Prog Name  Author         Date       Description
#Plot2.R  - Som Subbaiah - 5/9/2015 - Exploratory Analysis Project1 - Create Plot2
############################################################################################

# Assumption - Source file exists in \ExpAnalysis_P1_Data (of working dir C:\00_SomSubbaiah\DataScience\)
# File downloaded and zipped as part of Plot1.R

# print current date
workdate<-date()
workdate


#Set working directory
setwd("C:\\00_SomSubbaiah\\DataScience\\")


#Read
dataFull<-read.table(".\\ExpAnalysis_P1_Data\\household_power_consumption.txt", sep=";", header=TRUE, dec=".",stringsAsFactors=FALSE)
data <- data[data$Date %in% c( "1/2/2007","2/2/2007"),]
gpa <- as.numeric(data$Global_active_power)
dategpa <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png(".\\ExpAnalysis_P1_Data\\plot2.png",480,480)
plot(dategpa,gpa, type="l",xlab="", ylab="Global Active Power (Kilowatts)")
dev.off()

# Check for existence of Plot2.png
if  (file.exists(".\\ExpAnalysis_P1_Data\\Plot2.png")) {  print ("Plot2.png created successfully!") } else { print ("*****ERROR*****: Plot2.png does not exist, please check!!!")     }

#end of code Plot2.R.
