## Program for plot 1 of PA2 in Coursera's Exploratory Data Analysis
## Read in data from National Emissions Inventory (NEI) about fine particulate 
## matter (PM_2.5) from 1999 - 2008 collected every 3 years. 

## Question 1: Have total emissions from PM_2.5 decreased from 1999 - 2008 from 
## all sources? Use base plotting package to support your answer.

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

## Finding total emissions from PM_2.5 from 1999 to 2008
## Using aggregate(object, list = (), FUN = "")
totalEmissions <- aggregate(neiData$Emissions, list(neiData$year), FUN = "sum")

## Plot totalEmissions across all years and save plot as .png file
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

plot(totalEmissions, type = "l", col = "green", lwd = 5, 
	main = "Total emissions from all sources (1999-2008)", 
	xlab = "Year",
	ylab = "Total PM_2.5 Emissions (tons)")

dev.off()