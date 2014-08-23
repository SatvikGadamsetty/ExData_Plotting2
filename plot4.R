## Program for plot 2 of PA2 in Coursera's Exploratory Data Analysis
## Read in data from National Emissions Inventory (NEI) about fine particulate 
## matter (PM_2.5) from 1999 - 2008 collected every 3 years.

## Question 4: How have coal combustion-related emissions changed across the US from 1999 - 2008?

## Loading in ggplot2
library(ggplot2)

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

## Using grep to search for matches to argument pattern within each element of character vector.
## Searching for all elements that contain "coal" in Short.Name in sccData
containCoal <- grep("coal", sccData$Short.Name, ignore.case = TRUE)
containCoal <- sccData[containCoal,]
## Finding subset of data in neiData corresponding to all coal-related sources
containCoal <- neiData[neiData$SCC %in% containCoal$SCC, ]

## Calculating total emissions from coal-related sources
coalEmi <- aggregate(containCoal$Emissions, list(containCoal$year), FUN = "sum")

## Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")

plot(coalEmi, type = "l", col = "green", lwd = 5, 
	main = "Total emissions from all coal combustion-related sources (1999-2008)", 
	xlab = "Year",
	ylab = "Total PM_2.5 Emissions (tons)")

dev.off()


