from datetime import datetime
import email
from email.mime import image
from typing import List, Optional
from pydantic import BaseModel
from pydantic import EmailStr


class ListingBase(BaseModel):
    title: str
    description: str
    status: Optional[str] = None
    start_price: float

class CreateListing(ListingBase):
    end_date: datetime
    image_id: int


class UserBase(BaseModel):
   email: Optional[EmailStr] = None
   name: str

class UserCreate(UserBase):
    surname: str
    phone: str
    campus: str
    password: str


class User(UserBase):
    id: Optional[int] = None
    is_active: Optional[bool] = None
    campus: Optional[str] = None
    phone: Optional[str] = None
    class Config:
        orm_mode = True
        arbitrary_types_allowed = True
        
class Bid(BaseModel):
    id:int
    bid_price:float
    bid_date: datetime
    bidder: User

    class Config:
        orm_mode = True

class Listing(ListingBase):
    id:int
    end_date: datetime
    image_id: int
    owner: User
    biddings: List[Bid] = []

    class Config:
        orm_mode = True

class Token(BaseModel):
    access_token: str
    token_type: str

    
class TokenData(BaseModel):
    email: Optional[str] = None

class BidCreate(BaseModel):
    listing_id: int
    bid_price: float


    