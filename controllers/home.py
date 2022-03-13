from fastapi import APIRouter

home = APIRouter(prefix="")

@home.get("/")
async def home_hello():
    return {"home": "hello wtc classifieds!"}
    