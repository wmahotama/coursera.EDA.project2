# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# get data
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# subset data
data2 <- subset(nei, nei$fips == "24510")
data2.aggregate <- aggregate(data = data2, Emissions ~ year, sum)

# plot data and save plot

png(filename="./plot2.png")
barplot(height = data2.aggregate$Emissions, names.arg = data2.aggregate$year, 
        xlab = "Year", ylab = "Total Emissions", main = "Total Emissions by Year in Baltimore, MD")
dev.off()

