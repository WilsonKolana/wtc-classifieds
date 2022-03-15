from fastapi import FastAPI
import uvicorn
from config import config
from controllers.home import home
from controllers.authentication import auth

## Create APP Object
app = FastAPI()

## Registering routes and routers
app.include_router(home)
app.include_router(auth)


if __name__ == "__main__":
    uvicorn.run(app, port = int(config["PORT"]))
