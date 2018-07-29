% Flags data - PCA analysis

data = read.csv("./data/flags.csv", header = F)
headers = c("Country", "Landmass", "Zone", "Area",
            "Population", "Language", "Religion",
            "Bars", "Stripes", "Colours", "Red",
            "Green", "Blue", "Gold", "White",
            "Black", "Orange", "Main Hue", "Circles",
            "Crosses", "Saltires", "Quarters",
            "Sun/Stars", "Crescent", "Triangle",
            "Icon", "Animate", "Text", "Top-left",
            "Bottom right")
names(data) = headers

