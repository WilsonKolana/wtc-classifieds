from fastapi import FastAPI
import uvicorn
from config import config
from controllers.home import home

## Create APP Object
app = FastAPI()

## Registering routes and routers
app.include_router(home)


if __name__ == "__main__":
    uvicorn.run(app, port = int(config["PORT"]))
