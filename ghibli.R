rm(list = ls()); gc(); gc()

options(bitmapType='cairo')
options(scipen = 999)

library(httr)
library(jsonlite)
library(dplyr)
#library(tidyr)
library(ggplot2)

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







