# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# get data
if (!exists("nei")) {
  nei <- readRDS("summarySCC_PM25.rds")
}
if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")
}

# merge nei and scc data
neiscc <- merge(nei, scc, by = "SCC")

# subset by vehicles in EI.Sector
vehicles <- grepl(pattern = "mobile", neiscc$EI.Sector, ignore.case = TRUE)
data.vehicles <- neiscc[vehicles,]

# subset for baltimore city, md and lost angeles county
baltimore <- subset(data.vehicles, fips == "24510")
la <- subset(data.vehicles, fips == "06037")

# aggregate data
baltimore.aggregate <- aggregate(data = baltimore, Emissions ~ year, sum)
la.aggregate <- aggregate(data = la, Emissions ~ year, sum)

# plot and save

png(filename = "./plot6.png")

par(mfrow = c(1,2))
barplot(height = baltimore.aggregate$Emissions, names.arg = baltimore.aggregate$year, ylim = c(0,11000),
        xlab = "Year", ylab = "Emissions",main = "Motor Vehicle Emissions \n Baltimore City")
barplot(height = la.aggregate$Emissions, names.arg = la.aggregate$year, ylim = c(0,11000),
        xlab = "Year", ylab = "Emissions", main = "Motor Vehicle Emissions \n Los Angeles County")

dev.off()