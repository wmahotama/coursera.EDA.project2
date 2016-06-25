# Across the United States, how have emissions 
# from coal combustion-related sources changed from 1999-2008?

# get data
if (!exists("nei")) {
  nei <- readRDS("summarySCC_PM25.rds")
}

if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")
}

# merge nei and scc data
neiscc <- merge(nei, scc, by = "SCC")

# subset where neiscc$EI.Sector has coal
coal <- grepl(pattern = "coal", neiscc$EI.Sector, ignore.case = TRUE)

subset <- neiscc[coal,]

subset.aggregate <- aggregate(data = subset, Emissions ~ year, sum)

# plot data and save plot

png(filename="./plot4.png")
barplot(height = subset.aggregate$Emissions, names.arg = subset.aggregate$year, 
        xlab = "Year", ylab = "Total Emissions", main = "Total Emissions from \n Coal Combustion by Year")
dev.off()

