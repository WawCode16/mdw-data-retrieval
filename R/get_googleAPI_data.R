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

get_table_google_API <- function(search_string, address_waw, key, radius, n){
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
    print(1)
    Sys.sleep(5)
  }
  str_data_frame$type <- search_string
  unique(str_data_frame$name)
  str_data_frame <- unique(str_data_frame)
  write.csv(str_data_frame, paste(search_string, ".csv", sep =""))
  str_data_frame
}

# Restauracje 
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "restaurant"
n = 100
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)

# Park
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "park"
n = 10
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)

# hospital
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "hospital"
n = 20
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)

# cafe 
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "cafe"
n = 100
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)

# uni 
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "uniwersytet"
n = 2
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)


# kino 
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "kino"
n = 2
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)

# ksero 
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "ksero"
n = 4
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)



# apteka 
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "apteka"
n = 10
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)


# fryzjer 
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "fryzjer"
n = 10
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)


# żabka 
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "fresh market"
n = 10
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)

# teatr 
address_waw <- c(52.2330251,20.7803086)
radius = 50000
search_string = "teatr"
n = 5
xtb <- get_table_google_API(search_string, address_waw, key, radius, n)






