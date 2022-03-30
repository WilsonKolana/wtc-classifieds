
from fastapi.testclient import TestClient
from api.server import app
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from controllers.util import get_db
from data_access.database import Base


SQLALCHEMY_DATABASE_URL = "sqlite:///./test.db"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL, connect_args={"check_same_thread": False}
)
TestingSessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


Base.metadata.create_all(bind=engine)


def override_get_db():
    try:
        db = TestingSessionLocal()
        yield db
    finally:
        db.close()


app.dependency_overrides[get_db] = override_get_db

client = TestClient(app)

def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"home": "hello wtc classifieds!"}


def test_signup():
    json={"email": "deadpool3@example.com",
         "password": "pool",
          "campus": "JHB",
          "name":"dead",
          "surname":"pool",
          "phone":"06806455"}
    response = client.post("/api/users", json=json)
    print(response.json())
    assert response.status_code == 200
    data = response.json()
    assert data["email"] == "deadpool3@example.com"
    assert "id" in data
    assert data["campus"] == "JHB"
    assert data["name"] == "dead"
    assert data["phone"] == "06806455"


def test_login():
    json={"username": "deadpool3@example.com",
         "password": "pool",
         "grant_type":"",
         "scope":"",
         "client_id":"",
         "client_secret":""}
    response = client.post("/api/token", data=json)
    assert response.status_code == 200
    data = response.json()
    assert "access_token" in data
    assert data["token_type"] == "bearer"

def test_login():
    json={"username": "deadpool3@example.com",
         "password": "pool",
         "grant_type":"",
         "scope":"",
         "client_id":"",
         "client_secret":""}
    response = client.post("/api/token", data=json)
    assert response.status_code == 200
    data = response.json()
    assert "access_token" in data
    assert data["token_type"] == "bearer"


def test_read_loggedin_user():
    json={"username": "deadpool3@example.com",
         "password": "pool",
         "grant_type":"",
         "scope":"",
         "client_id":"",
         "client_secret":""}
    response = client.post("/api/token", data=json) #login first
    token = response.json()["access_token"]
    print(token)

    respose2 = client.get("/api/me", headers={"Authorization":"Bearer " + token})
    print(respose2.json())
    assert respose2.status_code == 200
    data = respose2.json()
    assert data["email"] == "deadpool3@example.com"

         
def test_create_listing():
    json={"username": "deadpool3@example.com",
         "password": "pool",
         "grant_type":"",
         "scope":"",
         "client_id":"",
         "client_secret":""}
    response = client.post("/api/token", data=json) #login first
    token = response.json()["access_token"]
    
    listing_data = {
                    "title": "laptop",
                    "description": "very slow laptop",
                    "status": "available",
                    "start_price": 200,
                    "end_date": "2022-03-30T04:04:37.831Z",
                    "image_id": "1"}

    respose2 = client.post("/listing/create", json=listing_data, headers={"Authorization":"Bearer " + token})
    print(respose2.json())
    assert respose2.status_code == 200
    data = respose2.json()
    assert data["title"] == "laptop"
    assert data["start_price"] == 200

         

    
    
   



if __name__== "__main__":
    test_read_main()