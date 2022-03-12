#############################################
## This function sets up the config object
## 
#############################################
from os import environ

config = {
    ## Development Environment
    "ENV": environ.get("ENV") if environ.get("ENV") else "development",
    ## SECRET_KEY
    "SECRET_KEY": environ.get("SECRET_KEY") if environ.get("SECRET_KEY") else "secret",
    ## PORT
    "PORT": environ.get("PORT") if environ.get("PORT") else 7000,
}