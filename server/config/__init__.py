#############################################
## This function sets up the config object
## 
#############################################
from os import environ

config = {
    ## Development Environment
    "ENV": environ.get("ENV") if environ.get("ENV") else "development",
    ## PORT
    "PORT": environ.get("PORT") if environ.get("PORT") else 7000,
    ## Database URL
    "CLASSIFIEDS_DATABASE_URL" : environ.get("CLASSIFIEDS_DATABASE_URL") if environ.get("CLASSIFIEDS_DATABASE_URL") else "postgresql://postgres:root@localhost:5432/wtc_classifieds",
    ## SECRET_KEY
    "SECRET_KEY" : environ.get("SECRET_KEY") if  environ.get("SECRET_KEY") else "8e907290824c53125d11159dc436e0d5ff0761697107ac0ca8879bf72641f742",
    ##Hashing Algo
    "ALGORITHM" : environ.get("ALGORITHM") if environ.get("ALGORITHM") else "HS256"
}