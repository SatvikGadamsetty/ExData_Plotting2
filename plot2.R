## Program for plot 2 of PA2 in Coursera's Exploratory Data Analysis
## Read in data from National Emissions Inventory (NEI) about fine particulate 
## matter (PM_2.5) from 1999 - 2008 collected every 3 years. 

## Question 2: Have total emissions for PM_2.5 decreased in Baltimore County, MD
## fips == '24510' from 1999 to 2008?

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

## Creating subset of data collected in Baltimore City
baltimoreData <- subset(neiData, neiData$fips == '24510')

## Finding total emissions in Baltimore City from all sources using aggregate
totalBaltEmi <- aggregate(baltimoreData$Emissions, list(baltimoreData$year), 
	FUN = "sum")

## Plot totalBaltEmi across the years and save plot as .png file
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

plot(totalBaltEmi, type = "l", col = "green", lwd = 5, 
	main = "Total emissions from all sources in Baltimore City (1999-2008)", 
	xlab = "Year",
	ylab = "Total PM_2.5 Emissions (tons)")

dev.off()
