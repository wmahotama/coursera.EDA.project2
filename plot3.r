# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999-2008 
# for Baltimore City? Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# require packages
require(ggplot2)

# get data
if (!exists("nei")) {
  nei <- readRDS("summarySCC_PM25.rds")
}

if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")
}

# subset data

data3 <- subset(nei, nei$fips == "24510")
data3.aggregate <- aggregate(data = data3, Emissions ~ year + type, sum)

# plot

png(filename="./plot3.png")
ggplot(data3.aggregate,aes(x = as.factor(year), y = Emissions, col = type)) +
  geom_bar(stat = "identity") +
  facet_wrap(~type) +
  ggtitle("Total Emisisons in Baltimore, MD by year and type") +
  theme(legend.position = "empty")
dev.off()
  