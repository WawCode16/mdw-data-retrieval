source("R/conf.R")
key <- standard_api
dict_types <- function(dane) {
  x <- sapply(dane$types, function(x) paste(x, sep = ": 1, ", collapse = ": 1, ") )
  t <- sapply(x, function(y) paste("{", y, ": 1}", sep = "", collapse = ""))
  as.vector(t)  
}
create_df <- function(dane) {
  dane_tmp <- data.frame(address = dane$formatted_address,
                         lat = dane$geometry$location$lat,
                         lon = dane$geometry$location$lng,
                         id = dane$id,
                         name = dane$name,
                         rating = dane$rating,
                         types = dict_types(dane))
  dane_tmp
}

## your key goes here
address_waw <- c(52.2330251,20.7803086)

df_places <- google_places(search_string = "cafe", 
                           location = c(address_waw[1],
                                        address_waw[2]), 
                           key = key, radius = 50000)

dane_1 <- as.data.frame(df_places$results)

df_places_2 <- google_places(search_string = "cafe", 
                             location = c(address_waw[1],
                                          address_waw[2]), 
                             key = key, radius = 50000, 
                             page_token = df_places$next_page_token)
dane_2 <- as.data.frame(df_places_2$results)

df_places_3 <- google_places(search_string = "cafe", 
                             location = c(address_waw[1],
                                          address_waw[2]), 
                             key = key, radius = 50000, 
                             page_token = df_places_2$next_page_token)
dane_3 <- as.data.frame(df_places_3$results)

xxx <- rbind(create_df(dane_1),create_df(dane_2))


xxx <- rbind(xxx,create_df(dane_3))
unique(sort(xxx$name))
