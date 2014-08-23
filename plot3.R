## Program for plot 2 of PA2 in Coursera's Exploratory Data Analysis
## Read in data from National Emissions Inventory (NEI) about fine particulate 
## matter (PM_2.5) from 1999 - 2008 collected every 3 years.

## Question 3: From which of the four sources have emissions decreased and 
## increased over 1999-2008 in Baltimore City? Address this question using ggplot.

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

## Subset of data collected in Baltimore City
baltEmi <- subset(neiData, fips == '24510')

## Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

g <- ggplot(baltEmi, aes(year, Emissions, color = type))

g + geom_line(stat = "summary", fun.y = "sum") +
    ylab('Total PM_2.5 Emissions') +
    ggtitle("Total emissions from all sources in Baltimore City (1999-2008)")
    
dev.off()