# Plot 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

# get data
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# aggregate data
data1 <- aggregate(data = nei, Emissions ~ year, sum)

# plot data and save plot

png(filename="./plot1.png")
barplot(height = p1$Emissions, names.arg = p1$year, xlab = "Year", ylab = "Total Emissions", main = "Total Emissions by Year")
dev.off()

