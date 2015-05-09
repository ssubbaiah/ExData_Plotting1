############################################################################################
#Prog Name  Author         Date       Description
#Plot1.R  - Som Subbaiah - 5/9/2015 - Exploratory Analysis Project1
############################################################################################

# File downloaded and unzipped into subdir \ExpAnalysis_P1_Data (of working dir C:\00_SomSubbaiah\DataScience\)
# print current date
workdate<-date()
workdate

# calc size memeory needed
# a)read two rows from file   b)get first row size  c) Multiply by # numrows  d) convert to GB e) check against system memory
# print result

data2rows <-read.table(".\\ExpAnalysis_P1_Data\\household_power_consumption.txt", sep=";", header=TRUE, dec=".",stringsAsFactors=FALSE, nrows=2)
memneedGB <- as.numeric( object.size(data5rows[1,]) * 2075759 ) /1024/1024/1024
memsystem <- 16
memmsg = ifelse (memneedGB < memsystem, "Memory Good", "Memory not enough")
memmsg

# Plot 1 - histogram creation
# a) read all rows b) subset data for two days c) convert to numeric d) plot graph e) copy to png device
data<-read.table(".\\ExpAnalysis_P1_Data\\household_power_consumption.txt", sep=";", header=TRUE, dec=".",stringsAsFactors=FALSE)
datasubset <- data[data$Date %in% c( "1/2/2007","2/2/2007"),]
gpa <- as.numeric(datasubset$Global_active_power)
hist(gpa, col="red", main="Global Active Power", xlab="Global Active Power (kilowattts)")
dev.copy(png,file=".\\ExpAnalysis_P1_Data\\plot1.png")
dev.off()

#end of code Plot1.R
