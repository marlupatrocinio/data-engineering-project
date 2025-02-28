from fastapi import FastAPI
import requests

app = FastAPI()

@app.get("/weather/{city}")
async def get_weather(city: str):
    api_key = "your_openweathermap_api_key"
    url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}"
    response = requests.get(url)
    return response.json()