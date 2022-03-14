from datetime import datetime
from typing import List
from pydantic import BaseModel
from pydantic import EmailStr


class ListingBase(BaseModel):
    title: str
    description: str
    status: str
    start_price: float

class CreateListing(ListingBase):
    end_date: datetime
    image_id: int

class Listing(ListingBase):
    end_date: datetime
    owner_id: int

    class Config:
        orm_mode = True

class UserBase(BaseModel):
   email: EmailStr

class UserCreate(UserBase):
    name: str
    surname: str
    phone: str
    campus: str
    password: str


class User(UserBase):
    id: int
    is_active: bool
    listings = List[Listing]

    class Config:
        orm_mode = True

    
