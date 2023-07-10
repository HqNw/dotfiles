#!/usr/bin/env python

import requests

# API key for OpenWeatherMap API
API_KEY = "d7687eb6dbf6f12f55a8888f68e72424"

# City for which to retrieve weather information
city = "Al Mansurah"

# Get weather information for the specified city
weather_data = requests.get(f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}").json()

# Extract the relevant information from the weather data
temp = weather_data["main"]["temp"]
temp_min = weather_data["main"]["temp_min"]
temp_max = weather_data["main"]["temp_max"]
description = weather_data["weather"][0]["description"]

# Display the information in a pretty format
print(f"Temperature: {temp}°C (min: {temp_min}°C, max: {temp_max}°C)\nConditions: {description}")
