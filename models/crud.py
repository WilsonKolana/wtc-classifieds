from sqlalchemy.orm import Session

from controllers import authentication
from . import models, schema

 

def get_user(db: Session, user_id: int):
    return db.query(models.User).filter(models.User.id == user_id).first()


def get_user_by_email(db: Session, email: str):
    return db.query(models.User).filter(models.User.email == email).first()


def get_users(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.User).offset(skip).limit(limit).all()


def create_user(db: Session, user: schema.UserCreate):
    
    db_user = models.User(email=user.email, 
                          password=authentication.get_password_hash(user.password),
                          name = user.name, 
                          surname = user.surname, 
                          campus = user.campus,
                          phone = user.phone)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user


def create_listing(db: Session, current_user:models.User, listing_data: schema.CreateListing):

    listing = models.Listing(title = listing_data.title,
                             description = listing_data.description,
                             image_id = listing_data.image_id,
                             start_price = listing_data.start_price,
                             end_date = listing_data.end_date)

    listing.owner = current_user
    db.add(listing)
    db.commit()
    db.refresh(listing)
    return listing




