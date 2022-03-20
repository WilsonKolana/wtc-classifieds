from datetime import datetime
import email
from typing import List, Optional
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
    id:int
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
    listings: List[Listing] = []

    class Config:
        orm_mode = True
        arbitrary_types_allowed = True

class Token(BaseModel):
    access_token: str
    token_type: str

    
class TokenData(BaseModel):
    email: Optional[str] = None
    