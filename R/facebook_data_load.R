library(Rfacebook)
my_oauth <- fbOAuth(app_id = 1771457019771467, app_secret = app_secret)
me <- getUsers("me", token = my_oauth)
me
fb_oauth <- my_oauth
ids <- searchGroup(name="warszawa", token=fb_oauth) 
ids$name
at = "EAACEdEose0cBAF3VZBG0vMkm2llLaTCSIFdDglSboPA9nEBUY8o9riodjHVmZBjDkZCoF2iTJFQQA2Yl6GOID7ZBTyIhj8vb4ZCFhzZAT5Jy34r9hIKvDZBx33eSHof6BfwcMcTgw2RHDQESt2rkhlViCnCKnOIVMDijMb8NHXmJgZDZD"
ids <- searchGroup(name="warszawa", token=at) 
group <- getGroup(group_id=505131012882357, token=at)
group

pages <- searchPages(string="warszawa", token=at, n=5000)

?getFQL
d <- getFQL("SELECT uid2 FROM friend WHERE uid1=me()", token=fb_oauth)

getFQL(" SELECT name, start_time, venue FROM event WHERE CONTAINS('madison square garden')", at)
  