library(dplyr)
library(httr)
library(jsonlite)
library(RCurl)
library(XML)

base.url <-"http://advance.lexis.com/api/search?"


basic.url<-"http://advance.lexis.com/api/"

#login authentication using RCurl
loginurl = "https://signin.lexisnexis.com/lnaccess/app/signin?back=https%3A%2F%2Fadvance.lexis.com%3A443%2Fnexis-uni&aci=nu"
loginurl ="advance.lexis.com"
#pars=list(ID="chiuyt19",Password="Chiu27905639@",submitButton = "Sign In")
pars=list(ID="chiuyt19",Password="Chiu27905639@")
agent ="Mozilla/5.0"


curl=getCurlHandle()
curlSetOpt(cookiejar="cookies.txt",useragent= agent, followlocation = TRUE, curl=curl)
html=postForm(loginurl, .params=pars, curl=curl, style="POST")

html=getURL(url.full, curl=curl)
doc = htmlParse(html, asText=TRUE)





#Chinese unicorn firm with 256 news article in the GUI search
search.term <- "UrWork"

#for terms with spaces, add "%20" to replace in the search

query.params<- paste0("q=", search.term)

url.full <- paste0(base.url, query.params,"&collection=news&qlang=bool&context=1516831")

#http://advance.lexis.com/api/search?{search-terms}&{collection}&{qlang}&(context)
#eg. http://advance.lexis.com/api/search?q=burden%20of%20proof&collection=cases&qlang=bool&context=1516831
#qlang = language optional collection = content type optional

response <- GET(url.full)
#the API is not REST API but uses cookie
body<-content(response,"text")
body = htmlParse(html, asText=TRUE)
