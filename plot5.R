## Program for plot 2 of PA2 in Coursera's Exploratory Data Analysis
## Read in data from National Emissions Inventory (NEI) about fine particulate 
## matter (PM_2.5) from 1999 - 2008 collected every 3 years.

## Question 5: How have emissions from motor vehicle sources changed in Baltimor City from 1999-2008?

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

## Subset of data collected in Baltimore City. Assuming 'motor vehicles' only means things on the road
baltEmi <- subset(neiData, fips == '24510' & type == "ON-ROAD")

## Total motor emissions in Baltimore City
baltMotorEmi <- aggregate(baltEmi$Emissions, list(baltEmi$year), FUN = "sum")

## Plot 5
png(filename = "plot5.png", width = 605, height = 480, units = "px", bg = "white")

plot(baltMotorEmi, type = "l", col = "green", lwd = 5, 
	main = "Total emissions from all motor vehicle-related sources in Baltimore City (1999-2008)", 
	xlab = "Year",
	ylab = "Total PM_2.5 Emissions (tons)")

dev.off()
