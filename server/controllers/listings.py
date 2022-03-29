from typing import List
from . import authentication
from models import crud, models
from . import util
from models import schema
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session 

listing = APIRouter(prefix="")

@listing.post("/listing/create", response_model= schema.Listing)
async def add_listing(listing_data: schema.CreateListing, current_user: models.User = Depends(authentication.get_current_user), db: Session = Depends(util.get_db)):
    """"Add listing to the current users profile"""
    return crud.create_listing(db, current_user, listing_data)
    

@listing.get("/listings/", response_model= List[schema.Listing])
async def get_listings(db: Session = Depends(util.get_db)):
    """"get all the listings in the system"""
    return crud.get_all_listings(db)
    

@listing.post("/listing/bid", response_model= schema.Bid)
async def add_bid(bid_data: schema.BidCreate, current_user:  models.User = Depends(authentication.get_current_user), db: Session = Depends(util.get_db)):
     """"create a new bid on a listing"""
     return crud.create_bid(db, current_user, bid_data)
    
