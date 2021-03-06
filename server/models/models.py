
from operator import index
from sqlalchemy import Boolean, Column, Float, ForeignKey, Integer, String, DateTime, func
from data_access.database import Base
from sqlalchemy.orm import relationship

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String, index=True)
    surname = Column(String, index=True)
    email = Column(String, unique=True, index=True)
    campus = Column(String, index=True)
    phone = Column(String, index=True)
    password = Column(String)
    is_active = Column(Boolean, default=True)

    listings = relationship("Listing", back_populates="owner")
    biddings = relationship("Bid", back_populates="bidder")

class Listing(Base):
    __tablename__ = "listings"

    id = Column(Integer, primary_key=True, autoincrement=True)
    title = Column(String, index=True)
    description = Column(String, index=True)
    status = Column(String, index=True, default= "available")
    start_price = Column(Float, index = True)
    start_date = Column(DateTime(timezone=True), default=func.now())
    end_date = Column(DateTime, index=True)
    owner_id = Column(Integer, ForeignKey("users.id"))
    image_id = Column(String, index = True)

    owner = relationship("User", back_populates="listings")
    biddings = relationship("Bid", back_populates="listing")

class Bid(Base):
    __tablename__ = "biddings"

    id = Column(Integer, primary_key=True, autoincrement=True)
    listing_id = Column(Integer, ForeignKey("listings.id"))
    bidder_id = Column(Integer, ForeignKey("users.id"))
    bid_price = Column(Float, index = True)
    bid_date = Column(DateTime(timezone=True), default=func.now())
    bidder = relationship("User", back_populates="biddings")
    listing = relationship("Listing", back_populates="biddings")
    