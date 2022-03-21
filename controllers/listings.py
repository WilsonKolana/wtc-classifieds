from controllers import authentication
from models import crud, models
from . import util
from models import schema
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session 

listing = APIRouter(prefix="")

@listing.post("/listing/create", response_model= schema.Listing)
async def add_listing(listing_data: schema.CreateListing, current_user: models.User = Depends(authentication.get_current_user), db: Session = Depends(util.get_db)):
    """"Add listing to the current users profile"""
    listing = crud.create_listing(db, current_user, listing_data)
    return listing