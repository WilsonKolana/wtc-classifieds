
from fastapi import APIRouter
from models import schema
from fastapi import Depends, HTTPException
from sqlalchemy.orm import Session
from models import crud, models, schema
from data_access.database import SessionLocal, engine

models.Base.metadata.create_all(bind=engine)

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
        

auth = APIRouter(prefix="")


@auth.post("/api/users", response_model=schema.User)
def signup(user_data: schema.UserCreate, db: Session = Depends(get_db)):
    """add new user"""
    user = crud.get_user_by_email(db, user_data.email)
    if user:
        raise HTTPException(status_code=409, 
                    detail="Email already registered.")
    signedup_user = crud.create_user(db, user_data)
    return signedup_user
