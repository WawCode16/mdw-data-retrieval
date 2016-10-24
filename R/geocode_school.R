source("conf.R")
options(encoding="utf-8")
dane <- read.csv("edu2.csv")
address <- dane$Adres
coordset <- geocode_url(as.character(address), auth='standard_api', privkey="",
                        clean=TRUE, add_date='today', verbose=TRUE)
codded <- coordset[!is.na(coordset$lat),]
addr <- coordset[is.na(coordset$lat),7]
coordset <- geocode_url(as.character(addr), auth='standard_api', privkey="",
                        clean=TRUE, add_date='today', verbose=TRUE)

codded <- rbind(codded, coordset[!is.na(coordset$lat),])
addr <- coordset[is.na(coordset$lat),7]
coordset <- geocode_url(as.character(addr), auth='standard_api', privkey="",
                        clean=TRUE, add_date='today', verbose=TRUE)

codded <- rbind(codded, coordset[!is.na(coordset$lat),])
addr <- coordset[is.na(coordset$lat),7]
coordset <- geocode_url(as.character(addr), auth='standard_api', privkey="",
                        clean=TRUE, add_date='today', verbose=TRUE)

codded <- rbind(codded, coordset[!is.na(coordset$lat),])
addr <- coordset[is.na(coordset$lat),7]
coordset <- geocode_url(as.character(addr), auth='standard_api', privkey="",
                        clean=TRUE, add_date='today', verbose=TRUE)
