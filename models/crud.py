from unicodedata import name
from sqlalchemy.orm import Session
from . import models, schema


def get_user(db: Session, user_id: int):
    return db.query(models.User).filter(models.User.id == user_id).first()


def get_user_by_email(db: Session, email: str):
    return db.query(models.User).filter(models.User.email == email).first()


def get_users(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.User).offset(skip).limit(limit).all()


def create_user(db: Session, user: schema.UserCreate):
    fake_hashed_password = user.password + "notreallyhashed"
    db_user = models.User(email=user.email, 
                          password=fake_hashed_password,
                          name = user.name, 
                          surname = user.surname, 
                          campus = user.campus,
                          phone = user.phone)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user


