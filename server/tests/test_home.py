# import sys
# sys.path.append("..")

from fastapi.testclient import TestClient

from api.server import app

client = TestClient(app)

def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"home": "hello wtc classifieds!"}

if __name__== "__main__":
    test_read_main()