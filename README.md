# ⛅ Flutter Weather App

A beautiful and functional **Weather Forecast App** built using **Flutter**. It displays real-time weather data, 7-day forecasts, sunrise/sunset times, UV index, and more — powered by a weather API like **OpenWeatherMap**.

---

## 🌤 UI Preview

![Weather App UI](https://github.com/MohameHassan139/weather_app/blob/main/assets/images/weather.png)

> Save the provided image as `screenshots/weather_ui.png` in your project folder to make this preview work.

---

## 🚀 Features

- 📍 Detect current location & weather
- 📅 7-Day Weather Forecast
- 🌡 Max & Min Temperatures
- 🌧 Real-Time Precipitation
- 🧭 Sunrise & Sunset Times
- ☁️ Air Quality Index & UV Index
- 🧑‍💻 API Integration with [OpenWeatherMap](https://openweathermap.org/)
- 🎨 Clean, animated UI
- 🌙 Light & Dark Theme support (optional)

---

## 🛠️ Built With

- **Flutter**
- **Dart**
- **OpenWeatherMap API**
- **Geolocator** – for fetching location
- **HTTP** – to make API calls
- **Provider / Bloc / Riverpod** – state management (mention what you used)
- **Lottie** – weather animations (optional)

---

## 🔌 How to Set Up

### 🧰 Prerequisites

- Flutter SDK installed
- API key from [OpenWeatherMap](https://openweathermap.org/api)

### ⚙️ Installation

```bash
# Clone the repository
git clone https://github.com/MohameHassan139/weather_app.git
cd flutter_weather_app

# Get packages
flutter pub get

# Add your API key
# in lib/services/weather_service.dart or .env file
const String apiKey = 'YOUR_API_KEY';

# Run the app
flutter run
