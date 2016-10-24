library(leaflet)
dir()
ct<- read.csv("data/cafe.csv")
# Be sure to first set the working directory in R to where the file is listed
address_waw <- c(52.2330251,20.9803086)

m <- leaflet(ct) %>% addProviderTiles("CartoDB.Positron") %>%
  setView(address_waw[2], address_waw[1], zoom = 11) %>% 
  addCircles(~lon, ~lat, popup=ct$type, weight = 3, radius=40, 
             color="#ffa500", stroke = TRUE, fillOpacity = 0.8) 
  
m
