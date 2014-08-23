## ## Program for plot 2 of PA2 in Coursera's Exploratory Data Analysis
## Read in data from National Emissions Inventory (NEI) about fine particulate 
## matter (PM_2.5) from 1999 - 2008 collected every 3 years.

## Question 6: Compare emissions from MV sources in Baltimore and LA (fips == "06037"). Which city has seen greater changes?

## Setting working directory
setwd("C:/Users/Satvik Gadamsetty/Documents/Classwork/Programming/R/EDA/PA2")

## Read in neiData and sccData using readRDS()
neiData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")

## Taking a look at the data and checking if there are any missing values
head(neiData)
sum(is.na(neiData)) # No missing values

head(sccData)

dim(neiData); dim(sccData)

## Subset of data collected in Baltimore City and LA. Assuming 'motor vehicles' only means things on the road
baltEmi <- subset(neiData, fips == '24510' & type == "ON-ROAD")
laEmi <- subset(neiData, fips == '06037' & type == "ON-ROAD")

## Total motor emissions in Baltimore City and LA.
baltMotorEmi <- aggregate(baltEmi$Emissions, list(baltEmi$year), FUN = "sum")
laMotorEmi <- aggregate(laEmi$Emissions, list(laEmi$year), FUN = "sum")

## Plot 6
png(filename = "plot6.png", width = 605, height = 480, units = "px", bg = "white")

## Set 2 row, 1 column area for plots
par(mfrow = c(2,1))

## Baltimore City plot
plot(baltMotorEmi, type = "l", col = "green", lwd = 5, 
	main = "Total emissions from all motor vehicle-related sources in Baltimore City (1999-2008)", 
	xlab = "Year",
	ylab = "Total PM_2.5 Emissions (tons)")

## LA plot
plot(laMotorEmi, type = "l", col = "red", lwd = 5, 
	main = "Total emissions from all motor vehicle-related sources in LA County (1999-2008)", 
	xlab = "Year",
	ylab = "Total PM_2.5 Emissions (tons)")

dev.off()