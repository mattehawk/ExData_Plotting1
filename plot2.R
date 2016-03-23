## CREATE PLOT2
library(XML)
setwd("c:/Users/Matthew/Desktop/Coursera/Exploratory Data Analysis/Week 1/Project 1")
## Check if our folder exits, and if not create it
if(!file.exists("Week 1")){dir.create("Week 1")}
## Define the location of the file to be downloaded
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## Doanload the file and store it in our working directory and specific folder
download.file(fileUrl, destfile = "./Week 1/household_power_consumption.zip")
## Unzip the file and store it in the same working directory and specific folder
unzip(zipfile="./Week 1/household_power_consumption.zip",exdir="./Week 1/exdata_data_household_power_consumption")
## give our dataset a name in the working directory and read it into a table before geting to work
data <- read.table(file="./Week 1/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric",7)),na = "?")
# Remove rows with '?' as values - these are preventing me from chagin the column class to a number
data.clean <- subset(data, Global_active_power!="?")
#Add a date time column to be used in linear plotting
x <- paste(data.clean$Date, data.clean$Time)
data.clean$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
#subset further to only the dates specific int he assignment
data.clean2 <- subset(data.clean, Date == "2/2/2007" | Date == "1/2/2007")

## create second chart
#Turn on png
png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "white")

plot(data.clean2$DateTime, data.clean2$Global_active_power,  type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()