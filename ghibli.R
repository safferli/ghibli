rm(list = ls()); gc(); gc()

options(bitmapType='cairo')
options(scipen = 999)

library(httr)
library(jsonlite)
library(tidyverse)

# Define your workspace: "X:/xxx/"
wd <- "c:/github/ghibli/"
#wd <- path.expand("~/Documents/github/ghibli")
setwd(wd)



## API call wrapped in a function
f.call.ghibli.api <- function(endpoint, ...){
  
  # API address
  ghibli.api.base <- "https://ghibliapi.herokuapp.com/"
  
  # set up the API query
  ghibli.api <- httr::modify_url(
    # pagination goes via query = "page=0" in ... 
    ghibli.api.base, path = endpoint, ...
  )
  
  # call API
  r <- httr::GET(ghibli.api)
  # return API call
  return(r)
}

# testing with Totoro
f.call.ghibli.api(endpoint = list("films", "58611129-2dbc-4a81-a72f-77ddfc1b1b49"))








### testing

httr::GET(
  httr::modify_url(ghibli.api.base, path = list("films", NA))
)

films.r <- f.call.ghibli.api("films")

films <- fromJSON(content(films.r, "text"), flatten = F)





