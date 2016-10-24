json_url <- "https://api.um.warszawa.pl/api/action/datastore_search/?resource_id=b2ba1a3b-a146-4392-90fd-9e96ce43e1ec"
api_key <- "&apikey=b82dcf70-d120-43bf-bb91-dd7fd29c85be"

json_url <- paste0(json_url, api_key)

trams <- as.data.frame(fromJSON(json_url))

http://api.um.warszawa.pl/api/action/19115store_getNotificationsForNotificationNumber?id=28dc65ad-fff5-447b-99a3-95b71b4a7d1e&notificationNumber=123/45&apikey=w
