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
radius = 50000
search_string = "cafe"
n = 100
df_places <- google_places(search_string = search_string, 
                           location = c(address_waw[1],
                                        address_waw[2]), 
                           key = key, radius = radius)

dane_1 <- as.data.frame(df_places$results)

str_data_frame <- create_df(dane_1)

for(i in 1:n){
  df_places <- google_places(search_string = search_string, 
                             location = c(address_waw[1],
                                          address_waw[2]), 
                             key = key, radius = radius, 
                             page_token = df_places$next_page_token)
  dane_1 <- as.data.frame(df_places$results)
  str_data_frame <- rbind(str_data_frame, create_df(dane_1))
}
write.csv(str_data_frame, "caffee.csv")
