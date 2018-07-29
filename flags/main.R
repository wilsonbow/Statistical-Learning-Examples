# Flags data - PCA analysis

rm(list=ls())
library(calibrate)

data = read.csv("./data/flags.csv", header = F)
headers = c("Country", "Continent", "Zone", "Area",
            "Population", "Language", "Religion",
            "Bars", "Stripes", "Colours", "Red",
            "Green", "Blue", "Gold", "White",
            "Black", "Orange", "Main Hue", "Circles",
            "Crosses", "Saltires", "Quarters",
            "Sun/Stars", "Crescent", "Triangle",
            "Icon", "Animate", "Text", "Top.left",
            "Bottom.right")
names(data) = headers

# Rename the continents with factors
continents = c("North America", "South America",
               "Euroupe", "Africa", "Asia",
               "Oceania")
data$Continent = factor(data$Continent, labels = continents)
rm(ls=continents)

# Rename the zones with factors
zones = c("NE", "SE", "SW", "NW")
data$Zone = factor(data$Zone, labels = zones)
rm(ls=zones)

# Rename the languages with factors
languages = c("English", "Spanish", "French", "German",
              "Slavic", "Other Indo-European",
              "Chinese", "Arabic",
              "Japanese/Turkish/Finnish/Magyar",
              "Others")
data$Language = factor(data$Language, labels = languages)
rm(ls=languages)

# Rename the religions with factors
religions = c("Catholic", "Other Christian",
              "Muslim", "Buddhist", "Hindu",
              "Ethnic", "Marxist", "Others")
data$Religion = factor(data$Religion, labels = religions)
rm(ls=religions)

# Perform PCA
pca.columns = c(4, 5, 8, 9, 10, 11, 12, 13, 14, 15,
                16, 17, 19, 20, 21, 22, 23, 24,
                25, 26, 27, 28)
pca = prcomp(data[,pca.columns], center = T, scale = T)

# Produce Scree plot
pca.summary = summary(pca)
plot(pca.summary$importance[2,], las=1, type="b",
     col="blue", xlab="PCA",
     ylab="Proportion of variance",
     main="Scree plot of flag PCA")

# Plot PC1 vs PC2
plot(pca$x[,2]~pca$x[,1], col="red", las=1,
     xlab="PCA1", ylab="PCA2")

arrows(0, 0, x1=(8*pca$rotation[,1]), y1=(8*pca$rotation[,2]),
       length = 0.1, col="blue")
textxy(8*pca$rotation[,1], 8*pca$rotation[,2],
       labs = rownames(pca$rotation))

# Plot PC1 vs PC3
plot(pca$x[,2]~pca$x[,1], col="red", las=1,
     xlab="PCA1", ylab="PCA3")

k = 4
arrows(0, 0, x1=(k*pca$rotation[,1]), y1=(k*pca$rotation[,3]),
       length = 0.1, col="blue")
textxy(k*pca$rotation[,1], k*pca$rotation[,3],
       labs = rownames(pca$rotation))

# Plot PC2 vs PC3
plot(pca$x[,2]~pca$x[,1], col="red", las=1,
     xlab="PCA2", ylab="PCA3")

k = 5
arrows(0, 0, x1=(k*pca$rotation[,2]), y1=(k*pca$rotation[,3]),
       length = 0.1, col="blue")
textxy(k*pca$rotation[,2], k*pca$rotation[,3],
       labs = rownames(pca$rotation))
