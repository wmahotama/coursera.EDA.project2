# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# get data
if (!exists("nei")) {
  nei <- readRDS("summarySCC_PM25.rds")
}

if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")
}

# merge nei and scc data
neiscc <- merge(nei, scc, by = "SCC")

# subset for baltimore city, md
data.baltimore <- subset(neiscc, neiscc$fips == "24510")

# subset by vehicles in EI.Sector
vehicles <- grepl(pattern = "mobile", data.baltimore$EI.Sector, ignore.case = TRUE)

data.vehicles <- data.baltimore[vehicles,]

data5 <- aggregate(data = data.vehicles, Emissions ~ year, sum)

png(filename = "./plot5.png")
barplot(names.arg = data5$year, height = data5$Emissions, xlab = "Year", ylab = "Emissions", main = "Total Emissions from Motor Vehicles \n in Baltimore, MD")
dev.off()